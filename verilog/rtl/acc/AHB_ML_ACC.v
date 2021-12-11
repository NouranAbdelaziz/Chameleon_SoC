



module NN(x, y,z, p);
    parameter size = 32;
    
    input [size-1:0]y;
    input[size-1:0] x,z;
    output wire [31:0] p;

  assign  p= y+x+z;
   
endmodule


module MAC#(
  parameter WIDTH_SUM = 32,
	parameter WIDTH_A = 8,
	parameter WIDTH_B = 8
	)
	(
	input			[WIDTH_SUM-1:0] 			sum1,
	input		 	[WIDTH_A-1:0] 			a,
	input		 	[WIDTH_B-1:0] 			b,
	output	wire 		[WIDTH_SUM-1:0]	out
    );

assign out = sum1 + a*b;
endmodule


module test_mlp#(
  	parameter WIDTH_SUM = 32,
	parameter WIDTH_A = 32,
	parameter WIDTH_B = 32
	)
	(
	input			[WIDTH_A-1:0] 			sum0,
	input			[WIDTH_A-1:0] 			a,
	input		      	[WIDTH_B-1:0] 			b,
	output	wire 	[WIDTH_SUM-1:0]		out

    );

wire [31:0]		sum1;
wire [31:0]		sum2;
wire [31:0]		sum3;
wire [31:0]		sum4;

		MAC  mac1 (sum0,a[7:0],b[7:0],sum1);
		MAC  mac2 (sum1,a[15:8],b[15:8],sum2);
		MAC  mac3 (sum2,a[23:16],b[23:16],sum3);
		MAC  mac4 (sum3,a[31:24],b[31:24],out);

	

 
 
endmodule




module AHB_ML_ACC #(parameter SIZE=32) (
    input  wire         HCLK,      
    input  wire         HRESETn,   
    input  wire         HSEL,      
    input  wire         HREADY,    
    input  wire [1:0]   HTRANS,    
    input  wire [2:0]   HSIZE,     
    input  wire         HWRITE,    
    input  wire [31:0]  HADDR,     
    input  wire [31:0]  HWDATA,    
    output wire         HREADYOUT, 
    output wire [1:0]   HRESP,
    output wire [31:0]  HRDATA
);

    localparam  Z_OFF = 0, X_OFF = 4, Y_OFF = 8, P2_OFF = 12;
    localparam  S0=0, S1=1, S2=2, S3=3;

    reg [7:0]   AHB_ADDR;    
    wire        ahb_access   = HTRANS[1] & HSEL & HREADY;
    wire        _ahb_write_    = ahb_access &  HWRITE;
    wire        ahb_read     = ahb_access & (~HWRITE);
    reg         AHB_WRITE;
    reg         AHB_READ;
    reg         flag;
    wire[31:0]      P;
    reg [31:0]  X, Y, P0, P1, Z; 
    reg [7:0]   CNT, ncnt;

    reg [3:0]   STATE, nstate;

    always @(posedge HCLK or negedge HRESETn)
    if(~HRESETn) begin
        AHB_WRITE   <=  1'b0;
        AHB_READ    <=  1'b0;
        AHB_ADDR    <=  8'b0;
        flag        <=  1'b0;
    end
    else begin
        AHB_WRITE   <=  _ahb_write_;
        AHB_READ    <=  ahb_read;
        AHB_ADDR    <=  HADDR[7:0];  
    end

always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            Z  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == Z_OFF))
            Z <= HWDATA;


    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            X  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == X_OFF))
            X <= HWDATA;

    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            Y  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == Y_OFF))
        begin
            Y <= HWDATA;
            flag <=1'b1;
            end
     //   else if(STATE==S1) Y <= Y >> 1;

    
test_mlp ml(Z,X,Y,P);

   // test_ml Test(Z, X, Y);
    //NN nn(Z,X,Y,P);

   
    assign HREADYOUT = 1'b1;

    assign HRDATA = P;

endmodule
