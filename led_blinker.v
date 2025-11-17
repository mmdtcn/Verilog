module led_blinker (
    input  wire clk,        // 50 MHz FPGA clock
    input  wire rst_n,      // active-low reset (pushbutton)
    output reg  led
);
    // Divide 50 MHz down to ~1 Hz
    reg [25:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            led <= 0;
        end else begin
            counter <= counter + 1;
            if (counter == 26'd25_000_000) begin
                counter <= 0;
                led <= ~led;   // toggle LED
            end
        end
    end
endmodule
