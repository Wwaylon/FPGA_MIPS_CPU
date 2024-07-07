module e_m_stage_reg(
    input clk, rst,
    input hilo_weE,
    input jumpE,
    input jr_mux_selE,
    input [1:0] wd_selE,
    input dm2regE,
    input we_dmE,
    input we_regE,
    input jal_wdE,
    input [31:0] alu_outE,
    input [31:0] hiE,
    input [31:0] loE,
    input [31:0] wd_dmE,
    input [4:0] rf_wa_finalE,
    input [31:0] jrE,
    input [31:0] jtaE,
    input [31:0] pc_plus4E,
    
    output reg hilo_weM,
    output reg jumpM,
    output reg jr_mux_selM,
    output reg  [1:0] wd_selM,
    output reg dm2regM,
    output reg we_dmM,
    output reg we_regM,
    output reg jal_wdM,
    output reg [31:0] alu_outM,
    output reg [31:0] hiM,
    output reg [31:0] loM,
    output reg [31:0] wd_dmM,
    output reg [4:0] rf_wa_finalM,
    output reg [31:0] jrM,
    output reg [31:0] jtaM,
    output reg [31:0] pc_plus4M

    );
    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            hilo_weM <= 0;
            jumpM <= 0;
            jr_mux_selM <= 0;
            wd_selM <= 0;
            dm2regM <= 0;
            we_dmM <= 0;
            we_regM <= 0;
            jal_wdM <= 0;
            alu_outM <= 0;
            hiM <= 0;
            loM <= 0;
            wd_dmM <= 0;
            rf_wa_finalM <= 0;
            jrM <= 0;
            jtaM <= 0;
            pc_plus4M <= 0;
        end
        else begin
            hilo_weM <= hilo_weE;
            jumpM <= jumpE;
            jr_mux_selM <= jr_mux_selE;
            wd_selM <= wd_selE;
            dm2regM <= dm2regE;
            we_dmM <= we_dmE;
            we_regM <= we_regE;
            jal_wdM <= jal_wdE;
            alu_outM <= alu_outE;
            hiM <= hiE;
            loM <= loE;
            wd_dmM <= wd_dmE;
            rf_wa_finalM <= rf_wa_finalE;
            jrM <= jrE;
            jtaM <= jtaE;
            pc_plus4M <= pc_plus4E;
        end
    end
endmodule