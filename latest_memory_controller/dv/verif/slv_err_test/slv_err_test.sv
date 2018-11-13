//*******************************DV_logic*************************************//

//												File Name : slv_err_test.sv
//												File Type : system_verilog
//										Creation Date : 26-10-2018
//												File Type : system_verilog
//													 Author : Dorababu

//****************************************************************************//
class slv_err_test extends base_test;
`uvm_component_utils(slv_err_test)
write_seq1 w_seq1;
read_seq1 r_seq1;
function new(string name="write_in_reserve_test",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		w_seq1=write_seq1::type_id::create("w_seq1",this);
		r_seq1=read_seq1::type_id::create("r_seq1",this);
	  endfunction

task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	w_seq1.start(env.agnt.seqr);
	r_seq1.start(env.agnt.seqr);
	`uvm_info(get_name(),"write_in_reserve_test is running.....................",UVM_HIGH)
//	memory_data();
#20;
	phase.drop_objection(this);
endtask
task memory_data();
	$display("memory=%0p\n",$root.mc_tb.dut_insta.mem);
	for(int i=0;i<256;i++)
				begin
					$write("memory[%0d]=%d\t",i,$root.mc_tb.dut_insta.mem[i]);
					i=i+1;
				end
endtask

endclass

