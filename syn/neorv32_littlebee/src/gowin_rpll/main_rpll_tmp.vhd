--Copyright (C)2014-2021 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.8
--Part Number: GW1NR-LV9QN88C5/I4
--Device: GW1NR-9
--Created Time: Sat Sep 11 22:57:42 2021

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component main_rpll
    port (
        clkout: out std_logic;
        clkin: in std_logic
    );
end component;

your_instance_name: main_rpll
    port map (
        clkout => clkout_o,
        clkin => clkin_i
    );

----------Copy end-------------------
