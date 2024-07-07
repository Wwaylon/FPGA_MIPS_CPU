module mux3 #(parameter WIDTH = 8) (
        input  wire [1:0]            sel,
        input  wire [WIDTH-1:0] a,
        input  wire [WIDTH-1:0] b,
        input wire [WIDTH-1:0] c, 
        output wire [WIDTH-1:0] y
    );

    assign y = (sel == 2'b00) ? a :
           (sel == 2'b01) ? b :
           c;

endmodule