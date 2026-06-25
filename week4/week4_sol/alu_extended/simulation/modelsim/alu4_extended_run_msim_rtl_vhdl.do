transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Devangi/Documents/week4_sol/alu_extended/alu4_extended.vhd}

vcom -93 -work work {C:/Users/Devangi/Documents/week4_sol/alu_extended/tb_alu4_extended.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb_alu4_extended

add wave *
view structure
view signals
run -all
