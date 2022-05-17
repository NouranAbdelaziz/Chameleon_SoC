
module cmp (input [31:0]a, input[31:0]b,output cmprslt);
wire a_lt_b, a_eq_b;
assign a_lt_b = (a < b);
assign a_eq_b = (a == b);
assign cmprslt =  a_lt_b | a_eq_b;
endmodule
module addsub(input [31:0] x, input [31:0] y, output [31:0] Out, input k);

genvar i;
wire [32:0]cin;
wire [31:0] S;
assign cin[0]=k;

    generate
    for (i=0; i<32; i=i+1) begin: myblock
        full_adder FA(x[i], (y[i]^k  ),cin[i], S[i], cin[i+1]);
    end
    endgenerate



assign Out =  S;
endmodule

module used_bits(input [31:0] N, output reg [4:0] n);

always@(*)
begin
  if(N[31] == 1) n=32;
  else if(N[30] == 1) n=31;
  else if(N[29] == 1) n=30;
  else if(N[28] == 1) n=29;
  else if(N[27] == 1) n=28;
  else if(N[26] == 1) n=27;
  else if(N[25] == 1) n=26;
  else if(N[24] == 1) n=25;
  else if(N[23] == 1) n=24;
  else if(N[22] == 1) n=23;
  else if(N[21] == 1) n=22;
  else if(N[20] == 1) n=21;
  else if(N[19] == 1) n=20;
  else if(N[18] == 1) n=19;
  else if(N[17] == 1) n=18;
  else if(N[16] == 1) n=17;
  else if(N[15] == 1) n=16;
  else if(N[14] == 1) n=15;
  else if(N[13] == 1) n=14;
  else if(N[12] == 1) n=13;
  else if(N[11] == 1) n=12;
  else if(N[10] == 1) n=11;
  else if(N[9] == 1) n=10;
  else if(N[8] == 1) n=9;
  else if(N[7] == 1) n=8;
  else if(N[6] == 1) n=7;
  else if(N[5] == 1) n=6;
  else if(N[4] == 1) n=5;
  else if(N[3] == 1) n=4;
  else if(N[2] == 1) n=3;
  else if(N[1] == 1) n=2;
  else if(N[0] == 1) n=1;
end

endmodule

module mux32_2x1(input S, input [31:0] A, input [31:0] B, output reg [31:0] c);
always @(*) begin
if (S)
    c = B;
    else
    c = A;
end

endmodule

module DFlipFlop(input clk, input rst, input D, output reg Q);
 
 always @ (posedge clk or posedge rst) begin // Asynchronous Reset
 if (rst)
 Q <= 1'b0;
 else
 Q <= D;
 end
endmodule


module Register #(parameter n = 64)(
input clk,
input rst,
input load,
input [n-1:0] in,
output [n-1:0] Q
    );

genvar i;
wire [n-1:0] D;
generate
for(i = 0; i < n; i = i+1)begin: myblock
    mux_2x1 mux( load, Q[i], in[i],  D[i]);
    DFlipFlop FF( clk,  rst,  D[i],  Q[i]);
end
endgenerate

endmodule
module full_adder(x,y,cin,s,cout);

    input x,y,cin;
    output s,cout;

assign {cout,s}=x+y+cin;
   
endmodule


module shifter(
input [31:0] a,
input [4:0] shamt,
input type,
output reg [31:0] r
    );
    
    always @(*)
    case(type)
    1'b0: r = (a<<shamt); //SL
    1'b1: r = (a>>shamt); //SR
    endcase
endmodule

module MULT(input [31:0] m1, input [31:0] m2, output [31:0] out);

assign out = m1*m2;

endmodule

module mux_2x1(input S, A, B, output reg c);
always @(*) begin
if (S)
    c = B;
    else
    c = A;
end

endmodule

module mux_3x2(input [1:0] S, input [31:0] A, input [31:0] B, input [31:0] C, output reg [31:0] D);

  always@(*) begin
    case(S)
      2'b01: D <= A;//stage 1
      2'b10: D <= B;//stage 2
      2'b11: D <= C;//stage 3
      default: D <= 0;
    endcase
  end

endmodule





/*
#define N 169  //N
#define NINV 103  // N*N'≡-1
#define R 256 // 剰余算を削除するためにめ2の冪乗にする
#define R2 133 //R2 = R^2 mod N 
#define RIND 8 //指数部分 2^8 だから8

//MontgomeryReduction
int MR(int x){
    return (x + (x * NINV & (R-1)) * N) >> RIND;
}
*/
//xR^-1 mod m
/*module mont_reduce (
	input [31:0] x,//the number to compute its mont reduction
	input [31:0] m,
	input [31:0] m_inv,//m inverse mod 2
	input [4:0] n,//RIND: number of bits in m
	output [31:0] x_red //the reduction of x
);

wire [31:0] r;//r = 2^n
wire [31:0] mu_1;//x * m_inv mod r 
wire [31:0] mu_2;//x + mu_1 * m
wire [31:0] t;

assign r = (31'b1 << n);

assign mu_1 = x * m_inv & (r-1);

assign mu_2 = x + mu_1 * m;

assign t = mu_2 >> n;

assign x_red = (m <= t)? t - m: t;

endmodule
*/

