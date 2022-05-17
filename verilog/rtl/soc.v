`default_nettype none
`timescale 1ns/1ns
//`define		USE_DFFRAM_BEH

module soc (
`ifdef USE_POWER_PINS
	input VPWR,
	input VGND,
`endif
	input wire HCLK, 
	//input wire HCLK_HF,
	input wire HRESETn,
	
	// input wire 			NMI,
	// input wire [7:0]	SYSTICKCLKDIV,
	
	//input wire 			NMI,
    //input wire             EXT_IRQ,
    //input wire [23:0]    SYSTICKCLKDIV,

	input wire UART_MASTER_RX,
	output wire UART_MASTER_TX,
	
	inout  wire [3: 0] 	fd_Sys0_S0,
	output wire [0: 0] 	fsclk_Sys0_S0,
	output wire [0: 0] 	fcen_Sys0_S0,
	
	/*input wire [3: 0] 	fdi_Sys0_S0,
        output wire [3: 0]     fdo_Sys0_S0,
        output wire [3: 0]     fdoe_Sys0_S0,
        output wire [0: 0]     fsclk_Sys0_S0,
        output wire [0: 0]     fcen_Sys0_S0,*/

	inout wire [15: 0] GPIO_Sys0_S2,

	input  wire [0: 0] RsRx_Sys0_SS0_S0,
	output wire [0: 0] RsTx_Sys0_SS0_S0,

	input  wire [0: 0] RsRx_Sys0_SS0_S1,
	output wire [0: 0] RsTx_Sys0_SS0_S1,

	input  wire [0: 0] MSI_Sys0_SS0_S2,
	output wire [0: 0] MSO_Sys0_SS0_S2,
	output wire [0: 0] SSn_Sys0_SS0_S2,
	output wire [0: 0] SCLK_Sys0_SS0_S2,
	
	input  wire [0: 0] MSI_Sys0_SS0_S3,
	output wire [0: 0] MSO_Sys0_SS0_S3,
	output wire [0: 0] SSn_Sys0_SS0_S3,
	output wire [0: 0] SCLK_Sys0_SS0_S3,
	
	inout wire [0: 0] scl_Sys0_SS0_S4,
	inout wire [0: 0] sda_Sys0_SS0_S4,
	inout wire [0: 0] scl_Sys0_SS0_S5,
	inout wire [0: 0] sda_Sys0_SS0_S5,

	output wire [0: 0] pwm_Sys0_SS0_S6,
	output wire [0: 0] pwm_Sys0_SS0_S7
);

	

	wire [31: 0] SRAMRDATA_Sys0_S1;
	wire [3: 0] SRAMWEN_Sys0_S1;
	wire [31: 0] SRAMWDATA_Sys0_S1;
	wire [0: 0] SRAMCS0_Sys0_S1;
	wire [11: 0] SRAMADDR_Sys0_S1;
    
    /*wire HCLK;
    Clock_divider div (HCLK_HF, HCLK);*/

    
    
	
	soc_core SOC_CORE (
        `ifdef USE_POWER_PINS
            .VPWR(1'b1),
            .VGND(1'b0),
        `endif
            .HCLK(HCLK),
            .HRESETn(HRESETn),
    
            // .SYSTICKCLKDIV(8'd100),
            // .NMI(1'b0),
            .UART_MASTER_RX(UART_MASTER_RX),
            .UART_MASTER_TX(UART_MASTER_TX),
            
            .fd_Sys0_S0(fd_Sys0_S0),
            .fsclk_Sys0_S0(fsclk_Sys0_S0),
            .fcen_Sys0_S0(fcen_Sys0_S0),
            
            /*.fdi_Sys0_S0(fm_din),
            .fdo_Sys0_S0(fm_dout),
            .fdoe_Sys0_S0(fm_douten),
            .fsclk_Sys0_S0(fm_sck),
            .fcen_Sys0_S0(fm_ce_n),*/
    
    
            .GPIO_Sys0_S2(GPIO_Sys0_S2),
            
            .RsRx_Sys0_SS0_S0(RsRx_Sys0_SS0_S0),
            .RsTx_Sys0_SS0_S0(RsTx_Sys0_SS0_S0),
    
            .RsRx_Sys0_SS0_S1(RsRx_Sys0_SS0_S1),
            .RsTx_Sys0_SS0_S1(RsTx_Sys0_SS0_S1),
           
            .MSI_Sys0_SS0_S2(MSI_Sys0_SS0_S2),
            .MSO_Sys0_SS0_S2(MSO_Sys0_SS0_S2),
            .SSn_Sys0_SS0_S2(SSn_Sys0_SS0_S2),
            .SCLK_Sys0_SS0_S2(SCLK_Sys0_SS0_S2),
    
            .MSI_Sys0_SS0_S3(MSI_Sys0_SS0_S3),
            .MSO_Sys0_SS0_S3(MSO_Sys0_SS0_S3),
            .SSn_Sys0_SS0_S3(SSn_Sys0_SS0_S3),
            .SCLK_Sys0_SS0_S3(SCLK_Sys0_SS0_S3),
    
            .scl_Sys0_SS0_S4(scl_Sys0_SS0_S4),
            .sda_Sys0_SS0_S4(sda_Sys0_SS0_S4),
        
            .scl_Sys0_SS0_S5(scl_Sys0_SS0_S5),
            .sda_Sys0_SS0_S5(sda_Sys0_SS0_S5),
        
            .pwm_Sys0_SS0_S6(pwm_Sys0_SS0_S6),
            .pwm_Sys0_SS0_S7(pwm_Sys0_SS0_S7),
	    
            .SRAMRDATA_Sys0_S1(SRAMRDATA_Sys0_S1),
            .SRAMWEN_Sys0_S1(SRAMWEN_Sys0_S1),
            .SRAMWDATA_Sys0_S1(SRAMWDATA_Sys0_S1),
            .SRAMCS0_Sys0_S1(SRAMCS0_Sys0_S1),
            .SRAMADDR_Sys0_S1(SRAMADDR_Sys0_S1)

    );


	
	
	/*SRAM16K RAM (
		.clk(HCLK),
		.addr(SRAMADDR_Sys0_S1[11:0]),
		.wdata(SRAMWDATA_Sys0_S1),
		.rdata(SRAMRDATA_Sys0_S1),
		.cs(SRAMCS0_Sys0_S1),
		.wen(SRAMWEN_Sys0_S1)
	);*/
	
	RAM_3Kx32 RAM (
	`ifdef USE_POWER_PINS
		.VPWR(VPWR),
		.VGND(VGND),
	`endif
		.CLK(HCLK),
		.WE(SRAMWEN_Sys0_S1),
		.EN(SRAMCS0_Sys0_S1),
		.Di(SRAMWDATA_Sys0_S1),
		.Do(SRAMRDATA_Sys0_S1),
		.A(SRAMADDR_Sys0_S1[11:0])
	);



  endmodule




/*module Clock_divider(clock_in,clock_out
    );
input wire clock_in; // input clock on FPGA
output reg clock_out; // output clock after dividing the input clock by divisor
reg[27:0] counter=28'd0;
parameter DIVISOR = 28'd2;
// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
always @(posedge clock_in)
begin
 counter <= counter + 28'd1;
 if(counter>=(DIVISOR-1))
  counter <= 28'd0;
 clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
end
endmodule*/
