
module d_e_stage_reg(
    input clk, rst,
    input hilo_we,
    input jump,
    input jr_mux_sel,
    input [1:0] wd_sel,
    input dm2reg,
    input we_dm,
    input branch,
    input [3:0] alu_ctrl,
    input alu_src,
    input reg_dst,
    input we_reg,
    input jal_wa,
    input jal_wd,
    input [31:0] rd1,
    input [31:0] rd2,
    input [4:0] shamtD,
    input [4:0] instr_20_16,
    input [4:0] instr_15_11,
    input [31:0] sext_immD,
    input [31:0] jtaD,
    input [31:0] pc_plus4D,
    input [31:0] btaD,

    output reg hilo_weE,
    output reg jumpE,
    output reg jr_mux_selE,
    output reg [1:0] wd_selE,
    output reg dm2regE,
    output reg we_dmE,
    output reg branchE,
    output reg [3:0]  alu_ctrlE,
    output reg alu_srcE,
    output reg reg_dstE,
    output reg we_regE,
    output reg jal_waE,
    output reg jal_wdE,
    output reg [31:0] rd1E,
    output reg [31:0] rd2E,
    output reg [4:0] shamtE,
    output reg  [4:0] instr_20_16E,
    output reg  [4:0] instr_15_11E,
    output reg [31:0] sext_immE,
    output reg [31:0] jtaE,
    output reg [31:0] pc_plus4E,
    output reg [31:0] btaE
    
    );
    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            hilo_weE <= 0;
            jumpE <= 0;
            jr_mux_selE <= 0;
            wd_selE <= 0;
            dm2regE <= 0;
            we_dmE <= 0;
            branchE <= 0;
            alu_ctrlE <= 0;
            alu_srcE <= 0;
            reg_dstE <= 0;
            we_regE <= 0;
            jal_waE <= 0;
            jal_wdE <= 0;
            rd1E <= 0;
            rd2E <= 0;
            instr_20_16E <= 0;
            instr_15_11E <= 0;
            sext_immE <= 0;
            jtaE <= 0;
            pc_plus4E <= 0;
            btaE <= 0;
        end
        else begin
            hilo_weE <= hilo_we;
            jumpE <= jump;
            jr_mux_selE <= jr_mux_sel;
            wd_selE <= wd_sel;
            dm2regE <= dm2reg;
            we_dmE <= we_dm;
            branchE <= branch;
            alu_ctrlE <= alu_ctrl;
            alu_srcE <= alu_src;
            reg_dstE <= reg_dst;
            we_regE <= we_reg;
            jal_waE <= jal_wa;
            jal_wdE <= jal_wd;
            rd1E <= rd1;
            rd2E <= rd2;
            instr_20_16E <= instr_20_16;
            instr_15_11E <= instr_15_11;
            sext_immE <= sext_immD;
            jtaE <= jtaD;
            pc_plus4E <= pc_plus4D;
            btaE <= btaD;
        end
    end
endmodule
