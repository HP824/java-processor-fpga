`timescale 1ns/1ps
module tb_decode;
    reg clk = 0;
    reg rst = 1;
    reg [7:0] instr;
    reg valid;

    wire [3:0] opcode;
    wire [3:0] operand;

    decode uut(
        .clk(clk),
        .rst(rst),
        .instr(instr),
        .valid(valid),
        .opcode(opcode),
        .operand(operand)
    );

    always #5 clk = ~clk; // 100 MHz clock

    initial begin
        $dumpfile("decode.vcd");
        $dumpvars(0, tb_decode);

        // Release reset
        #10 rst = 0;

        // Test a few instructions  
        instr = 8'h12; valid = 1; #10;  // opcode=1, operand=2
        instr = 8'h4F; valid = 1; #10;  // opcode=4, operand=15
        instr = 8'h20; valid = 1; #10;  // opcode=2, operand=0

        valid = 0; instr = 8'h00; #10;  // test valid low

        $finish;
    end

    always @(posedge clk) begin
        if (valid)
            $display("Instr=%02h -> opcode=%h, operand=%h", instr, opcode, operand);
    end
endmodule
