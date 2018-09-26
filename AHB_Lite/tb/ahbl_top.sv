


module ahbl_top;
//base uvm_packages
import uvm_pkg::*;
import test_pkg::*;

//interface instantiation
ahbl_interface t_inf(HCLK);

//dut instantiation
AHB_Lite dut_insta(.HRESETn(t_inf.HRESETn),
										.HCLK(t_inf.HCLK),
										.HADDR(t_inf.HADDR),
										.HWRITE(t_inf.HWRITE),
										.HWDATA(t_inf.HWDATA),
										.HSIZE(t_inf.HSIZE),
										.HBURST(t_inf.HBURST),
										.HTRANS(t_inf.HTRANS),
										.HPROT(t_inf.HPROT),
										.HMAST_LOCK(t_inf.HMAST_LOCK),
										.HREADY(t_inf.HREADY),
										.HRESP(t_inf.HRESP));


//clock generation
initial begin
logic HCLK='b0;
forever #1 HCLK=~HCLK;
end

initial 
	begin
//set the virtual interface to down hierarchy 
	uvm_config_db#(virtual ahbl_interface)::set(.contxt(null),
																							.inst_name("uvm_test_top.ahbl_environment.ahbl_agent"),
																							.field_name("ahbl_interface"),
																							.value(t_inf))
run_test("base_test");

end
endmodule



