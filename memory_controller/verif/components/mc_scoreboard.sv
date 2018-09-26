class mc_scoreboard extends uvm_scoreboard;

	`uvm_component_utils(mc_scoreboard)
	mc_seq_item pkt;
	uvm_analysis_imp #(mc_seq_item,mc_scoreboard) sb_port;
	function new(string name="mc_scoreboard",uvm_component parent);
		super.new(name,parent);
		sb_port=new("sb_port",this);
	endfunction

	function void write(mc_seq_item pkt);
	endfunction
endclass
