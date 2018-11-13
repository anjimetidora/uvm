class mc_agent extends uvm_agent;
  `uvm_component_utils(mc_agent)

 
 uvm_analysis_port #(mc_sequence_item) ap; 
  mc_driver drv;
  mc_sequencer seqr;
  mc_monitor mon;
	mc_fc fc;

  function new(string name="mc_agent",uvm_component parent);
	super.new(name,parent);
  endfunction


  function void build_phase(uvm_phase phase);
	  super.build_phase(phase);
	  if(!uvm_config_db#(uvm_active_passive_enum)::get(.cntxt(this),
																										 .inst_name(""),
																										 .field_name("is_active"),
																										 .value(UVM_ACTIVE)))
					`uvm_error("is_active","agent is not active")
		
		if(is_active==UVM_ACTIVE)
		begin
		  drv=mc_driver::type_id::create("mc_driver",this);
  	  seqr=mc_sequencer::type_id::create("mc_sequencer",this);
			fc=mc_fc::type_id::create("mc_fc",this);
		end
      mon=mc_monitor::type_id::create("mc_monitor",this);
  endfunction
  function void connect_phase(uvm_phase phase);
		  super.connect_phase(phase);
		  drv.seq_item_port.connect(seqr.seq_item_export);
			mon.ap.connect(fc.analysis_export);
  endfunction


endclass

