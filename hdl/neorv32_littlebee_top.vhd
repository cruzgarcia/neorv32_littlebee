library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library neorv32;
use neorv32.neorv32_package.all;

entity neorv32_littlebee_top is
  generic (
    CLOCK_FREQUENCY   : natural := 30000000;  -- clock frequency of clk_i in Hz
    MEM_INT_IMEM_SIZE : natural := 32*1024;   -- size of processor-internal instruction memory in bytes
    MEM_INT_DMEM_SIZE : natural := 8*1024;    -- size of processor-internal data memory in bytes
    IO_SPI_EN         : boolean := true       -- implement serial peripheral interface (SPI)?
  );
  port (
    -- Global control --
    clk_i             : in  std_ulogic; -- global clock, rising edge
    rstn_i            : in  std_ulogic; -- global reset, low-active, async
    -- GPIO --
    gpio_o            : out std_ulogic_vector(7 downto 0); -- parallel output
    -- UART0 --
    uart0_txd_o       : out std_ulogic; -- UART0 send data
    uart0_rxd_i       : in  std_ulogic; -- UART0 receive data
    -- SPI - ePaper display
    epaper_busy_i     : in  std_ulogic;
    epaper_rst_o      : out std_ulogic;
    epaper_dc_o       : out std_ulogic;
    epaper_spi_sck_o  : out std_ulogic;       -- SPI serial clock
    epaper_spi_sdo_o  : out std_ulogic;       -- controller data out, peripheral data in
    epaper_spi_sdi_i  : in  std_ulogic:= 'U'; -- controller data in, peripheral data out
    epaper_spi_csn_o  : out std_ulogic;       -- chip select
    -- Serial Flash
    flash_cs_o        : out std_logic;
    flash_clk_o       : out std_logic;
    flash_so          : out std_logic;
    flash_si          : in  std_logic;
    flash_i02         : out std_logic;
    flash_i03         : out std_logic
  );
end entity;

architecture neorv32_littlebee_top_rtl of neorv32_littlebee_top is

  -- SPI
  constant c_spi_csn_flash_index    : integer := 0;
  constant c_spi_csn_epaper_index   : integer := 1;

  signal con_gpio_o   : std_ulogic_vector(63 downto 0);
  signal con_gpio_i   : std_ulogic_vector(63 downto 0);
  signal clock_30mhz  : std_logic;
  -- SPI 
  signal spi_sck      : std_ulogic;
  signal spi_sdo      : std_ulogic;
  signal spi_sdi      : std_ulogic;
  signal spi_csn      : std_ulogic_vector(7 downto 0);

begin

  -- Main PLL
  inst_pll : entity work.main_rpll
  port map(
    clkin     => clk_i,
    clkout    => clock_30mhz
  );

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
    -- Processor peripherals --
    IO_SPI_EN                    => IO_SPI_EN
  )
  port map (
    -- Global control --
    clk_i       => clock_30mhz,
    rstn_i      => rstn_i,      -- global reset, low-active, async
    -- GPIO (available if IO_GPIO_EN = true) --
    gpio_o      => con_gpio_o,
    gpio_i      => con_gpio_i,
    -- primary UART0 (available if IO_UART0_EN = true) --
    uart0_txd_o => uart0_txd_o,
    uart0_rxd_i => uart0_rxd_i,
    -- SPI (available if IO_SPI_EN = true) --
    spi_sck_o   => spi_sck,
    spi_sdo_o   => spi_sdo,
    spi_sdi_i   => spi_sdi,
    spi_csn_o   => spi_csn
  );

  -- GPIO output
  gpio_o <= con_gpio_o(7 downto 0);

  -- e-Paper display SPI
  epaper_rst_o      <= con_gpio_o(8);
  epaper_dc_o       <= con_gpio_o(9);
  epaper_spi_sck_o  <= spi_sck;
  epaper_spi_sdo_o  <= spi_sdo;
  epaper_spi_csn_o  <= spi_csn(c_spi_csn_epaper_index);
  con_gpio_i(10)    <= epaper_busy_i;

  -- Flash
  flash_cs_o        <= spi_csn(c_spi_csn_epaper_index);
  flash_clk_o       <= spi_sck;
  flash_so          <= spi_sdo;
  flash_i02         <= 'Z';
  flash_i03         <= 'Z';


  proc_flash_din_mux : process(all)
  begin
    case spi_csn is
      when b"11111110" => spi_sdi <= flash_si;
      when b"11111101" => spi_sdi <= epaper_spi_sdi_i;
      when others => spi_sdi <= '1';
    end case;
  end process;

end architecture;
