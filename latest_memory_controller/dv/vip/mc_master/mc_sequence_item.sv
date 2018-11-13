import mc_package::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

class mc_sequence_item extends uvm_sequence_item;
  //`uvm_object_utils(mc_sequence_item)



  function new(string name="mc_sequence_item");
	super.new(name);
  endfunction


  rand  bit w_r;
  rand logic [DATA_WIDTH-1:0]in_data;
  rand bit  en;
  randc logic [ADDR_WIDTH-1:0]wr_addr;
  logic [DATA_WIDTH-1:0]data_out;
  logic slv_error;
 
  `uvm_object_utils_begin(mc_sequence_item)
		`uvm_field_int(w_r,UVM_ALL_ON)
		`uvm_field_int(in_data,UVM_ALL_ON)
		`uvm_field_int(en,UVM_ALL_ON)
		`uvm_field_int(wr_addr,UVM_ALL_ON)
		`uvm_field_int(data_out,UVM_ALL_ON)
		`uvm_field_int(slv_error,UVM_ALL_ON)
  `uvm_object_utils_end

	constraint c_in_data{in_data<250;
												in_data>50;}
	//constraint c_wr_addr{wr_addr>0;
		//										wr_addr<255;}
endclass
