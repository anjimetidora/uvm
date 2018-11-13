//*******************************DV_logic*************************************//

//												File Name : read_in_reserve_seq.sv
//												File Type : system_verilog
//										Creation Date : 26-10-2018
//												File Type : system_verilog
//													 Author : Dorababu

//****************************************************************************//
class read_in_reserve_seq extends base_sequence;

`uvm_object_utils(read_in_reserve_seq)
mc_sequence_item seq_item;

function new(string name="read_in_reserve_seq");
	super.new(name);
endfunction

task body();
	repeat(15)
begin
	`uvm_do_with(seq_item,{seq_item.w_r=='b0;
													seq_item.en=='b1;
													seq_item.wr_addr>200;
													seq_item.wr_addr<256;});
end
  `uvm_info(get_name(),"read_in_reserve_seq is running.................",UVM_HIGH)
  endtask
endclass

