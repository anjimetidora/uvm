class read_test1 extends base_test;
`uvm_component_utils(read_test1)
read_seq1 r_seq1;
//mc_env env;
function new(string name="read_test1",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		r_seq1=read_seq1::type_id::create("r_seq1",this);
  //      env=mc_env::type_id::create("env",this);
	  endfunction

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
	r_seq1.start(env.agnt.seqr);
	`uvm_info(get_name(),"read_test_1 is running.....................",UVM_HIGH)
	//memory_data();
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
