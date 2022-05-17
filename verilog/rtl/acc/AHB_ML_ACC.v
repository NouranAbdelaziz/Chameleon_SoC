module parallel_ACC#(
  	parameter WIDTH_SUM = 32,
	parameter WIDTH_A = 32,
	parameter WIDTH_B = 32
	)
	(
	input     [2:0] 			valid,
	//input			[WIDTH_SUM-1:0] 			sumin,
  input	signed		[WIDTH_SUM-1:0] 			sum0,
	input	signed		[WIDTH_A-1:0] 			sum1,
	input	signed		[WIDTH_A-1:0] 			sum2,
	input	signed		[WIDTH_A-1:0] 			sum3,
	input	signed		[WIDTH_A-1:0] 			a,
	input	signed	  [WIDTH_B-1:0] 			w0,
	input	signed	  [WIDTH_B-1:0] 			w1,
	input	signed	  [WIDTH_B-1:0] 			w2,
	input	signed	  [WIDTH_B-1:0] 			w3,
	
	//output	wire 	[WIDTH_SUM-1:0]		out
	output 	wire signed	[WIDTH_SUM-1:0]		out0,
	output 	wire signed	[WIDTH_SUM-1:0]		out1,
	output 	wire signed	[WIDTH_SUM-1:0]		out2,
	output 	wire signed	[WIDTH_SUM-1:0]		out3

    );
  wire [3:0] validbit;
  wire [1:0] val;

  assign val= valid -1'd1;
  assign validbit= val[1]? (val[0]? 4'b1111 : 4'b0111) :(val[0]? 4'b0011 : 4'b0001);

    four_mac  macp0 (validbit,sum0, a,w0,out0);
		four_mac  macp1 (validbit,sum1,a,w1,out1);
		four_mac  macp2 (validbit, sum2,a,w2,out2);
		four_mac  macp3 (validbit,sum3, a,w3,out3);
		


endmodule


module NN(x, y,z, p);
    parameter size = 32;
    
    input [size-1:0]y;
    input[size-1:0] x,z;
    output wire [31:0] p;

  assign  p= y+x+z;
   
endmodule


module MAC#(
  parameter WIDTH_SUM = 8,
	parameter WIDTH_A = 8,
	parameter WIDTH_B = 8
	)
	(
	//input			[WIDTH_SUM-1:0] 			sum1,
	input valid,
	input signed		 	[WIDTH_A-1:0] 			a,
	input signed		 	[WIDTH_B-1:0] 			b,
	output	 wire signed  		[WIDTH_SUM-1:0]	out
    );

//assign out = sum1 + a*b;
assign out = valid? a*b: 0;
endmodule

/*
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

wire [7:0]		sum1;
wire [7:0]		sum2;
wire [7:0]		sum3;
wire [7:0]		sum4;

		MAC  mac1 (sum0,a[7:0],b[7:0],sum1);
		MAC  mac2 (sum1,a[15:8],b[15:8],sum2);
		MAC  mac3 (sum2,a[23:16],b[23:16],sum3);
		MAC  mac4 (sum3,a[31:24],b[31:24],out);

	

 
 
endmodule

module four_mac #(
  	parameter WIDTH_SUM = 32,
	parameter WIDTH_A = 32,
	parameter WIDTH_B = 32
	)
	(
	input     [2:0] 			valid,
	input	signed		[WIDTH_SUM-1:0] 			sumin,
	input	signed		[WIDTH_A-1:0] 			a,
	input		signed      	[WIDTH_B-1:0] 			b,
	output  wire 	[WIDTH_SUM-1:0]		out

    );

wire [3:0] validbit;
wire [1:0] val;
wire [WIDTH_SUM-1:0]		sum0;
wire [WIDTH_SUM-1:0]		sum1;
wire [WIDTH_SUM-1:0]		sum2;
wire [WIDTH_SUM-1:0]		sum3;


assign val= valid -1'd1;
assign validbit= val[1]? (val[0]? 4'b1111 : 4'b0111) :(val[0]? 4'b0011 : 4'b0001);

		MAC  mac0 (validbit[0],a[7:0],b[7:0],sum0);
		MAC  mac1 (validbit[1],a[15:8],b[15:8],sum1);
		MAC  mac2 (validbit[2],a[23:16],b[23:16],sum2);
		MAC  mac3 (validbit[3],a[31:24],b[31:24],sum3);


assign out = sum0+sum1+sum2+sum3+sumin;

endmodule
*/

module four_mac #(
  	parameter WIDTH_SUM = 32,
	parameter WIDTH_A = 32,
	parameter WIDTH_B = 32
	)
	(
	input     [3:0] 			valid,
	input	signed		[WIDTH_SUM-1:0] 			sumin,
	input	signed		[WIDTH_A-1:0] 			a,
	input		signed      	[WIDTH_B-1:0] 			b,
	output  wire signed	[WIDTH_SUM-1:0]		out

    );

//wire [3:0] validbit;
//wire [1:0] val;
wire [WIDTH_SUM-1:0]		sum0;
wire [WIDTH_SUM-1:0]		sum1;
wire [WIDTH_SUM-1:0]		sum2;
wire [WIDTH_SUM-1:0]		sum3;


