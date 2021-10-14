library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library neorv32;
use neorv32.neorv32_package.all;

library work;
use work.global_configuration.all;

entity neorv32_littlebee_top is
  generic (
    FPGA_MANUFACTURER : STRING  := c_FPGA_MANUFACTURER;
    CLOCK_FREQUENCY   : natural := c_CLOCK_FREQUENCY;  -- clock frequency of clk_i in Hz
    MEM_INT_IMEM_SIZE : natural := 32*1024;   -- size of processor-internal instruction memory in bytes
    MEM_INT_DMEM_SIZE : natural := 8*1024;    -- size of processor-internal data memory in bytes
    IO_SPI_EN         : boolean := true       -- implement serial peripheral interface (SPI)?
  );
  port (
    -- Global signals
    clk_i               : in  std_ulogic;
    rstn_i              : in  std_ulogic;
    -- GPIO
    gpio_o              : out std_ulogic_vector(7 downto 0);
    -- UART 0
    uart0_txd_o         : out std_ulogic;
    uart0_rxd_i         : in  std_ulogic;
    -- Serial Flash
    flash_cs_o          : out std_logic;
    flash_clk_o         : out std_logic;
    flash_so            : out std_logic;
    flash_si            : in  std_logic;
    flash_i02           : out std_logic;
    flash_i03           : out std_logic;
    -- TWI
    twi_sda_io          : inout std_logic;
    twi_scl_io          : inout std_logic
  );
end entity;

architecture neorv32_littlebee_top_rtl of neorv32_littlebee_top is

  -- SPI
  constant c_spi_csn_flash_index      : integer := 0;
  -- GPIO
  signal con_gpio_o                   : std_ulogic_vector(63 downto 0);
  signal con_gpio_i                   : std_ulogic_vector(63 downto 0);
  signal clock_30mhz                  : std_logic;
  -- SPI 
  signal spi_sck                      : std_ulogic;
  signal spi_sdo                      : std_ulogic;
  signal spi_sdi                      : std_ulogic;
  signal spi_csn                      : std_ulogic_vector(7 downto 0);

begin

  -- Main PLL
  gen_gowin_pll : if FPGA_MANUFACTURER = "GOWIN" GENERATE
    inst_pll : entity work.main_rpll
    port map(
      clkin     => clk_i,
      clkout    => clock_30mhz
    );
  end generate gen_gowin_pll;

  gen_intel_pll : if FPGA_MANUFACTURER = "INTEL" GENERATE
    clock_30mhz <= clk_i;
  end generate gen_intel_pll;

  -- NEORV32
  neorv32_top_inst: neorv32_top
  generic map (
    -- General --
    CLOCK_FREQUENCY              => CLOCK_FREQUENCY,   -- clock frequency of clk_i in Hz
    INT_BOOTLOADER_EN            => true,              -- boot configuration: true = boot explicit bootloader; false = boot from int/ext (I)MEM
    -- RISC-V CPU Extensions --
    CPU_EXTENSION_RISCV_C        => true,              -- implement compressed extension?
    CPU_EXTENSION_RISCV_M        => true,              -- implement mul/div extension?
    CPU_EXTENSION_RISCV_Zicsr    => true,              -- implement CSR system?
    -- Internal Instruction memory --
    MEM_INT_IMEM_EN              => true,              -- implement processor-internal instruction memory
    MEM_INT_IMEM_SIZE            => MEM_INT_IMEM_SIZE, -- size of processor-internal instruction memory in bytes
    -- Internal Data memory --
    MEM_INT_DMEM_EN              => true,              -- implement processor-internal data memory
    MEM_INT_DMEM_SIZE            => MEM_INT_DMEM_SIZE, -- size of processor-internal data memory in bytes
    -- Processor peripherals --
    IO_GPIO_EN                   => true,              -- implement general purpose input/output port unit (GPIO)?
    IO_MTIME_EN                  => true,              -- implement machine system timer (MTIME)?
    IO_UART0_EN                  => true,              -- implement primary universal asynchronous receiver/transmitter (UART0)?
    IO_TWI_EN                    => true,              -- implement two-wire interface (TWI)?
    -- Processor peripherals --
    IO_SPI_EN                    => IO_SPI_EN
  )
  port map (
    -- Global control --
    clk_i                       => clock_30mhz,
    rstn_i                      => rstn_i,
    -- GPIO
    gpio_o                      => con_gpio_o,
    gpio_i                      => con_gpio_i,
    -- Primary UART0
    uart0_txd_o                 => uart0_txd_o,
    uart0_rxd_i                 => uart0_rxd_i,
    -- SPI
    spi_sck_o                   => spi_sck,
    spi_sdo_o                   => spi_sdo,
    spi_sdi_i                   => spi_sdi,
    spi_csn_o                   => spi_csn,
    -- TWI (available if IO_TWI_EN = true) --
    twi_sda_io                  => twi_sda_io,
    twi_scl_io                  => twi_scl_io
  );

  -- GPIO output
  gpio_o            <= con_gpio_o(7 downto 0);
  -- Flash
  flash_cs_o        <= spi_csn(c_spi_csn_flash_index);
  flash_clk_o       <= spi_sck;
  flash_so          <= spi_sdo;
  flash_i02         <= 'Z';
  flash_i03         <= 'Z';
  -- SPI CSn multiplexer
  proc_flash_din_mux : process(spi_csn, flash_si, spi_sdi)
  begin
    case spi_csn is
      when b"11111110" => spi_sdi <= flash_si;
      when others => spi_sdi <= '1';
    end case;
  end process;
  --=======================================================
end architecture;
