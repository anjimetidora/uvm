clean:
	rm -fr work *~* *.vstf transcript  *.wlf *.log


compile:
	vlib work
	vlog +acc -sv -mfcu -timescale 1ns/1ns -f flist -l comp.log 

