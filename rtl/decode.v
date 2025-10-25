module decode (
    input  wire clk,
    input  wire rst,
    input  wire [7:0] instr,   // instruction from fetch
    input  wire valid,          // valid signal from fetch

    output reg [3:0] opcode,    // upper 4 bits
    output reg [3:0] operand    // lower 4 bits
);

    always @(posedge clk) begin
        if (rst) begin
            opcode  <= 4'b0000;
            operand <= 4'b0000;
        end else if (valid) begin
            opcode  <= instr[7:4];
            operand <= instr[3:0];
        end
    end

endmodule
