module datapath (
        input  wire        clk,
        input  wire        rst,
        input  wire        branch,
        input wire         we_dm,
        input  wire        jump,
        input  wire        reg_dst,
        input  wire        we_reg,
        input  wire        alu_src,
        input  wire        dm2reg,
        input  wire [3:0]  alu_ctrl,
        input  wire [4:0]  ra3,
        input  wire [31:0] instr,
        input  wire [31:0] rd_dm,
        input wire jal_wd,
        input wire jal_wa,
        input wire hilo_we,
        input wire    [1:0]  wd_sel,
        input wire jr_mux_sel,
        
        
        
        output wire [31:0] pc_current,
        output wire [31:0] alu_out,
        output wire [31:0] wd_dm,
        output wire [31:0] rd3,
        output wire we_dm_out,
        output wire [31:0] instr_decode_stage
    );

    wire [4:0]  rf_wa;
    wire        pc_src;
    wire [31:0] pc_plus4F;
    wire [31:0] pc_pre;
    wire [31:0] pc_pre1;
    wire [31:0] pc_next;
    wire [31:0] sext_imm;
    wire [31:0] ba;
    wire [31:0] jta;
    wire [31:0] alu_pa;
    wire [31:0] alu_pb;
    wire [31:0] wd_rf;
    wire        zero;
    wire [31:0] rd1_out;
    wire [31:0] rd2_out;
    wire [31:0] mult_lo;
    wire [31:0] mult_hi;
    wire [31:0] lo_out;
    wire [31:0] hi_out;
    wire [31:0] wd_rf_new;
    wire [31:0] rf_wd_final;
    wire [4:0] rf_wa_final;
    wire [31:0] alu_out1;
   
    //D
    wire [31:0] instrD;
    wire [31:0] pc_plus4D;
    wire [31:0] jtaD;
    wire [31:0] btaD;
    //E
    wire hilo_weE;
    wire jumpE;
    wire jr_mux_selE;
    wire [1:0] wd_selE;
    wire dm2regE;
    wire we_dmE;
    wire branchE;
    wire [3:0] alu_ctrlE;
    wire alu_srcE;
    wire reg_dstE;
    wire we_regE;
    wire jal_waE;
    wire jal_wdE;
    wire [31:0] rd1E;
    wire [31:0] rd2E;
    wire [4:0] shamtE;
    wire [4:0] instr_20_16E;
    wire [4:0] instr_15_11E;
    wire [31:0] sext_immE;
    wire [31:0] jtaE;
    wire [31:0] pc_plus4E;
    wire [31:0] btaE;

    //M 
    wire hilo_weM;
    wire jumpM;
    wire jr_mux_selM;
    wire [1:0] wd_selM;
    wire dm2regM;
    wire we_dmM;
    wire we_regM;
    wire jal_wdM;
    wire [31:0] alu_outM;
    wire [31:0] hiM;
    wire [31:0] loM;
    wire [31:0] wd_dmM;
    wire [4:0] rf_wa_finalM;
    wire [31:0] jrM;
    wire [31:0] jtaM;
    wire [31:0] pc_plus4M;
    
    //WB
    wire [31:0] pc_plus4WB;
    wire jumpWB;
    wire jr_mux_selWB;
    wire [1:0] wd_selWB;
    wire dm2regWB;
    wire we_regWB;
    wire jal_wdWB;
    wire [31:0] alu_outWB;
    wire [31:0] rd_dmWB;
    wire [31:0] hi_outWB;
    wire [31:0] lo_outWB;
    wire [4:0] rf_wa_finalWB;
    wire [31:0] jrWB;
    wire [31:0] jtaWB;
   
    
    assign pc_src = branchE & zero;
    assign ba = {sext_imm[29:0], 2'b00};
    assign jtaD = {pc_plus4D[31:28], instrD[25:0], 2'b00};
    
    assign wd_dm = wd_dmM;
    assign alu_out = alu_outM;
    assign instr_decode_stage = instrD;
    assign we_dm_out = we_dmM;
    
    
    f_d_stage_reg fetch_decode_reg(
        .clk    (clk),
        .rst        (rst),
        .instrF     (instr),
        .pc_plus4F      (pc_plus4F),
        .instrD     (instrD),
        .pc_plus4D  (pc_plus4D)
    );
    d_e_stage_reg decode_execute_reg(
        .clk    (clk),
        .rst    (rst),
        .hilo_we    (hilo_we),
        .jump   (jump),
        .jr_mux_sel (jr_mux_sel),
        .wd_sel (wd_sel),
        .dm2reg (dm2reg),
        .we_dm (we_dm),
        .branch (branch),
        .alu_ctrl (alu_ctrl),
        .alu_src (alu_src),
        .reg_dst (reg_dst),
        .we_reg (we_reg),
        .jal_wa (jal_wa),
        .jal_wd (jal_wd),
        .rd1 (rd1_out),
        .rd2 (rd2_out),
        .shamtD (instrD[10:6]),
        .instr_20_16 (instrD[20:16]),
        .instr_15_11 (instrD[15:11]),
        .sext_immD (sext_imm),
        .jtaD (jtaD),
        .pc_plus4D (pc_plus4D),
        .btaD (btaD),
        
        .hilo_weE (hilo_weE),
        .jumpE (jumpE),
        .jr_mux_selE (jr_mux_selE),
        .wd_selE (wd_selE),
        .dm2regE (dm2regE),
        .we_dmE (we_dmE),
        .branchE (branchE),
        .alu_ctrlE (alu_ctrlE),
        .alu_srcE (alu_srcE),
        .reg_dstE (reg_dstE),
        .we_regE (we_regE),
        .jal_waE (jal_waE),
        .jal_wdE (jal_wdE),
        .rd1E (rd1E),
        .rd2E (rd2E),
        .shamtE (shamtE),
        .instr_20_16E (instr_20_16E),
        .instr_15_11E (instr_15_11E),
        .sext_immE(sext_immE),
        .jtaE (jtaE),
        .pc_plus4E (pc_plus4E),
        .btaE (btaE)
    );
    
    e_m_stage_reg execute_memory_reg (
        .clk    (clk),
        .rst    (rst),
        .hilo_weE   (hilo_weE),
        .jumpE   (jumpE),
        .jr_mux_selE (jr_mux_selE),
        .wd_selE (wd_selE),
        .dm2regE (dm2regE),
        .we_dmE (we_dmE),
        .we_regE (we_regE),
        .jal_wdE (jal_wdE),
        .alu_outE (alu_out1),
        .hiE (mult_hi),
        .loE (mult_lo),
        .wd_dmE (rd2E),
        .rf_wa_finalE (rf_wa_final),
        .jrE (rd1E),
        .jtaE (jtaE),
        .pc_plus4E (pc_plus4E),

        .hilo_weM (hilo_weM),
        .jumpM (jumpM),
        .jr_mux_selM (jr_mux_selM),
        .wd_selM (wd_selM),
        .dm2regM (dm2regM),
        .we_dmM (we_dmM),
        .we_regM (we_regM),
        .jal_wdM (jal_wdM),
        .alu_outM (alu_outM),
        .hiM (hiM),
        .loM (loM),
        .wd_dmM (wd_dmM),
        .rf_wa_finalM (rf_wa_finalM),
        .jrM (jrM),
        .jtaM (jtaM),
        .pc_plus4M (pc_plus4M)
    );

    m_wb_stage_reg memory_writeback_reg(
        .clk    (clk),
        .rst    (rst),
        .jumpM (jumpM),
        .jr_mux_selM (jr_mux_selM),
        .wd_selM (wd_selM),
        .dm2regM (dm2regM),
        .we_regM (we_regM),
        .jal_wdM (jal_wdM),
        .alu_outM (alu_outM),
        .rd_dmM (rd_dm),
        .hi_outM (hi_out),
        .lo_outM (lo_out),
        .rf_wa_finalM (rf_wa_finalM),
        .jrM (jrM),
        .jtaM (jtaM),
        .pc_plus4M (pc_plus4M),

        .jumpWB (jumpWB),
        .jr_mux_selWB (jr_mux_selWB),
        .wd_selWB (wd_selWB),
        .dm2regWB (dm2regWB),
        .we_regWB (we_regWB),
        .jal_wdWB (jal_wdWB),
        .alu_outWB (alu_outWB),
        .rd_dmWB (rd_dmWB),
        .hi_outWB (hi_outWB),
        .lo_outWB (lo_outWB),
        .rf_wa_finalWB (rf_wa_finalWB),
        .jrWB (jrWB),
        .jtaWB (jtaWB),
        .pc_plus4WB (pc_plus4WB)
    );
    
    // --- PC Logic --- // F STAGE
    dreg pc_reg (
            .clk            (clk),
            .rst            (rst),
            .d              (pc_next),
            .q              (pc_current)
        );

    adder pc_plus_4 (
            .a              (pc_current),
            .b              (32'd4),
            .y              (pc_plus4F)
        );

    adder pc_plus_br (
            .a              (pc_plus4D),
            .b              (ba),
            .y              (btaD)
        );

    mux2 #(32) pc_src_mux (
            .sel            (pc_src),
            .a              (pc_plus4F),
            .b              (btaE),
            .y              (pc_pre)
        );

    mux2 #(32) pc_jmp_mux (
            .sel            (jumpWB),
            .a              (pc_pre),
            .b              (jtaWB),
            .y              (pc_pre1)
        );
        
    mux2 #(32) pc_jr_mux (
            .sel            (jr_mux_selWB),
            .a              (pc_pre1),
            .b              (jrWB),
            .y              (pc_next)
        );

    // --- RF Logic --- //
    mux2 #(5) rf_wa_mux (
            .sel            (reg_dstE),
            .a              (instr_20_16E),
            .b              (instr_15_11E),
            .y              (rf_wa)
        );

    regfile rf (
            .clk            (clk),
            .we             (we_regWB),
            .ra1            (instrD[25:21]),
            .ra2            (instrD[20:16]),
            .ra3            (ra3),
            //.wa             (rf_wa),
            .wa              (rf_wa_finalWB),
            //.wd             (wd_rf),
            .wd               (rf_wd_final),
            //.rd1            (alu_pa),
            .rd1    (rd1_out),
            //.rd2            (wd_dm),
            .rd2            (rd2_out),
            .rd3            (rd3)
        );

    signext se (
            .a              (instrD[15:0]),
            .y              (sext_imm)
        );
        
        
   //multiply
   multiply mult(
        .a(rd1E),
        .b(rd2E),
        .lo(mult_lo),
        .hi(mult_hi)
   );
   
   hilo_reg hilo (
        .clk(clk),
        .we(hilo_weM),
        .lo(loM),
        .hi(hiM),
        .lo_out(lo_out),
        .hi_out(hi_out)
   );

    // --- ALU Logic --- //
    mux2 #(32) alu_pb_mux (
            .sel            (alu_srcE),
            //.a              (wd_dm),
            .a              (rd2E),
            .b              (sext_immE),
            .y              (alu_pb)
        );

    alu alu (
            .op             (alu_ctrlE),
            //.a              (alu_pa),
            .a              (rd1E),
            .b              (alu_pb),
            .zero           (zero),
            .y              (alu_out1),
            .shamt          (shamtE)
        );

    // --- MEM Logic --- //
    mux2 #(32) rf_wd_mux (
            .sel            (dm2regWB),
            .a              (alu_outWB),
            .b              (rd_dmWB),
            .y              (wd_rf)
        );
        
    mux3 #(32) rf_wd_mux_new (
        .sel(wd_selWB),
        .a(wd_rf),
        .b(lo_outWB),
        .c(hi_outWB),
        .y(wd_rf_new)
    );
    
    //jal 
    mux2 #(32) rf_wd_final_mux(
        .sel(jal_wdWB),
        .a(wd_rf_new),
        .b(pc_plus4WB),
        .y(rf_wd_final)
    );
    mux2 #(5) rf_wa_final_mux(
        .sel(jal_waE),
        .a(rf_wa),
        .b(5'd31),
        .y(rf_wa_final)
    );

endmodule