module hilo_reg (
        input  wire        clk,
        input  wire        we,
        input  wire [31:0]  lo,
        input  wire [31:0]  hi,

        output wire [31:0] lo_out,
        output wire [31:0] hi_out
    );
    
    reg [31:0] hi_rf;
    reg [31:0] lo_rf;

    
    initial begin
        hi_rf = 32'h0;
        lo_rf =32'h0;
    end
    
    always @ (posedge clk) begin
        if (we) begin
        hi_rf <= hi;
        lo_rf <= lo;
        end 
    end

    assign lo_out =  lo_rf;
    assign hi_out = hi_rf;

endmodule