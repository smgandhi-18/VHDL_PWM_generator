----------------------------------------------------------------------------------
-- Filename : pwm_generator.vhdl
-- Engineer: Shyama Gandhi
-- 
-- Create Date: 20 October, 2023
-- Design Name: PWM Generator with Varying Duty Cycle
-- Module Name: PWM
-- Project Name: [Your Project Name, if applicable]
-- Target Devices: [Specify the target FPGA or devices, if applicable]
-- Tool Versions: [Specify the tools and versions used, if applicable]
-- Description:
--   This VHDL code defines a PWM (Pulse-Width Modulation) generator with variable duty cycles. 
--   The PWM signal is generated based on user-selectable options using DIP switches. 
--   The output PWM signal can be observed on LEDs or an oscilloscope.
-- 
-- Dependencies: [List any external dependencies or prerequisites]
-- 
-- Revision:
--   Revision 0.01 - File Created
-- Additional Comments:
--   [Include any additional comments or notes about the code]

-- 
-- MIT License
-- Copyright (c) 2023, Shyama Gandhi
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity PWM is
    Port ( clk : in STD_LOGIC;
           sw_select : in STD_LOGIC_VECTOR (3 downto 0);
           pwm_sig_out_led : out std_logic;
           pwm_sig_out_scope : out std_logic);
end PWM;

architecture Behavioral of PWM is

signal threshold : integer := 0;
signal pwm_sig : std_logic:= '0';
signal counter : integer := 0;

signal clock_signal_divided: STD_LOGIC;

begin

pwm_sig_out_led <= pwm_sig; //diverting the signal to led
pwm_sig_out_scope <= pwm_sig;	//diverting the signal to pmod pin to be viewed on oscilloscope

-------------

    clock_div: entity work.clock_divider(Behavioral)
        generic map (freq_out => 1000)
        port map( clock=>clk
                , clock_div=>clock_signal_divided
                );
-------------
    process (sw_select)
    begin
        case sw_select is
            when "0001" =>
                threshold <= 31_250_000 ; -- 4 Hz PWM : threshold = (1/4Hz) * (125,000,000 Hz) = 31,250,000
            when "0010" =>
                threshold <= 62_500_000;  -- 2 Hz
            when "0100" =>
                threshold <= 93_984_962;  -- 1.33 Hz
            when others =>
                threshold <= 125_000_000; -- 1 Hz
                -- 0.1 Hz
            
        end case;
    end process;

-------------

    process (clk) is
        begin
        if rising_edge (clk) then
            if  threshold > counter   then
                counter <= counter + 1;
            else
                counter <= 0 ;
                pwm_sig <= NOT pwm_sig;
            end if;
        end if;
    end process;
end Behavioral;      
