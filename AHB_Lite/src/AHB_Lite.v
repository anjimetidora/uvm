//***************************************************************************//
//***************************************************************************//
//***************************************************************************//
//**************                                          *******************//
//**************                                          *******************//
//**************      (c) SASIC Technologies Pvt Ltd      *******************//
//**************          (c) Verilogic Solutions         *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************           www.sasictek.com               *******************//
//**************          www.verilog-ic.com              *******************//
//**************                                          *******************//
//**************           Twitter:@sasictek              *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************                                          *******************//
//***************************************************************************//
//***************************************************************************//


//              File Name : AHB_Lite.v
//              File Type: Verilog                                 
//              Creation Date : 18-12-2017
//              Last Modified : Wed 20 Dec 2017 01:37:22 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//


module AHB_Lite #(parameter ADDR_WIDTH=32,
									parameter SIZE_WIDTH=3,
								  parameter BURST_WIDTH=3,
								  parameter PROT_WIDTH=4,
								  parameter TRANS_WIDTH=2,
								  parameter WDATA_WIDTH=32,
									parameter RDATA_WIDTH=32)
								 (input HRESETn,
								  input HCLK,
									input [ADDR_WIDTH-1:0]HADDR,
									input HWRITE,
									input [WDATA_WIDTH-1:0]HWDATA,
									input [SIZE_WIDTH-1:0]HSIZE,
									input [BURST_WIDTH-1:0]HBURST,
									input [TRANS_WIDTH-1:0]HTRANS,
									input [PROT_WIDTH-1:0]HPROT,
									input HMAST_LOCK,
									output HREADY,
									output HRESP)


endmodule
