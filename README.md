# IOT_FPGA-Based Projects

This repository contains a collection of FPGA projects that demonstrate the use of various sensors, interfaces, and peripherals with HDL (VHDL) designs. Each project is structured to provide clear functionality, test hardware concepts, and learn about digital design.

---

## Table of Contents

1. [IR Motor Control](#1-ir-motor-control)
2. [Gas Sensor Integration](#2-gas-sensor-integration)
3. [LCD Interface](#3-lcd-interface)
4. [UCF Constraints for IOT](#4-ucf-constraints-for-iot)

---

## 1. IR Motor Control

### Description
This project demonstrates the use of an infrared (IR) sensor to control a motor. When the IR sensor detects an object, the motor is activated.

### Features
- IR-based object detection.
- Motor activation upon object detection.

### Hardware Requirements
- FPGA Board
- IR Sensor
- Motor Driver and Motor

### VHDL Entity
```vhdl
entity irmotor is
  Port (
    ir  : in  STD_LOGIC;  -- Input from IR sensor
    mot : out STD_LOGIC   -- Motor control signal
  );
end irmotor;
```

---

## 2. Gas Sensor Integration

### Description
This project interfaces a gas sensor with an FPGA to control an LED. The LED lights up when gas is detected.

### Features
- Gas detection using a gas sensor.
- LED indication for gas presence.

### Hardware Requirements
- FPGA Board
- Gas Sensor
- LED

### VHDL Entity
```vhdl
entity gas_sensor is
  Port (
    sw  : in  STD_LOGIC;  -- Gas sensor input
    led : out STD_LOGIC   -- LED control signal
  );
end gas_sensor;
```

---

## 3. LCD Interface

### Description
This project connects an FPGA to a 16x2 LCD display and demonstrates data display capabilities. It uses commands and data to display temperature and light levels dynamically.

### Features
- Command and data-based LCD control.
- Dynamic display of sensor data.

### Hardware Requirements
- FPGA Board
- 16x2 LCD

### VHDL Entity
```vhdl
entity LCD is
  Port (
    clk         : in  STD_LOGIC;                  -- Clock input
    lcd_e       : out STD_LOGIC;                 -- LCD enable control
    lcd_rs      : out STD_LOGIC;                 -- LCD command/data control
    data        : out STD_LOGIC_VECTOR(7 downto 0); -- Data lines
    chsel       : out STD_LOGIC;                 -- Channel select signal
    temp_data2  : in  STD_LOGIC_VECTOR(7 downto 0); -- Temperature data
    temp_data3  : in  STD_LOGIC_VECTOR(7 downto 0); -- Additional temperature data
    ldr_data1   : in  STD_LOGIC_VECTOR(7 downto 0); -- LDR data 1
    ldr_data2   : in  STD_LOGIC_VECTOR(7 downto 0); -- LDR data 2
    ldr_data3   : in  STD_LOGIC_VECTOR(7 downto 0)  -- LDR data 3
  );
end LCD;
```

---

## 4. UCF Constraints for IOT

### Description
The User Constraints File (UCF) maps the FPGA pins to external hardware components, ensuring proper connection and functionality.

### UCF Pin Mapping
| Signal       | FPGA Pin | Description                           |
|--------------|----------|---------------------------------------|
| clk          | P84      | Clock input                          |
| txd          | P87      | TX Data for communication            |
| cs           | P118     | Chip Select                          |
| din          | P119     | Data In                              |
| do           | P120     | Data Out                             |
| sc           | P121     | Serial Clock                         |
| data(0-7)    | P23-P33  | LCD data lines                       |
| lcd_e        | P35      | LCD enable                           |
| lcd_rs       | P34      | LCD command/data                     |
| gsw          | P47      | Gas sensor input                     |
| gas          | P85      | Gas sensor control                   |
| ir           | P46      | IR sensor input                      |
| mot          | P48      | Motor control                        |

---

## How to Use
### Step 1: Synthesize the Design
- Use an HDL tool (e.g., Xilinx Vivado, Quartus) to synthesize the provided VHDL files.

### Step 2: Map the Pins
- Apply the UCF constraints to map FPGA pins to the external hardware components.

### Step 3: Program the FPGA
- Upload the synthesized bitstream to the FPGA.

### Step 4: Test the System
- Connect the required sensors and peripherals.
- Observe the behavior and functionality.

---

## Troubleshooting
### LCD Display Issues
- Ensure the clock frequency is appropriate for the LCD.
- Verify the connections for data and control signals.

### Sensor Malfunction
- Check the power supply to the sensors.
- Ensure the signal is correctly routed to the FPGA.

---

## License - MIT License

---

## Author
**Sai Teja Jarabala**

For questions, suggestions, or contributions, feel free to contact [Sai Teja Jarabala](https://github.com/jsaiteja2001).

---

### Summary

This **README.md** provides:
1. **Project Details**: Description, features, and hardware requirements for each module.
2. **UCF Constraints**: Mapping of FPGA pins for external components.
3. **Licensing**: Project under the MIT License.
4. **Author Information**: Contact for collaboration or queries.
