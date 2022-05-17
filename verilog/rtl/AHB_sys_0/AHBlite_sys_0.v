
`timescale 1ns/1ns

//`define DBG
module AHBlite_sys_0(
`ifdef USE_POWER_PINS
		input VPWR,
		input VGND,
`endif
		input wire HCLK,
		input wire HRESETn,
     
		input wire [31: 0] HADDR,
		input wire [31: 0] HWDATA,
		input wire HWRITE,
		input wire [1: 0] HTRANS,
		input wire [2:0] HSIZE,

		output wire HREADY,
		output wire [31: 0] HRDATA,

		input wire [3: 0] fdi_S0,
		output wire [3: 0] fdo_S0,
		output wire [3: 0] fdoe_S0,
		output wire [0: 0] fsclk_S0,
		output wire [0: 0] fcen_S0,
		input wire [31: 0] SRAMRDATA_S1,
		output wire [3: 0] SRAMWEN_S1,
		output wire [31: 0] SRAMWDATA_S1,
		output wire [0: 0] SRAMCS0_S1,
		//output wire [0: 0] SRAMCS1_S1,
		//output wire [0: 0] SRAMCS2_S1,
		//output wire [0: 0] SRAMCS3_S1,
		output wire [11: 0] SRAMADDR_S1,
		input wire [15: 0] GPIOIN_S2,
		output wire [15: 0] GPIOOUT_S2,
		output wire [15: 0] GPIOPU_S2,
		output wire [15: 0] GPIOPD_S2,
		output wire [15: 0] GPIOOEN_S2,
		/*`ifdef USE_ROM
                // ROM Interface
                input wire [31:0] ROMRDATA, 
                output wire ROMCS0,
                output wire [12:0] ROMADDR,  
        	`endif*/
		output wire [3:0] db_reg,
		input wire [0: 0] RsRx_SS0_S0,
		output wire [0: 0] RsTx_SS0_S0,
		output wire [0: 0] uart_irq_SS0_S0,
		input wire [0: 0] RsRx_SS0_S1,
		output wire [0: 0] RsTx_SS0_S1,
		output wire [0: 0] uart_irq_SS0_S1,
		input wire [0: 0] MSI_SS0_S2,
		output wire [0: 0] MSO_SS0_S2,
		output wire [0: 0] SSn_SS0_S2,
		output wire [0: 0] SCLK_SS0_S2,
		input wire [0: 0] MSI_SS0_S3,
		output wire [0: 0] MSO_SS0_S3,
		output wire [0: 0] SSn_SS0_S3,
		output wire [0: 0] SCLK_SS0_S3,
		input wire [0: 0] scl_i_SS0_S4,
		output wire [0: 0] scl_o_SS0_S4,
		output wire [0: 0] scl_oen_o_SS0_S4,
		input wire [0: 0] sda_i_SS0_S4,
		output wire [0: 0] sda_o_SS0_S4,
		output wire [0: 0] sda_oen_o_SS0_S4,
		input wire [0: 0] scl_i_SS0_S5,
		output wire [0: 0] scl_o_SS0_S5,
		output wire [0: 0] scl_oen_o_SS0_S5,
		input wire [0: 0] sda_i_SS0_S5,
		output wire [0: 0] sda_o_SS0_S5,
		output wire [0: 0] sda_oen_o_SS0_S5,
		output wire [0: 0] pwm_SS0_S6,
		output wire [0: 0] pwm_SS0_S7,

		output wire [31:0] IRQ
	);
        
		//assign IRQ[15:0] = 0;

        //Inputs
        wire HSEL_S0, HSEL_S1, HSEL_S2, HSEL_S3, HSEL_S4,HSEL_S5, HSEL_S6, HSEL_S7, HSEL_S8, HSEL_SS0;

        //Outputs
     wire    [31:0]   HRDATA_S0, HRDATA_S1, HRDATA_S2, HRDATA_S3, HRDATA_S4,HRDATA_S5, HRDATA_S6, HRDATA_S7, HRDATA_S8, HRDATA_SS0;
     wire             HREADY_S0, HREADY_S1, HREADY_S2, HREADY_S3, HREADY_S4, HREADY_S5, HREADY_S6, HREADY_S7, HREADY_S8, HREADY_SS0;
        wire  [1:0]   HRESP;
       // wire          IRQ;
        
		wire [15: 0] WGPIODIN_S2;
		wire [15: 0] WGPIODOUT_S2;
		wire [15: 0] WGPIOPU_S2;
		wire [15: 0] WGPIOPD_S2;
		wire [15: 0] WGPIODIR_S2;

	wire         fr_sck;
    	wire         fr_ce_n;
    	wire [3:0]   fr_din;
    	wire [3:0]   fr_dout;
    	wire         fr_douten;
    	
    	wire        fm_sck;
    	wire        fm_ce_n;
    	wire [3:0]  fm_din;
    	wire [3:0]  fm_dout;
   	wire [3:0]  fm_douten;
	
	AHB_FLASH_WRITER FW (
		.HCLK(HCLK),
		.HRESETn(HRESETn),
	    
		// AHB-Lite Slave Interface
		.HSEL(HSEL_S6),
		.HREADYOUT(HREADY_S6),
		.HREADY(HREADY), 
		.HWDATA(HWDATA),
		.HRDATA(HRDATA_S6),
		.HSIZE(HSIZE),
		.HWRITE(HWRITE),
		.HTRANS(HTRANS),
		.HADDR(HADDR),
		
		 // FLASH Interface from the FR
    		.fr_sck(fr_sck),
    		.fr_ce_n(fr_ce_n),
    		.fr_din(fr_din),
    		.fr_dout(fr_dout),
    		.fr_douten(fr_douten),
    
		
		.fm_sck(fsclk_S0),
		.fm_ce_n(fcen_S0),
		.fm_din(fdi_S0),
		.fm_dout(fdo_S0),
		.fm_douten(fdoe_S0)
		
		// FLASH Interface
                /*.fm_sck(fm_sck),
                .fm_ce_n(fm_ce_n),
                .fm_din(fm_din),
                .fm_dout(fm_dout),
                .fm_douten(fm_douten)*/
	);

	
	//Digital module # 0
	/*QSPI_XIP_CTRL S0 (  
	`ifdef USE_POWER_PINS
		.VPWR(VPWR),
		.VGND(VGND),
	`endif
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HSEL(HSEL_S0),
		.HADDR(HADDR),
		.HREADY(HREADY),
		.HWRITE(HWRITE),
		.HTRANS(HTRANS),
		//.HSIZE(HSIZE),
		.HRDATA(HRDATA_S0),
		.HREADYOUT(HREADY_S0),
		.din(fdi_S0),
		.dout(fdo_S0),
		.douten(fdoe_S0),
		.sck(fsclk_S0),
		.ce_n(fcen_S0)
	);*/
	
	//Digital module # 0
	QSPI_XIP_CTRL S0 ( 
	`ifdef USE_POWER_PINS
		.VPWR(VPWR),
		.VGND(VGND),
	`endif
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HSEL(HSEL_S0),
		.HADDR(HADDR),
		.HREADY(HREADY),
		.HWRITE(HWRITE),
		.HTRANS(HTRANS),
		//.HSIZE(HSIZE),
		.HRDATA(HRDATA_S0),
		.HREADYOUT(HREADY_S0),
		.din(fr_din),
		.dout(fr_dout),
		.douten(fr_douten),
		.sck(fr_sck),
		.ce_n(fr_ce_n)
	);

		
	//Digital module # 1
	AHBSRAM S1 ( 
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HSEL(HSEL_S1),
		.HADDR(HADDR),
		.HREADY(HREADY),
		.HWRITE(HWRITE),
		.HTRANS(HTRANS),
		.HSIZE(HSIZE),
		.HWDATA(HWDATA),
		.HRDATA(HRDATA_S1),
		.HREADYOUT(HREADY_S1),
		.SRAMRDATA(SRAMRDATA_S1),
		.SRAMWEN(SRAMWEN_S1),
		.SRAMWDATA(SRAMWDATA_S1),
		.SRAMCS0(SRAMCS0_S1),
		//.SRAMCS1(SRAMCS1_S1),
		//.SRAMCS2(SRAMCS2_S1),
		//.SRAMCS3(SRAMCS3_S1),
		.SRAMADDR(SRAMADDR_S1)
	);
		
	//Digital module # 2
	GPIO S2 ( 
		.WGPIODIN(WGPIODIN_S2),
		.WGPIODOUT(WGPIODOUT_S2),
		.WGPIOPU(WGPIOPU_S2),
		.WGPIOPD(WGPIOPD_S2),
		.WGPIODIR(WGPIODIR_S2),
		.GPIOIN(GPIOIN_S2),
		.GPIOOUT(GPIOOUT_S2),
		.GPIOPU(GPIOPU_S2),
		.GPIOPD(GPIOPD_S2),
		.GPIOOEN(GPIOOEN_S2)
	);
		
	//AHB Slave # 2
	AHBlite_GPIO S_10 (
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HSEL(HSEL_S2),
		.HADDR(HADDR[23:2]),
		.HREADY(HREADY),
		.HWRITE(HWRITE),
		.HTRANS(HTRANS),
		.HSIZE(HSIZE),
		.HWDATA(HWDATA),

		.WGPIODIN(WGPIODIN_S2),
		.WGPIODOUT(WGPIODOUT_S2),
		.WGPIOPU(WGPIOPU_S2),
		.WGPIOPD(WGPIOPD_S2),
		.WGPIODIR(WGPIODIR_S2),
		.HRDATA(HRDATA_S2),
		.HREADYOUT(HREADY_S2),
		.HRESP(HRESP), 

		.IRQ(IRQ[15:0])
	);
			
	//AHB Slave # 3
