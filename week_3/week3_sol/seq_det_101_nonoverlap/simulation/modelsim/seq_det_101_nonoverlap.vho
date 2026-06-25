-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "06/25/2026 19:13:54"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	seq_det IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	data : IN std_logic;
	detected : OUT std_logic
	);
END seq_det;

-- Design Ports Information
-- detected	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF seq_det IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_data : std_logic;
SIGNAL ww_detected : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \data~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \current_state~9_combout\ : std_logic;
SIGNAL \current_state.S_INIT~q\ : std_logic;
SIGNAL \current_state~8_combout\ : std_logic;
SIGNAL \current_state.S_1~q\ : std_logic;
SIGNAL \current_state~7_combout\ : std_logic;
SIGNAL \current_state.S_10~q\ : std_logic;
SIGNAL \current_state~6_combout\ : std_logic;
SIGNAL \current_state.S_101~q\ : std_logic;
SIGNAL \ALT_INV_current_state.S_10~q\ : std_logic;
SIGNAL \ALT_INV_current_state.S_101~q\ : std_logic;
SIGNAL \ALT_INV_current_state.S_1~q\ : std_logic;
SIGNAL \ALT_INV_current_state.S_INIT~q\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_data~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_data <= data;
detected <= ww_detected;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_current_state.S_10~q\ <= NOT \current_state.S_10~q\;
\ALT_INV_current_state.S_101~q\ <= NOT \current_state.S_101~q\;
\ALT_INV_current_state.S_1~q\ <= NOT \current_state.S_1~q\;
\ALT_INV_current_state.S_INIT~q\ <= NOT \current_state.S_INIT~q\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_data~input_o\ <= NOT \data~input_o\;

-- Location: IOOBUF_X89_Y38_N56
\detected~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.S_101~q\,
	devoe => ww_devoe,
	o => ww_detected);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y38_N4
\data~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data,
	o => \data~input_o\);

-- Location: IOIBUF_X89_Y38_N21
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LABCELL_X88_Y38_N12
\current_state~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state~9_combout\ = ( \current_state.S_10~q\ & ( (\data~input_o\ & (!\current_state.S_101~q\ & !\reset~input_o\)) ) ) # ( !\current_state.S_10~q\ & ( (!\current_state.S_101~q\ & (!\reset~input_o\ & ((\current_state.S_INIT~q\) # (\data~input_o\)))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000011000000010000001100000001000000010000000100000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data~input_o\,
	datab => \ALT_INV_current_state.S_101~q\,
	datac => \ALT_INV_reset~input_o\,
	datad => \ALT_INV_current_state.S_INIT~q\,
	dataf => \ALT_INV_current_state.S_10~q\,
	combout => \current_state~9_combout\);

-- Location: FF_X88_Y38_N13
\current_state.S_INIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_INIT~q\);

-- Location: LABCELL_X88_Y38_N30
\current_state~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state~8_combout\ = ( \current_state.S_1~q\ & ( \current_state.S_INIT~q\ & ( (!\reset~input_o\ & \data~input_o\) ) ) ) # ( \current_state.S_1~q\ & ( !\current_state.S_INIT~q\ & ( (!\reset~input_o\ & \data~input_o\) ) ) ) # ( !\current_state.S_1~q\ 
-- & ( !\current_state.S_INIT~q\ & ( (!\reset~input_o\ & \data~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000000000000000000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_data~input_o\,
	datae => \ALT_INV_current_state.S_1~q\,
	dataf => \ALT_INV_current_state.S_INIT~q\,
	combout => \current_state~8_combout\);

-- Location: FF_X88_Y38_N31
\current_state.S_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_state~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_1~q\);

-- Location: LABCELL_X88_Y38_N15
\current_state~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state~7_combout\ = ( \current_state.S_1~q\ & ( (!\data~input_o\ & !\reset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data~input_o\,
	datac => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_current_state.S_1~q\,
	combout => \current_state~7_combout\);

-- Location: FF_X88_Y38_N17
\current_state.S_10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_state~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_10~q\);

-- Location: LABCELL_X88_Y38_N57
\current_state~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state~6_combout\ = ( !\reset~input_o\ & ( \current_state.S_10~q\ & ( \data~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data~input_o\,
	datae => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_current_state.S_10~q\,
	combout => \current_state~6_combout\);

-- Location: FF_X88_Y38_N59
\current_state.S_101\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_state~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_101~q\);

-- Location: LABCELL_X43_Y12_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


