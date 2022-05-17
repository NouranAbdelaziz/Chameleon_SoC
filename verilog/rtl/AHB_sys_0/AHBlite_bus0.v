
    `timescale 1ns/1ns
    module AHBlite_BUS0(
        input wire HCLK,
        input wire HRESETn,
      
        // Master Interface
        input wire [31:0] HADDR,
        input wire [31:0] HWDATA,   
        output wire [31:0] HRDATA,
        output wire        HREADY,
        // Slave # 0
        output wire         HSEL_S0,
        input wire          HREADY_S0,
        input wire  [31:0]  HRDATA_S0,
        // Slave # 1
        output wire         HSEL_S1,
        input wire          HREADY_S1,
        input wire  [31:0]  HRDATA_S1,
        // Slave # 2
        output wire         HSEL_S2,
        input wire          HREADY_S2,
        input wire  [31:0]  HRDATA_S2,
        // Slave # 3
        output wire         HSEL_S3,
        input wire          HREADY_S3,
        input wire  [31:0]  HRDATA_S3,

        // Slave # 4
        output wire         HSEL_S4,
        input wire          HREADY_S4,
        input wire  [31:0]  HRDATA_S4,
        
        // SLAVE # 5
        output wire         HSEL_S5,
        input wire          HREADY_S5,
        input wire  [31:0]  HRDATA_S5,
        
        // SLAVE # 6
        output wire         HSEL_S6,
        input wire          HREADY_S6,
        input wire  [31:0]  HRDATA_S6,
        
        // SLAVE # 7
        output wire         HSEL_S7,
        input wire          HREADY_S7,
        input wire  [31:0]  HRDATA_S7,
                
         // SLAVE # 8
         output wire         HSEL_S8,
         input wire          HREADY_S8,
         input wire  [31:0]  HRDATA_S8,


        // SubSystem # 0
        output wire         HSEL_SS0,
        input wire          HREADY_SS0,
        input wire  [31:0]  HRDATA_SS0
    );
        wire [7:0]  PAGE = HADDR[31:24];
        reg [7:0] APAGE;
        //assign HREADY = 1'b1;
        always@ (posedge HCLK or negedge HRESETn) begin 
        if(!HRESETn)
            APAGE <= 8'h0;
        else if(HREADY) 
            APAGE <= PAGE;
        end

    	assign HSEL_S0 = (PAGE == 8'h00);
		assign HSEL_S1 = (PAGE == 8'h20);
		assign HSEL_S2 = (PAGE == 8'h48);
		assign HSEL_S3 = (PAGE == 8'h49);
        assign HSEL_S4 = (PAGE == 8'h4A);
        assign HSEL_S5 = (PAGE == 8'h4B);
        //assign HSEL_S6 = (PAGE == 8'h4C);
        assign HSEL_S7 = (PAGE == 8'h4D);
        assign HSEL_S8 = (PAGE == 8'h4E);
		assign HSEL_SS0 = (PAGE == 8'h40);
	 

			assign HREADY = (APAGE == 8'h00) ? HREADY_S0 :
			                 (APAGE == 8'h20) ? HREADY_S1 :
                             (APAGE == 8'h48) ? HREADY_S2 :
                             (APAGE == 8'h49) ? HREADY_S3 :
                             (APAGE == 8'h4A) ? HREADY_S4 :
                             (APAGE == 8'h4B) ? HREADY_S5 :
                             //(APAGE == 8'h4C) ? HREADY_S6 :
                             (APAGE == 8'h4D) ? HREADY_S7 :
                             (APAGE == 8'h4E) ? HREADY_S8 :   
                             (APAGE == 8'h40) ? HREADY_SS0 : 
                              1'b1;


        assign HRDATA =
			(APAGE == 8'h00) ? HRDATA_S0 :
			(APAGE == 8'h20) ? HRDATA_S1 :
			(APAGE == 8'h48) ? HRDATA_S2 :
			(APAGE == 8'h49) ? HRDATA_S3 :
            (APAGE == 8'h4A) ? HRDATA_S4 :
            (APAGE == 8'h4B) ? HRDATA_S5 :
            //(APAGE == 8'h4C) ? HRDATA_S6 :
            (APAGE == 8'h4D) ? HRDATA_S7 :
            (APAGE == 8'h4E) ? HRDATA_S8 :
			(APAGE == 8'h40) ? HRDATA_SS0 :
			32'hDEADBEEF;

endmodule
