

// file: sigmoid.v

module sigmoid (
    input wire [7:0] in,
    output reg [7:0] out
);
    always @*
        case(in)
                8'h0: out = 8'h40;
                8'h1: out = 8'h42;
                8'h2: out = 8'h44;
                8'h3: out = 8'h46;
                8'h4: out = 8'h48;
                8'h5: out = 8'h4A;
                8'h6: out = 8'h4C;
                8'h7: out = 8'h4E;
                8'h8: out = 8'h50;
                8'h9: out = 8'h52;
                8'hA: out = 8'h53;
                8'hB: out = 8'h55;
                8'hC: out = 8'h57;
                8'hD: out = 8'h59;
                8'hE: out = 8'h5A;
                8'hF: out = 8'h5C;
                8'h10: out = 8'h5E;
                8'h11: out = 8'h5F;
                8'h12: out = 8'h61;
                8'h13: out = 8'h62;
                8'h14: out = 8'h63;
                8'h15: out = 8'h65;
                8'h16: out = 8'h66;
                8'h17: out = 8'h67;
                8'h18: out = 8'h69;
                8'h19: out = 8'h6A;
                8'h1A: out = 8'h6B;
                8'h1B: out = 8'h6C;
                8'h1C: out = 8'h6D;
                8'h1D: out = 8'h6E;
                8'h1E: out = 8'h6F;
                8'h1F: out = 8'h70;
                8'h20: out = 8'h71;
                8'h21: out = 8'h72;
                8'h22: out = 8'h72;
                8'h23: out = 8'h73;
                8'h24: out = 8'h74;
                8'h25: out = 8'h74;
                8'h26: out = 8'h75;
                8'h27: out = 8'h76;
                8'h28: out = 8'h76;
                8'h29: out = 8'h77;
                8'h2A: out = 8'h77;
                8'h2B: out = 8'h78;
                8'h2C: out = 8'h78;
                8'h2D: out = 8'h79;
                8'h2E: out = 8'h79;
                8'h2F: out = 8'h7A;
                8'h30: out = 8'h7A;
                8'h31: out = 8'h7A;
                8'h32: out = 8'h7B;
                8'h33: out = 8'h7B;
                8'h34: out = 8'h7B;
                8'h35: out = 8'h7C;
                8'h36: out = 8'h7C;
                8'h37: out = 8'h7C;
                8'h38: out = 8'h7C;
                8'h39: out = 8'h7C;
                8'h3A: out = 8'h7D;
                8'h3B: out = 8'h7D;
                8'h3C: out = 8'h7D;
                8'h3D: out = 8'h7D;
                8'h3E: out = 8'h7D;
                8'h3F: out = 8'h7E;
                8'h40: out = 8'h7E;
                8'h41: out = 8'h7E;
                8'h42: out = 8'h7E;
                8'h43: out = 8'h7E;
                8'h44: out = 8'h7E;
                8'h45: out = 8'h7E;
                8'h46: out = 8'h7E;
                8'h47: out = 8'h7F;
                8'h48: out = 8'h7F;
                8'h49: out = 8'h7F;
                8'h4A: out = 8'h7F;
                8'h4B: out = 8'h7F;
                8'h4C: out = 8'h7F;
                8'h4D: out = 8'h7F;
                8'h4E: out = 8'h7F;
                8'h4F: out = 8'h7F;
                8'h50: out = 8'h7F;
                8'h51: out = 8'h7F;
                8'h52: out = 8'h7F;
                8'h53: out = 8'h7F;
                8'h54: out = 8'h7F;
                8'h55: out = 8'h7F;
                8'h56: out = 8'h7F;
                8'h57: out = 8'h7F;
                8'h58: out = 8'h7F;
                8'h59: out = 8'h7F;
                8'h5A: out = 8'h7F;
                8'h5B: out = 8'h7F;
                8'h5C: out = 8'h7F;
                8'h5D: out = 8'h7F;
                8'h5E: out = 8'h7F;
                8'h5F: out = 8'h7F;
                8'h60: out = 8'h7F;
                8'h61: out = 8'h7F;
                8'h62: out = 8'h7F;
                8'h63: out = 8'h7F;
                8'h64: out = 8'h7F;
                8'h65: out = 8'h7F;
                8'h66: out = 8'h7F;
                8'h67: out = 8'h7F;
                8'h68: out = 8'h7F;
                8'h69: out = 8'h7F;
                8'h6A: out = 8'h7F;
                8'h6B: out = 8'h7F;
                8'h6C: out = 8'h7F;
                8'h6D: out = 8'h7F;
                8'h6E: out = 8'h7F;
                8'h6F: out = 8'h7F;
                8'h70: out = 8'h7F;
                8'h71: out = 8'h7F;
                8'h72: out = 8'h7F;
                8'h73: out = 8'h7F;
                8'h74: out = 8'h7F;
                8'h75: out = 8'h7F;
                8'h76: out = 8'h7F;
                8'h77: out = 8'h7F;
                8'h78: out = 8'h7F;
                8'h79: out = 8'h7F;
                8'h7A: out = 8'h7F;
                8'h7B: out = 8'h7F;
                8'h7C: out = 8'h7F;
                8'h7D: out = 8'h7F;
                8'h7E: out = 8'h7F;
                8'h7F: out = 8'h7F;
                8'h80: out = 8'h0;
                8'h81: out = 8'h0;
                8'h82: out = 8'h0;
                8'h83: out = 8'h0;
                8'h84: out = 8'h0;
                8'h85: out = 8'h0;
                8'h86: out = 8'h0;
                8'h87: out = 8'h0;
                8'h88: out = 8'h0;
                8'h89: out = 8'h0;
                8'h8A: out = 8'h0;
                8'h8B: out = 8'h0;
                8'h8C: out = 8'h0;
                8'h8D: out = 8'h0;
                8'h8E: out = 8'h0;
                8'h8F: out = 8'h0;
                8'h90: out = 8'h0;
                8'h91: out = 8'h0;
                8'h92: out = 8'h0;
                8'h93: out = 8'h0;
                8'h94: out = 8'h0;
                8'h95: out = 8'h0;
                8'h96: out = 8'h0;
                8'h97: out = 8'h0;
                8'h98: out = 8'h0;
                8'h99: out = 8'h0;
                8'h9A: out = 8'h0;
                8'h9B: out = 8'h0;
                8'h9C: out = 8'h0;
                8'h9D: out = 8'h0;
                8'h9E: out = 8'h0;
                8'h9F: out = 8'h0;
                8'hA0: out = 8'h0;
                8'hA1: out = 8'h0;
                8'hA2: out = 8'h0;
                8'hA3: out = 8'h0;
                8'hA4: out = 8'h0;
                8'hA5: out = 8'h0;
                8'hA6: out = 8'h0;
                8'hA7: out = 8'h0;
                8'hA8: out = 8'h1;
                8'hA9: out = 8'h1;
                8'hAA: out = 8'h1;
                8'hAB: out = 8'h1;
                8'hAC: out = 8'h1;
                8'hAD: out = 8'h1;
                8'hAE: out = 8'h1;
                8'hAF: out = 8'h1;
                8'hB0: out = 8'h1;
                8'hB1: out = 8'h1;
                8'hB2: out = 8'h1;
                8'hB3: out = 8'h1;
                8'hB4: out = 8'h1;
                8'hB5: out = 8'h1;
                8'hB6: out = 8'h1;
                8'hB7: out = 8'h1;
                8'hB8: out = 8'h1;
                8'hB9: out = 8'h1;
                8'hBA: out = 8'h2;
                8'hBB: out = 8'h2;
                8'hBC: out = 8'h2;
                8'hBD: out = 8'h2;
                8'hBE: out = 8'h2;
                8'hBF: out = 8'h2;
                8'hC0: out = 8'h2;
                8'hC1: out = 8'h2;
                8'hC2: out = 8'h3;
                8'hC3: out = 8'h3;
                8'hC4: out = 8'h3;
                8'hC5: out = 8'h3;
                8'hC6: out = 8'h3;
                8'hC7: out = 8'h4;
                8'hC8: out = 8'h4;
                8'hC9: out = 8'h4;
                8'hCA: out = 8'h4;
                8'hCB: out = 8'h4;
                8'hCC: out = 8'h5;
                8'hCD: out = 8'h5;
                8'hCE: out = 8'h5;
                8'hCF: out = 8'h6;
                8'hD0: out = 8'h6;
                8'hD1: out = 8'h6;
                8'hD2: out = 8'h7;
                8'hD3: out = 8'h7;
                8'hD4: out = 8'h8;
                8'hD5: out = 8'h8;
                8'hD6: out = 8'h9;
                8'hD7: out = 8'h9;
                8'hD8: out = 8'hA;
                8'hD9: out = 8'hA;
                8'hDA: out = 8'hB;
                8'hDB: out = 8'hC;
                8'hDC: out = 8'hC;
                8'hDD: out = 8'hD;
                8'hDE: out = 8'hE;
                8'hDF: out = 8'hE;
                8'hE0: out = 8'hF;
                8'hE1: out = 8'h10;
                8'hE2: out = 8'h11;
                8'hE3: out = 8'h12;
                8'hE4: out = 8'h13;
                8'hE5: out = 8'h14;
                8'hE6: out = 8'h15;
                8'hE7: out = 8'h16;
                8'hE8: out = 8'h17;
                8'hE9: out = 8'h19;
                8'hEA: out = 8'h1A;
                8'hEB: out = 8'h1B;
                8'hEC: out = 8'h1D;
                8'hED: out = 8'h1E;
                8'hEE: out = 8'h1F;
                8'hEF: out = 8'h21;
                8'hF0: out = 8'h22;
                8'hF1: out = 8'h24;
                8'hF2: out = 8'h26;
                8'hF3: out = 8'h27;
                8'hF4: out = 8'h29;
                8'hF5: out = 8'h2B;
                8'hF6: out = 8'h2D;
                8'hF7: out = 8'h2E;
                8'hF8: out = 8'h30;
                8'hF9: out = 8'h32;
                8'hFA: out = 8'h34;
                8'hFB: out = 8'h36;
                8'hFC: out = 8'h38;
                8'hFD: out = 8'h3A;
                8'hFE: out = 8'h3C;
                8'hFF: out = 8'h3E;
                default: out = 8'h00;
        endcase
endmodule

module AHB_Sigmoid_ACC #(parameter SIZE=32) (
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

    localparam  in_OFF = 0;
    

    reg [7:0]   AHB_ADDR;    
    wire        ahb_access   = HTRANS[1] & HSEL & HREADY;
    wire        _ahb_write_    = ahb_access &  HWRITE;
    wire        ahb_read     = ahb_access & (~HWRITE);
    reg         AHB_WRITE;
    reg         AHB_READ;
    reg         flag;
    wire[31:0]      P;
    reg[31:0]   in;
    
    
  

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
            in  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == in_OFF))
            in <= HWDATA;
            
 
            
     
       
            
       
     sigmoid Sig(in,P);       
            
     
   assign  HRDATA = P;
  
    assign HREADYOUT = 1'b1;

   // assign HRDATA = P;

endmodule
