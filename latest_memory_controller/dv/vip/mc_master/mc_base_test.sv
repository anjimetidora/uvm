class base_test extends uvm_test;
  `uvm_component_utils(base_test)

function new(string name="base_test", uvm_component parent=null);
  super.new(name,parent);
endfunction


mc_env env;

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  env=mc_env::type_id::create("mc_env",this);
endfunction


function void end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  uvm_top.print_topology();
endfunction

endclass
