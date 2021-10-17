# Add neorv32 files
# No regex supported :(
add_file -type vhdl ../submodules/neorv32/rtl/core/mem/neorv32_dmem.default.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/mem/neorv32_imem.default.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_application_image.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_boot_rom.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_bootloader_image.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_bus_keeper.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_busswitch.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cfs.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu_alu.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu_bus.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu_control.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu_cp_bitmanip.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu_cp_fpu.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu_cp_muldiv.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu_cp_shifter.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu_decompressor.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_cpu_regfile.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_debug_dm.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_debug_dtm.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_dmem.entity.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_fifo.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_gpio.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_icache.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_imem.entity.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_mtime.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_neoled.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_package.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_pwm.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_slink.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_spi.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_sysinfo.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_top.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_trng.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_twi.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_uart.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_wdt.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_wishbone.vhd
add_file -type vhdl ../submodules/neorv32/rtl/core/neorv32_xirq.vhd

# File properties
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/mem/neorv32_dmem.default.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/mem/neorv32_imem.default.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_application_image.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_boot_rom.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_bootloader_image.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_bus_keeper.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_busswitch.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cfs.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu_alu.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu_bus.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu_control.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu_cp_bitmanip.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu_cp_fpu.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu_cp_muldiv.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu_cp_shifter.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu_decompressor.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_cpu_regfile.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_debug_dm.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_debug_dtm.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_dmem.entity.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_fifo.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_gpio.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_icache.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_imem.entity.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_mtime.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_neoled.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_package.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_pwm.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_slink.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_spi.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_sysinfo.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_top.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_trng.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_twi.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_uart.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_wdt.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_wishbone.vhd
set_file_prop -lib neorv32 ../submodules/neorv32/rtl/core/neorv32_xirq.vhd

# Top design sources
add_file ../hdl/littlebee_pkg.vhd
add_file ../hdl/neorv32_littlebee_top.vhd
add_file neorv32_littlebee/src/gowin_rpll/main_rpll.vhd

# Constraints
add_file neorv32_littlebee.cst
add_file neorv32_littlebee.gsc

# Set device
set_device -name GW1NR-9 GW1NR-LV9QN88C6/I5

# Run
run all
