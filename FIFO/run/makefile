
clean:
	rm -fr csrc* DVE* cov_work scsim* led* INCA* work simv* ucli* inter* *.html *.cm *.daidir *.ucdb *.simvision *.asdb *.acdb *.h vsim.wlf transcript INCA* *.log *.key waves.shm dataset* *.cfg .athdl* 	*.txt* athdl_sv* *~* *.db* compile covhtmlreport fcover_report_files


sim:clean
	vsim -c -do fifo_run.do
	firefox fcover_report.html 

sim_gui:clean
	vsim -do fifo_run.do




