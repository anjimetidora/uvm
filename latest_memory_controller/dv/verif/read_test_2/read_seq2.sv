//*******************************DV_logic*************************************//

//												File Name : read_seq2.sv
//												File Type : system_verilog
//										Creation Date : 26-10-2018
//												File Type : system_verilog
//													 Author : Dorababu

//****************************************************************************//
class read_seq2 extends base_sequence;

`uvm_object_utils(read_seq2)
mc_sequence_item seq_item;

function new(string name="read_seq2");
	super.new(name);
endfunction

task body();
	`uvm_do_with(seq_item,{seq_item.w_r=='b0;
													seq_item.en=='b1;
													seq_item.wr_addr>0;
													seq_item.wr_addr<50;});
  `uvm_info(get_name(),"read_seq2 is running.................",UVM_HIGH)
  endtask
endclass

