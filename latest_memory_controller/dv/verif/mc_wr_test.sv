class wr_test extends base_test;
`uvm_component_utils(wr_test)
w_sequence w_seq;
r_sequence r_seq;
//mc_env env;
function new(string name="wr_test",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		w_seq=w_sequence::type_id::create("w_seq",this);
		r_seq=r_sequence::type_id::create("r_seq",this);
        //env=mc_env::type_id::create("env",this);
	  endfunction

task run_phase(uvm_phase phase);
	phase.raise_objection(this);
$display("run phase in test");
	w_seq.start(env.agnt.seqr);
$display("after run phase in test");
	`uvm_info(get_name(),"write test is running.....................",UVM_HIGH)
	r_seq.start(env.agnt.seqr);
	`uvm_info(get_name(),"read test is running.....................",UVM_HIGH)
	memory_data();			//printing the dut memory data
	phase.drop_objection(this);
endtask

task memory_data();
	//$display("memory=%0p\n",$root.mc_tb.dut_insta.mem);
	for(int i=0;i<256;i++)
				begin
					$write("memory[%0d]=%d\t",i,$root.mc_tb.dut_insta.mem[i]);
				end
endtask
endclass
