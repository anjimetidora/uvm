class mc_monitor extends uvm_monitor;
	`uvm_component_utils(mc_monitor)
	//virtual interface
	virtual mc_interface inf;
	uvm_analysis_port #(mc_seq_item) mon_analysis_port;

mc_seq_item seq_item;

function new(string name="mc_monitor",uvm_component parent);
	super.new(name, parent);
	seq_item=new();
	//item_collected_port=new("item_collected_port",this);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	mon_analysis_port=new("mon_analysis_port",this);
	if(!uvm_config_db#(virtual mc_interface)::get(this,"","mc_inf",inf))
		`uvm_error("Driver","Unable to get virtual interface ");
	endfunction

	virtual task run_phase(uvm_phase phase);
	super.run_phase(phase);
	seq_item=mc_seq_item::type_id::create("seq_item",this);
		forever begin
			@(posedge inf.clk);
				wait(inf.monitor_cb.wr_en||inf.monitor_cb.rd_en);
					seq_item.addr=inf.monitor_cb.addr;
					if(inf.monitor_cb.wr_en)
					begin
						seq_item.wr_en=inf.monitor_cb.wr_en;
						seq_item.wdata=inf.monitor_cb.wdata;
					//	seq_item.rd_en='b0;
					end
				if(inf.monitor_cb.rd_en)
				begin
					$display("*************************enterring the rd_en********************");
					seq_item.rd_en=inf.monitor_cb.rd_en;
					seq_item.rdata=inf.monitor_cb.rdata;
					//seq_item.wr_en='b0;
				end
			seq_item.print();
			end
			mon_analysis_port.write(seq_item);
			endtask
		endclass

