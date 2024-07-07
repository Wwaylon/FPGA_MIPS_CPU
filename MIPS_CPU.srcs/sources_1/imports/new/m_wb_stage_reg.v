module m_wb_stage_reg(
    input clk, rst,
    input jumpM,
    input jr_mux_selM,
    input [1:0] wd_selM,
    input dm2regM,
    input we_regM,
    input jal_wdM,
    input [31:0] alu_outM,
    input [31:0] rd_dmM,
    input [31:0] hi_outM,
    input [31:0]lo_outM,
    input [4:0] rf_wa_finalM,
    input [31:0] jrM,
    input [31:0] jtaM,
    input [31:0] pc_plus4M,
    
    output reg jumpWB,
    output reg jr_mux_selWB,
    output reg [1:0] wd_selWB,
    output reg dm2regWB,
    output reg we_regWB,
    output reg jal_wdWB,
    output reg [31:0] alu_outWB,
    output reg [31:0] rd_dmWB,
    output reg [31:0] hi_outWB,
    output reg [31:0] lo_outWB,
    output reg [4:0] rf_wa_finalWB,
    output reg [31:0] jrWB,
    output reg [31:0] jtaWB,
    output reg [31:0] pc_plus4WB
    );
    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            jumpWB <= 0;
            jr_mux_selWB <= 0;
            wd_selWB <= 0;
            dm2regWB <= 0;
            we_regWB <= 0;
            jal_wdWB <= 0;
            alu_outWB <= 0;
            rd_dmWB <= 0;
            hi_outWB <= 0;
            lo_outWB <= 0;
            rf_wa_finalWB <= 0;
            jrWB <= 0;
            jtaWB <= 0;
            pc_plus4WB <= 0;
        end
        else begin
            jumpWB <= jumpM;
            jr_mux_selWB <= jr_mux_selM;
            wd_selWB <= wd_selM;
            dm2regWB <= dm2regM;
            we_regWB <= we_regM;
            jal_wdWB <= jal_wdM;
            alu_outWB <= alu_outM;
            rd_dmWB <= rd_dmM;
            hi_outWB <= hi_outM;
            lo_outWB <= lo_outM;
            rf_wa_finalWB <= rf_wa_finalM;
            jrWB <= jrM;
            jtaWB <= jtaM;
            pc_plus4WB <= pc_plus4M;

        end
    end
endmodule