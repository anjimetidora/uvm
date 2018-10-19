class base_test extends uvm_test;
  `uvm_component_utils(base_test)

function new(string name="base_test", uvm_component parent=null);
  super.new(name,parent);
endfunction


mc_environmet mc_env;

function build_phase(uvm_phase phase);
  super.build_phase(phase);
  mc_env=mc_environmet::type_id::create("mc_env",this);
endfunction


function end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration(phase);
  uvm_top.print_topology();
endfunction

endclass
