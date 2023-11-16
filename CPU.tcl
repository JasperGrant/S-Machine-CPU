quit -sim

vlib work;

vlog *.v

vsim work.test_CPU -Lf 220model_ver -Lf altera_mf_ver -Lf verilog

do CPU.do

run 50ns