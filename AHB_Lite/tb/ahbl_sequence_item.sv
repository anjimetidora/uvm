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


//              File Name : ahbl_sequence_item.sv
//              File Type: System Verilog                                 
//              Creation Date : 18-12-2017
//              Last Modified : Mon 18 Dec 2017 12:34:36 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//

import ahbl_package::*;

typedef enum bit [1:0]{WRITE,READ,RST} op;


class ahbl_sequence_item extends sequence_item;

`uvm_object_utils(ahbl_sequence_item)

function new(string name="ahbl_sequence_item");
super.new(name);
endfunction
//declaring all fields
logic HRESETn;
logic HCLK;
logic [ADDR_WIDTH-1:0]HADDR;
logic HWRITE;
logic [WDATA_WIDTH-1:0]HWDATA;
logic [SIZE_WIDTH-1:0]HSIZE;
logic [BURST_WIDTH-1:0]HBURST;
logic [TRANS_WIDTH-1:0]HTRANS;
logic [PROT_WIDTH-1:0]HPROT;
logic HMAST_LOCK;
logic  HREADY;
logic  HRESP;



`uvm_object_utils_begin(ahbl_sequence_item)
	`uvm_field_int(HCLK,UVM_ALL_ON)
	`uvm_field_int(HADDR,UVM_ALL_ON)
	`uvm_field_int(HWRITE,UVM_ALL_ON)
	`uvm_field_int(HWDATA,UVM_ALL_ON)
	`uvm_field_int(HSIZE,UVM_ALL_ON)
	`uvm_field_int(HBURST,UVM_ALL_ON)
	`uvm_field_int(HTRANS,UVM_ALL_ON)
	`uvm_field_int(HPROT,UVM_ALL_ON)
	`uvm_field_int(HMAST_LOCK,UVM_ALL_ON)
	`uvm_field_int(HREADY,UVM_ALL_ON)
	`uvm_field_int(HRESP,UVM_ALL_ON)
	`uvm_field_int(HRESETn,UVM_ALL_ON)



endclass

