onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Top Level}
add wave -noupdate -label enable /test_S_Machine/enable
add wave -noupdate -label clk /test_S_Machine/clk
add wave -noupdate -divider CPU
add wave -noupdate -label {Register A} -radix decimal /test_S_Machine/smachine/cpu/register_A
add wave -noupdate -label {Register B} -radix decimal /test_S_Machine/smachine/cpu/register_B
add wave -noupdate -label C /test_S_Machine/smachine/cpu/C
add wave -noupdate -label N /test_S_Machine/smachine/cpu/N
add wave -noupdate -label Z /test_S_Machine/smachine/cpu/Z
add wave -noupdate -divider {Inst Memory}
add wave -noupdate -label PC -radix decimal /test_S_Machine/smachine/inst_memory/PC
add wave -noupdate -label inst /test_S_Machine/smachine/inst_memory/inst
add wave -noupdate -divider {Data Memory}
add wave -noupdate -label addr /test_S_Machine/smachine/data_memory/addr
add wave -noupdate -label data_in /test_S_Machine/smachine/data_memory/data_in_memory
add wave -noupdate -label data_out /test_S_Machine/smachine/data_memory/data_out_memory
add wave -noupdate -label read_write /test_S_Machine/smachine/data_memory/read_write
add wave -noupdate -label {memory[170]} -expand {/test_S_Machine/smachine/data_memory/memory[170]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {113 ns} 0} {{Cursor 2} {27 ns} 0}
quietly wave cursor active 2
configure wave -namecolwidth 318
configure wave -valuecolwidth 253
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {12 ns} {202 ns}
