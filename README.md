1. [Overview](#1-Overview)
2. [Getting Startet](#2-Getting-Startet)


## 1. Overview

Implementation of the [NEORV32](https://github.com/stnolting/neorv32) on the [GOWIN LittleBee 1NR9 FPGA](https://shop.trenz-electronic.de/en/TEC0117-01-FPGA-Module-with-GOWIN-LittleBee-and-8-MByte-internal-SDRAM?c=508) 

## 2. Getting Startet

Clone the repository and update the submodules

    git clone git@github.com:cruzgarcia/neorv32_littlebee.git
    cd neorv32_littlebee
    git submodule init
    git submdoule update

Compile the project (given that GOWIN tools are in $PATH)

    cd syn 
    gw_sh gowin_compile_project.tcl
    
Compilation products are generated under syn/impl. Alternatively, you can open the GOWIN project under syn/neorv32_littlebee
    