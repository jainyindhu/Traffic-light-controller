🚦 Traffic Light Controller using Verilog HDL

📌 Project Description

This project implements a two-road Traffic Light Controller using Verilog HDL.

The controller uses a Finite State Machine (FSM) to control the traffic lights for two roads. Each road has three lights:

- Red
- Yellow
- Green

The controller follows a fixed sequence to ensure that only one road receives a green signal at a time.

The sequence is:

Road A Green
     ↓
Road A Yellow
     ↓
Road B Green
     ↓
Road B Yellow
     ↓
Road A Green

---

🎯 Objective

The objective of this project is to design and simulate a traffic light controller using:

- Finite State Machine (FSM)
- Sequential logic
- Combinational logic
- Counters
- Verilog HDL
- Testbench verification
- Waveform simulation

---

🚦 Traffic Light Configuration

Road A

- A_red
- A_yellow
- A_green

Road B

- B_red
- B_yellow
- B_green

---

🔧 Inputs

Signal| Description
"clk"| System clock
"reset"| Resets the controller

---

📤 Outputs

Signal| Description
"A_red"| Road A red light
"A_yellow"| Road A yellow light
"A_green"| Road A green light
"B_red"| Road B red light
"B_yellow"| Road B yellow light
"B_green"| Road B green light

---

🧠 FSM States

The controller contains four states:

S_A_GREEN
S_A_YELLOW
S_B_GREEN
S_B_YELLOW

State Flow

             ┌───────────────┐
             │               ▼
       ┌────────────┐   ┌─────────────┐
       │ A GREEN    │──►│ A YELLOW    │
       └────────────┘   └─────────────┘
                              │
                              ▼
                       ┌────────────┐
                       │ B GREEN    │
                       └────────────┘
                              │
                              ▼
                       ┌────────────┐
                       │ B YELLOW   │
                       └────────────┘
                              │
                              └──────► A GREEN

---

📊 State Table

State| Road A| Road B
A GREEN| 🟢 Green| 🔴 Red
A YELLOW| 🟡 Yellow| 🔴 Red
B GREEN| 🔴 Red| 🟢 Green
B YELLOW| 🔴 Red| 🟡 Yellow

---

⏱️ Timing

For simulation, the following timing values are used:

Light| Duration
Green| 5 clock cycles
Yellow| 2 clock cycles

These values can be changed using Verilog parameters:

parameter GREEN_TIME  = 5;
parameter YELLOW_TIME = 2;

---

🏗️ Block Diagram

                    ┌─────────────────────┐
                    │                     │
       clk ────────►│                     │
                    │ Traffic Light       │
     reset ────────►│ Controller FSM      │
                    │                     │
                    │                     │
                    └─────────┬───────────┘
                              │
              ┌───────────────┴───────────────┐
              │                               │
              ▼                               ▼
        ┌─────────────┐                 ┌─────────────┐
        │   Road A    │                 │   Road B    │
        │ R Y G       │                 │ R Y G       │
        └─────────────┘                 └─────────────┘

---

💻 Verilog Implementation

The controller uses an FSM to control the traffic lights.

Example:

case (state)

    S_A_GREEN: begin
        A_green = 1;
        B_red   = 1;
    end

    S_A_YELLOW: begin
        A_yellow = 1;
        B_red    = 1;
    end

    S_B_GREEN: begin
        A_red   = 1;
        B_green = 1;
    end

    S_B_YELLOW: begin
        A_red    = 1;
        B_yellow = 1;
    end

endcase

---

🧪 Testbench

The testbench performs the following operations:

1. Generates the system clock.
2. Applies reset.
3. Starts the traffic light controller.
4. Observes each FSM state.
5. Verifies the light sequence.
6. Generates a waveform file for simulation.

The simulation checks the transition:

A GREEN
   ↓
A YELLOW
   ↓
B GREEN
   ↓
B YELLOW
   ↓
A GREEN

---

🖥️ Expected Console Output

Typical output:

Time=16 | A: R=0 Y=0 G=1 | B: R=1 Y=0 G=0
Time=26 | A: R=0 Y=0 G=1 | B: R=1 Y=0 G=0
Time=36 | A: R=0 Y=0 G=1 | B: R=1 Y=0 G=0
Time=46 | A: R=0 Y=1 G=0 | B: R=1 Y=0 G=0
Time=56 | A: R=0 Y=1 G=0 | B: R=1 Y=0 G=0
Time=66 | A: R=1 Y=0 G=0 | B: R=0 Y=0 G=1

The exact timestamps can vary depending on simulator scheduling, but the light sequence should remain the same.

---

📈 Simulation

The testbench generates:

waveform.vcd

The waveform can be viewed using GTKWave.

Important signals to observe

- "clk"
- "reset"
- "A_red"
- "A_yellow"
- "A_green"
- "B_red"
- "B_yellow"
- "B_green"

Save the waveform screenshot as:

simulation/waveform.png

---

▶️ How to Run the Simulation

Step 1: Compile

Using Icarus Verilog:

iverilog -o traffic_light_sim traffic_light_controller.v traffic_light_controller_tb.v

Step 2: Run

vvp traffic_light_sim

Step 3: View Waveform

gtkwave waveform.vcd

---

🛠️ Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- GitHub

---

📚 Applications

Traffic light controllers are used in:

- Road intersections
- Railway crossing systems
- Pedestrian crossing systems
- Intelligent transportation systems
- Embedded control systems
- FPGA-based control systems

---

⭐ Key Learning Outcomes

This project demonstrates:

- Finite State Machine design
- Sequential logic
- State transitions
- Timing and counters
- Traffic signal control
- Verilog HDL coding
- Testbench development
- Waveform simulation
- GitHub project organization

---

👩‍💻 Author

JAINY INDHU

Electronics and Communication Engineering