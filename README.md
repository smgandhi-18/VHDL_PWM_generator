# PWM_generator_VHDL
PWM generator
# PWM Generator VHDL

## Overview

This VHDL code implements a Pulse-Width Modulation (PWM) generator with varying duty cycles. The PWM signal is generated based on user-selectable options using DIP switches. The output PWM signal can be observed on LEDs or an oscilloscope.

## Project Details

- **Engineer:** Shyama Gandhi
- **Create Date:** 20 October 2023
- **Design Name:** PWM Generator with Varying Duty Cycle
- **Module Name:** PWM

## Contents

- `pwm_generator.vhdl`: Main VHDL code file.
- `clock_divider.vhdl`: Clock divider module used in the design.
- `README.txt`: Project documentation.

## Usage

1. Configure DIP switches (`sw_select`) to select the desired PWM frequency.
2. Observe the PWM signal on the output ports:
   - `pwm_sig_out_led`: PWM signal for LED display
   - `pwm_sig_out_scope`: PWM signal for oscilloscope

## Configuration Options

- **Frequency Options:**
  - "0001": 4 Hz
  - "0010": 2 Hz
  - "0100": 1.33 Hz
  - Others: 1 Hz (default)

## Dependencies

- IEEE.STD_LOGIC_1164.ALL
- IEEE.NUMERIC_STD.ALL

## License

MIT License
[View License Details](LICENSE)

## Revision History

- **Revision 0.01:** File Created

## Notes

Include any additional comments or notes about the code or project.

