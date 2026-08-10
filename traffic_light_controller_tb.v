`timescale 1ns/1ps

module traffic_light_controller_tb;

    reg clk;
    reg reset;

    wire A_red;
    wire A_yellow;
    wire A_green;

    wire B_red;
    wire B_yellow;
    wire B_green;

    // Instantiate Traffic Light Controller
    traffic_light_controller #(
        .GREEN_TIME(5),
        .YELLOW_TIME(2)
    ) uut (
        .clk(clk),
        .reset(reset),

        .A_red(A_red),
        .A_yellow(A_yellow),
        .A_green(A_green),

        .B_red(B_red),
        .B_yellow(B_yellow),
        .B_green(B_green)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("waveform.vcd");
        $dumpvars(0, traffic_light_controller_tb);

        clk = 0;
        reset = 1;

        #15;

        reset = 0;

        // Run simulation
        #150;

        $finish;
    end

    // Display traffic light status
    always @(posedge clk) begin

        #1;

        $display(
            "Time=%0t | A: R=%b Y=%b G=%b | B: R=%b Y=%b G=%b",
            $time,
            A_red,
            A_yellow,
            A_green,
            B_red,
            B_yellow,
            B_green
        );

    end

endmodule