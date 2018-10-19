class mc_sequencer extends uvm_sequencer#(mc_sequence_item);

`uvm_component_utils(mc_sequencer)

function new(string name="mc_sequencer");
  super.new(name);
endfunction

endclass

