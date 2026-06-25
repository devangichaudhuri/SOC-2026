transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Devangi/Documents/SOC_2026/week3/seq_det_101_nonoverlap/seq_det.vhd}

vcom -93 -work work {C:/Users/Devangi/Documents/SOC_2026/week3/seq_det_101_nonoverlap/tb_seq_det.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb_seq_det

add wave *
view structure
view signals
run -all
