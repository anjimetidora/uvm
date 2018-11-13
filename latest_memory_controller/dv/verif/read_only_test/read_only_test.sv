//*******************************DV_logic*************************************//

//												File Name : read_only_test.sv
//												File Type : system_verilog
//										Creation Date : 26-10-2018
//												File Type : system_verilog
//													 Author : Dorababu

//****************************************************************************//
class read_only_test extends base_test;
`uvm_component_utils(read_only_test)
read_only_seq r_only_seq1;
function new(string name="read_only_test",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		r_only_seq1=read_only_seq::type_id::create("r_only_seq1",this);
	  endfunction

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
	r_only_seq1.start(env.agnt.seqr);
	`uvm_info(get_name(),"read_only_test is running.....................",UVM_HIGH)
	phase.drop_objection(this);
endtask
endclass