/*	
	AHBlite_db_reg S_3 (
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HSEL(HSEL_S3),
		.HADDR(HADDR[23:2]),
		.HREADY(HREADY),
		.HWRITE(HWRITE),
		.HTRANS(HTRANS),
		.HSIZE(HSIZE),
		.HWDATA(HWDATA),
		.db_reg(db_reg),

		.HRDATA(HRDATA_S3),
		.HREADYOUT(HREADY_S3),
		.HRESP(HRESP)
	);
*/

	AHB_SPM S_3 (
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HSEL(HSEL_S3),
		.HADDR(HADDR),
		.HREADY(HREADY),
		.HWRITE(HWRITE),
		.HTRANS(HTRANS),
		.HSIZE(HSIZE),
		.HWDATA(HWDATA),
		//.db_reg(db_reg),

		.HRDATA(HRDATA_S3),
		.HREADYOUT(HREADY_S3),
		.HRESP(HRESP)
	);	


	
	/*`ifdef USE_ROM 
        // Alternative option for booting
        AHBROM S_3 (
                .HCLK(HCLK),     
                .HRESETn(HRESETn),   
                .HSEL(HSEL_S3),      
                .HREADY(HREADY),   
                .HTRANS(HTRANS),    
                .HWRITE(HWRITE),    
                .HADDR(HADDR),     
                .HREADYOUT(HREADY_S3), 
                .HRESP(HRESP),     
                .HRDATA(HRDATA_S3),   
                
                .ROMRDATA(ROMRDATA), 
                .ROMCS0(ROMCS0),
                .ROMADDR(ROMADDR)  
        );
    `else
        assign HREADY_S3 = 1;
    `endif*/
	
	
	// SLAVE 4
        //assign HREADY_S4 = 1;
           AHB_ML_ACC S_4 (
            .HCLK(HCLK),
            .HRESETn(HRESETn),
            .HSEL(HSEL_S4),
            .HADDR(HADDR),
            .HREADY(HREADY),
            .HWRITE(HWRITE),
            .HTRANS(HTRANS),
            .HSIZE(HSIZE),
            .HWDATA(HWDATA),
            //.db_reg(db_reg),
    
            .HRDATA(HRDATA_S4),
            .HREADYOUT(HREADY_S4),
            .HRESP(HRESP)
        );   
        
        AHB_Sec_ACC S_5 (
            .HCLK(HCLK),
            .HRESETn(HRESETn),
            .HSEL(HSEL_S5),
            .HADDR(HADDR),
            .HREADY(HREADY),
            .HWRITE(HWRITE),
            .HTRANS(HTRANS),
            .HSIZE(HSIZE),
            .HWDATA(HWDATA),
            //.db_reg(db_reg),
    
            .HRDATA(HRDATA_S5),
            .HREADYOUT(HREADY_S5),
            .HRESP(HRESP)
        );    
             // SLAVE 6
        //assign HREADY_S4 = 1;
           AHB_tanh_ACC S_7 (
            .HCLK(HCLK),
            .HRESETn(HRESETn),
            .HSEL(HSEL_S7),
            .HADDR(HADDR),
            .HREADY(HREADY),
            .HWRITE(HWRITE),
            .HTRANS(HTRANS),
            .HSIZE(HSIZE),
            .HWDATA(HWDATA),
            //.db_reg(db_reg),
    
            .HRDATA(HRDATA_S7),
            .HREADYOUT(HREADY_S7),
            .HRESP(HRESP)
        );
        
         // SLAVE 7
        //assign HREADY_S4 = 1;
           AHB_Sigmoid_ACC S_8 (
            .HCLK(HCLK),
            .HRESETn(HRESETn),
            .HSEL(HSEL_S8),
            .HADDR(HADDR),
            .HREADY(HREADY),
            .HWRITE(HWRITE),
            .HTRANS(HTRANS),
            .HSIZE(HSIZE),
            .HWDATA(HWDATA),
            //.db_reg(db_reg),
    
            .HRDATA(HRDATA_S8),
            .HREADYOUT(HREADY_S8),
            .HRESP(HRESP)
        );
        
        	



	//AHB Bus
	AHBlite_BUS0 AHB(
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		
		// Master Interface
		.HADDR(HADDR),
		.HWDATA(HWDATA), 
		.HREADY(HREADY),
		.HRDATA(HRDATA),
		
		// Slave # 0
		.HSEL_S0(HSEL_S0),
		.HREADY_S0(HREADY_S0),
		.HRDATA_S0(HRDATA_S0),
		
		// Slave # 1
		.HSEL_S1(HSEL_S1),
		.HREADY_S1(HREADY_S1),
		.HRDATA_S1(HRDATA_S1),
		
		// Slave # 2
		.HSEL_S2(HSEL_S2),
		.HREADY_S2(HREADY_S2),
		.HRDATA_S2(HRDATA_S2),
		
		// Slave # 3
		.HSEL_S3(HSEL_S3),
		.HREADY_S3(HREADY_S3),
		.HRDATA_S3(HRDATA_S3),
		
		// Slave # 4
		.HSEL_S4(HSEL_S4),
		.HREADY_S4(HREADY_S4),
		.HRDATA_S4(HRDATA_S4),
            
         //SLAVE # 5
        .HSEL_S5(HSEL_S5),
		.HREADY_S5(HREADY_S5),
		.HRDATA_S5(HRDATA_S5),
		
		//SLAVE # 6
         .HSEL_S6(HSEL_S6),
		.HREADY_S6(HREADY_S6),
		.HRDATA_S6(HRDATA_S6),
		
		//SLAVE # 5
        .HSEL_S7(HSEL_S7),
        .HREADY_S7(HREADY_S7),
        .HRDATA_S7(HRDATA_S7),
                
         //SLAVE # 6
         .HSEL_S8(HSEL_S8),
         .HREADY_S8(HREADY_S8),
         .HRDATA_S8(HRDATA_S8),
		

		// Subsystem # 0
		.HSEL_SS0(HSEL_SS0),
		.HREADY_SS0(HREADY_SS0),
		.HRDATA_SS0(HRDATA_SS0)
	);

    //SubSystem Instantiation #0 
    apb_sys_0 apb_sys_inst_0(
    `ifdef USE_POWER_PINS
	.VPWR(VPWR),
	.VGND(VGND),
    `endif
        // Global signals 
        .HCLK(HCLK),
        .HRESETn(HRESETn),
    
        // AHB Slave inputs 
        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HWRITE(HWRITE),
        .HWDATA(HWDATA),
        .HSEL(HSEL_SS0),
        .HREADY(HREADY),
    
        // AHB Slave outputs 
        .HRDATA(HRDATA_SS0),
        .HREADYOUT(HREADY_SS0),
		.RsRx_S0(RsRx_SS0_S0),
		.RsTx_S0(RsTx_SS0_S0),

		.RsRx_S1(RsRx_SS0_S1),
		.RsTx_S1(RsTx_SS0_S1),

		.MSI_S2(MSI_SS0_S2),
		.MSO_S2(MSO_SS0_S2),
		.SSn_S2(SSn_SS0_S2),
		.SCLK_S2(SCLK_SS0_S2),

		.MSI_S3(MSI_SS0_S3),
		.MSO_S3(MSO_SS0_S3),
		.SSn_S3(SSn_SS0_S3),
		.SCLK_S3(SCLK_SS0_S3),

		.scl_i_S4(scl_i_SS0_S4),
		.scl_o_S4(scl_o_SS0_S4),
		.scl_oen_o_S4(scl_oen_o_SS0_S4),
		.sda_i_S4(sda_i_SS0_S4),
		.sda_o_S4(sda_o_SS0_S4),
		.sda_oen_o_S4(sda_oen_o_SS0_S4),

		.scl_i_S5(scl_i_SS0_S5),
		.scl_o_S5(scl_o_SS0_S5),
		.scl_oen_o_S5(scl_oen_o_SS0_S5),
		.sda_i_S5(sda_i_SS0_S5),
		.sda_o_S5(sda_o_SS0_S5),
		.sda_oen_o_S5(sda_oen_o_SS0_S5),

		.pwm_S6(pwm_SS0_S6),
		.pwm_S7(pwm_SS0_S7),

		.IRQ(IRQ[31:16])
    );
`ifdef DBG
    always @(posedge HCLK)
	if(HTRANS[1] & HREADY)
        $display("Mem request (%d) A:%X", HWRITE, HADDR);
`endif
    endmodule
        
