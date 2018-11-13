class write_test1 extends base_test;
`uvm_component_utils(write_test1)
write_seq1 w_seq1;
function new(string name="write_test1",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		w_seq1=write_seq1::type_id::create("w_seq1",this);
	  endfunction

task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	w_seq1.start(env.agnt.seqr);
	`uvm_info(get_name(),"write_test1 is running.....................",UVM_HIGH)
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



