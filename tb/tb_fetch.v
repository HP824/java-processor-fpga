`timescale 1ns/1ps
module tb_fetch;
    reg clk = 0, rst = 1;
    wire [7:0] instr;
    wire [11:0] pc;
    wire valid;

    fetch uut (
        .clk(clk),
        .rst(rst),
        .instr(instr),
        .pc(pc),
        .valid(valid)
    );

    always #5 clk = ~clk; // 100MHz simulation clock

    initial begin
        $dumpfile("fetch.vcd");
        $dumpvars(0, tb_fetch);
        #20 rst = 0;
        #120 $finish;
    end

    always @(posedge clk) if (valid)
        $display("Fetched: %02x (PC=%d)", instr, pc);
endmodule

