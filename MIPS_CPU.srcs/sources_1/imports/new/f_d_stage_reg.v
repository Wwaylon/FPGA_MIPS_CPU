module f_d_stage_reg(
    input clk, rst,
    input [31:0] instrF,
    input [31:0] pc_plus4F,
    output reg [31:0] instrD,
    output reg [31:0] pc_plus4D
    );
    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            instrD    <= 0;
            pc_plus4D <= 0;
        end
        else begin
            instrD    <= instrF;
            pc_plus4D <= pc_plus4F;
        end
    end
endmodule