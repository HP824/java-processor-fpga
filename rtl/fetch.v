module fetch (
    input clk,
    input rst,
    output reg [7:0] instr,
    output reg [11:0] pc,
    output reg valid
);
    reg [7:0] rom [0:4095];
    initial $readmemh("roms/test_prog.mem", rom);

    always @(posedge clk) begin
        if (rst) begin
            pc <= 0;
            valid <= 0;
        end else begin
            instr <= rom[pc];
            valid <= 1;
            pc <= pc + 1;
        end
    end
endmodule
