// Traffic Light Controller using FSM
// Two-road traffic light controller

module traffic_light_controller #(
    parameter GREEN_TIME  = 5,
    parameter YELLOW_TIME = 2
)(
    input clk,
    input reset,

    output reg A_red,
    output reg A_yellow,
    output reg A_green,

    output reg B_red,
    output reg B_yellow,
    output reg B_green
);

    // State declaration
    parameter S_A_GREEN  = 2'b00;
    parameter S_A_YELLOW = 2'b01;
    parameter S_B_GREEN  = 2'b10;
    parameter S_B_YELLOW = 2'b11;

    reg [1:0] state;
    reg [1:0] next_state;

    reg [3:0] count;

    // State register and counter
    always @(posedge clk or posedge reset) begin

        if (reset) begin
            state <= S_A_GREEN;
            count <= 0;
        end

        else begin

            if ((state == S_A_GREEN) && (count == GREEN_TIME-1)) begin
                state <= S_A_YELLOW;
                count <= 0;
            end

            else if ((state == S_A_YELLOW) &&
                     (count == YELLOW_TIME-1)) begin
                state <= S_B_GREEN;
                count <= 0;
            end

            else if ((state == S_B_GREEN) &&
                     (count == GREEN_TIME-1)) begin
                state <= S_B_YELLOW;
                count <= 0;
            end

            else if ((state == S_B_YELLOW) &&
                     (count == YELLOW_TIME-1)) begin
                state <= S_A_GREEN;
                count <= 0;
            end

            else begin
                count <= count + 1;
            end

        end
    end

    // Output logic
    always @(*) begin

        // Default: all lights OFF
        A_red    = 0;
        A_yellow = 0;
        A_green  = 0;

        B_red    = 0;
        B_yellow = 0;
        B_green  = 0;

        case (state)

            // Road A Green
            S_A_GREEN: begin
                A_green = 1;
                B_red   = 1;
            end

            // Road A Yellow
            S_A_YELLOW: begin
                A_yellow = 1;
                B_red    = 1;
            end

            // Road B Green
            S_B_GREEN: begin
                A_red   = 1;
                B_green = 1;
            end

            // Road B Yellow
            S_B_YELLOW: begin
                A_red    = 1;
                B_yellow = 1;
            end

            default: begin
                A_red = 1;
                B_red = 1;
            end

        endcase
    end

endmodule