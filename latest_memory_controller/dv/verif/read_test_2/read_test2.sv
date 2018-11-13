//*******************************DV_logic*************************************//

//												File Name : read_test2.sv
//												File Type : system_verilog
//										Creation Date : 26-10-2018
//												File Type : system_verilog
//													 Author : Dorababu

//****************************************************************************//
class read_test2 extends base_test;
`uvm_component_utils(read_test2)
read_seq2 r_seq2;
//mc_env env;
function new(string name="read_test2",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		r_seq2=read_seq2::type_id::create("r_seq2",this);
	  endfunction

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
	r_seq2.start(env.agnt.seqr);
	`uvm_info(get_name(),"read_test2 is running.....................",UVM_HIGH)
	phase.drop_objection(this);
endtask
endclass
