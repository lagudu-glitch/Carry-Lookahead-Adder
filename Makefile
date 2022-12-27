src = cla.sv
tb  = cla_tb.sv
sim = sim.vvp

test: $(src) $(tb)
	iverilog -g2012 $(src) $(tb) -o $(sim)
	vvp $(sim)
.PHONY: test