module mont_red(
  input clk,
  input rst,
	input [31:0] x,//the number to compute its mont reduction
	input [31:0] m,
	input [31:0] m_inv,//m inverse mod 2
	output [31:0] x_red //the reduction of x
);
//Modules implemented
//Register
//mux_2x1
//DFlipFlop
//shifter
//ADDER
//mux_3x2
//MULT --- a multiplier
//CMP --- comparator


reg [1:0]stage = 2'd0;
wire [31:0] shiftIN;
wire [31:0] shiftmount;
wire [31:0] shiftOUT;
wire shiftType;
wire [31:0] adderOUT_3;
wire [31:0] adderOUT_2;
wire [31:0] ANDOUT;
wire [31:0] mulIN1;
wire [31:0] mulIN2;
wire [31:0] mulOUT;
wire [31:0] ANDIN1;
wire [31:0] ANDIN2;
wire [31:0] addIN1;
wire [31:0] addIN2;
wire [31:0] k;
wire [31:0] temp_out;
wire [4:0] n;
wire cmprslt;
reg flag2, flag3, flag4;

reg [1:0] counter;//= 2'd0;

always @ (posedge clk)
  begin
    if (rst == 1'b1) begin
      stage <=0 ;
      counter <=  2'd1;
      flag3= 0;
      flag2=0;
      flag4=0;
    end 
    else 
     
      if(stage == 2'd1)
          begin
           if(counter == 2'd1)
             begin
              stage <= 2'd2;
              counter <= 0;
              flag3= 1;
              flag2=0;
              flag4=0;
             end
            else
              counter <= counter + 1;

           end
           
      else if(stage == 2'd2)
           begin
             if(counter == 2'd1)
               begin
               stage <= 2'd3;
               counter <= 0;
               flag3= 0;
               flag2=0;
               flag4=1;
               end
              else
              counter <= counter + 1;

           end
           
       else if((stage == 2'd3) |(stage == 2'd0))
           begin 
             if(counter == 2'd1)
                begin
                stage <= 2'd1;
                counter <= 0;
                flag2=1;
                flag3= 0;
                flag4=0;
                end
              else
              counter <= counter + 1;

            end
  end

used_bits ub(m, n);

//Stage 1: shift left, 2's complement, multiplication

mux32_2x1 mx1(stage[1], 1, adderOUT_3, shiftIN);//stage[1]=1 when at stage 3, =0 when at stage 1

mux_2x1 mx7(stage[1], 1'b0, 1'b1, shiftType);//to decide whether it's a shift left or shift right

shifter sh(shiftIN, n, shiftType, shiftOUT);//added shift type (right or left)


mux32_2x1 mx2(stage[1], m_inv, ANDOUT, mulIN1);//stage[1]=1 when at stage 2, =0 at stage 1

mux32_2x1 mx3(stage[1], x, m, mulIN2);

MULT mul(mulIN1, mulIN2, mulOUT);

Register reg1(clk, rst, flag2, {adderOUT_2, mulOUT}, {ANDIN1, ANDIN2}); //add register size as parameter

//Stage 2: AND, multiplication, add


assign ANDOUT = ANDIN1 & ANDIN2;

mux_3x2 mx4(stage, shiftOUT, x, shiftOUT, addIN1);//left as it is since r & t are both shiftOUT (an output of the shifter)

mux_3x2 mx5(stage, 1, mulOUT, m, addIN2);//added another option (that is 1) to implement the (r-1)

mux_3x2 mx8(stage, 1, 0, 1, k);//1= subtract, 0= add

addsub add(addIN1, addIN2, adderOUT_2, k[0]);//based on the stage, we either add or subtract

Register #(32) reg2(clk, rst, flag3, adderOUT_2, adderOUT_3);

//Stage 3: shift right, add, mux
cmp cmp1(m, shiftOUT, cmprslt);

mux32_2x1 mx6(cmprslt, shiftOUT, adderOUT_2, temp_out);

Register #(32) reg3(clk, rst, flag4, temp_out, x_red);



endmodule





module AHB_Sec_ACC #(parameter SIZE=32) (
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

    localparam  Z_OFF = 0, X_OFF = 4, Y_OFF = 8, n_OFF = 12;
    localparam  S0=0, S1=1, S2=2, S3=3;

    reg [7:0]   AHB_ADDR;    
    wire        ahb_access   = HTRANS[1] & HSEL & HREADY;
    wire        _ahb_write_    = ahb_access &  HWRITE;
    wire        ahb_read     = ahb_access & (~HWRITE);
    reg         AHB_WRITE;
    reg         AHB_READ;
    reg         flag;
    wire[31:0]      P;
    reg [31:0]  X, Y, P0, n, Z; 
    reg [7:0]   CNT, ncnt;
    reg start;
    wire done;
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
            X  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == Z_OFF))
            begin 
            X <= HWDATA;
           
            end

    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            Y  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == X_OFF))
        begin
            Y <= HWDATA;
           
            end
            
    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            Z <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == Y_OFF))
        begin
            Z <= HWDATA;
          
            end
     //   else if(STATE==S1) Y <= Y >> 1;
     

    
    mont_red mont (HCLK,~HRESETn,X,Y, Z, P);


   
    assign HREADYOUT = 1'b1;

    assign HRDATA = P;

endmodule
