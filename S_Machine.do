onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Top Level}
add wave -noupdate /test/count
add wave -noupdate /test/enable
add wave -noupdate -divider {Inst Interpreter}
add wave -noupdate /test/smachine/cpu/interpreter/PC
add wave -noupdate /test/smachine/cpu/interpreter/inst
add wave -noupdate /test/smachine/cpu/interpreter/start
add wave -noupdate /test/smachine/cpu/interpreter/done
add wave -noupdate -divider {Registers and ZNC}
add wave -noupdate /test/smachine/cpu/interpreter/register_A
add wave -noupdate /test/smachine/cpu/interpreter/register_B
add wave -noupdate /test/smachine/cpu/interpreter/C
add wave -noupdate /test/smachine/cpu/interpreter/N
add wave -noupdate /test/smachine/cpu/interpreter/Z
add wave -noupdate -divider FSM
add wave -noupdate /test/smachine/cpu/fsm/start
add wave -noupdate /test/smachine/cpu/fsm/done
add wave -noupdate /test/smachine/cpu/fsm/state
add wave -noupdate -divider {Inst Memory}
add wave -noupdate /test/smachine/inst_memory/PC
add wave -noupdate /test/smachine/inst_memory/inst
add wave -noupdate -divider {Data Memory}
add wave -noupdate /test/smachine/data_memory/addr
add wave -noupdate /test/smachine/data_memory/data_in_memory
add wave -noupdate /test/smachine/data_memory/data_out_memory
add wave -noupdate /test/smachine/data_memory/read_write
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {105 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 276
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {147 ps}