//assign val= valid -1'd1;
//assign validbit= val[1]? (val[0]? 4'b1111 : 4'b0111) :(val[0]? 4'b0011 : 4'b0001);

		MAC  mac0 (valid[0],a[7:0],b[7:0],sum0);
		MAC  mac1 (valid[1],a[15:8],b[15:8],sum1);
		MAC  mac2 (valid[2],a[23:16],b[23:16],sum2);
		MAC  mac3 (valid[3],a[31:24],b[31:24],sum3);


assign out = sum0+sum1+sum2+sum3+sumin;

endmodule
/*
module parallel_ACC#(
  	parameter WIDTH_SUM = 32,
	parameter WIDTH_A = 32,
	parameter WIDTH_B = 32
	)
	(
	input     [3:0] 			valid,
	input			[WIDTH_SUM-1:0] 			sumin,
        input			[WIDTH_A-1:0] 			sum0,
	input			[WIDTH_A-1:0] 			sum1,
	input			[WIDTH_A-1:0] 			sum2,
	input			[WIDTH_A-1:0] 			sum3,
	input			[WIDTH_A-1:0] 			a,
	input		  [WIDTH_B-1:0] 			w0,
	input		  [WIDTH_B-1:0] 			w1,
	input		  [WIDTH_B-1:0] 			w2,
	input		  [WIDTH_B-1:0] 			w3,
	
	output	wire 	[WIDTH_SUM-1:0]		out0,
	output	wire 	[WIDTH_SUM-1:0]		out1,
	output	wire 	[WIDTH_SUM-1:0]		out2,
	output	wire 	[WIDTH_SUM-1:0]		out3

    );


    four_mac  macp0 (valid,sumin,a,w0,out0);
		four_mac  macp1 (valid,sumin,a,w1,out1);
		four_mac  macp2 (valid,sumin,a,w2,out2);
		four_mac  macp3 (valid,sumin,a,w3,out3);
		


endmodule
*/

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

    //localparam  Z_OFF = 0, X_OFF = 4, Y_OFF = 8, P2_OFF = 12, valid_off = 12;
    localparam  sumin_OFF = 0, sum0_OFF = 4, sum1_OFF = 8, sum2_OFF = 12, sum3_OFF = 16  , a_OFF = 20, w0_OFF = 24, w1_OFF = 28, w2_OFF= 32, w3_OFF = 36, out0_OFF = 40, out1_OFF = 44, out2_OFF = 48, out3_OFF = 52, valid_OFF = 56;
    localparam  S0=0, S1=1, S2=2, S3=3;

    reg [7:0]   AHB_ADDR;    
    wire        ahb_access   = HTRANS[1] & HSEL & HREADY;
    wire        _ahb_write_    = ahb_access &  HWRITE;
    wire        ahb_read     = ahb_access & (~HWRITE);
    reg         AHB_WRITE;
    reg         AHB_READ;
    reg         flag;
    wire[31:0]      P ,out0, out1, out2, out3;
    reg [31:0]  X, Y, P0, P1, Z; 
    reg [31:0]  sum0, sum1, sum2,sum3 , a, w0, w1, w2, w3;
    
    reg [7:0]   CNT, ncnt;
    reg [3:0]   Valid;
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
            sum0  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == sum0_OFF))
            sum0 <= HWDATA;
            
 always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            sum1  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == sum1_OFF))
            sum1 <= HWDATA;   
            
  always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            sum2  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == sum2_OFF))
            sum2 <= HWDATA;                  

  always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            sum3  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == sum3_OFF))
            sum3 <= HWDATA; 
            
  
            
    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            a <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == a_OFF))
            a <= HWDATA;   
            
     always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            w0  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == w0_OFF))
            w0 <= HWDATA; 
            
       always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            w1  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == w1_OFF))
            w1 <= HWDATA;  
            
       always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            w2  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == w2_OFF))
            w2 <= HWDATA; 
            
       always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            w3  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == w3_OFF))
            w3 <= HWDATA;
       /*     
        always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            HRDATA  <= 32'b0;
        else if( (AHB_ADDR == out0_OFF))
            HRDATA <= out0; 
            
        always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            HRDATA  <= 32'b0;
        else if( (AHB_ADDR == out1_OFF))
            HRDATA <= out1; 
            
            
        always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            HRDATA  <= 32'b0;
        else if((AHB_ADDR == out2_OFF))
            HRDATA <= out2; 
            
            
        always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            HRDATA  <= 32'b0;
        else if( (AHB_ADDR == out3_OFF))
            HRDATA <= out3;         
            
        
          */
          
       
                              
       always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            Valid  <= 4'b0;
        else if(AHB_WRITE && (AHB_ADDR == valid_OFF))
        
            Valid <= HWDATA[3:0];
            
       
            
            
     //   else if(STATE==S1) Y <= Y >> 1;

   // parallel_ACC ();
//test_mlp ml(Z,X,Y,P);

  //four_mac M(Valid,Z,X,Y,P);
  parallel_ACC acc ( Valid, sum0, sum1, sum2,sum3 , a, w0, w1, w2, w3, out0, out1, out2, out3);
   // test_ml Test(Z, X, Y);
    //NN nn(Z,X,Y,P);

   assign  HRDATA = (AHB_ADDR == out0_OFF)? out0: (AHB_ADDR == out1_OFF)?out1:(AHB_ADDR == out2_OFF)?out2: (AHB_ADDR == out3_OFF)?out3:32'b0;
   //assign  HRDATA =out0;
    assign HREADYOUT = 1'b1;

   // assign HRDATA = P;

endmodule
