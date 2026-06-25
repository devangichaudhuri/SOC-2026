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

-- DATE "06/25/2026 11:58:54"

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

ENTITY 	vending_machine IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	coin5 : IN std_logic;
	coin10 : IN std_logic;
	dispense : OUT std_logic;
	change : OUT std_logic
	);
END vending_machine;

-- Design Ports Information
-- dispense	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- change	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- coin5	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- coin10	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF vending_machine IS
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
SIGNAL ww_coin5 : std_logic;
SIGNAL ww_coin10 : std_logic;
SIGNAL ww_dispense : std_logic;
SIGNAL ww_change : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \coin10~input_o\ : std_logic;
SIGNAL \coin5~input_o\ : std_logic;
SIGNAL \current_state~9_combout\ : std_logic;
SIGNAL \current_state.S10~q\ : std_logic;
SIGNAL \current_state~8_combout\ : std_logic;
SIGNAL \current_state.DISP_C~q\ : std_logic;
SIGNAL \current_state~11_combout\ : std_logic;
SIGNAL \current_state.S0~q\ : std_logic;
SIGNAL \current_state~10_combout\ : std_logic;
SIGNAL \current_state.S5~q\ : std_logic;
SIGNAL \current_state~7_combout\ : std_logic;
SIGNAL \current_state.DISP~q\ : std_logic;
SIGNAL \dispense~0_combout\ : std_logic;
SIGNAL \ALT_INV_current_state.S5~q\ : std_logic;
SIGNAL \ALT_INV_current_state.S0~q\ : std_logic;
SIGNAL \ALT_INV_current_state.DISP~q\ : std_logic;
SIGNAL \ALT_INV_current_state.DISP_C~q\ : std_logic;
SIGNAL \ALT_INV_current_state.S10~q\ : std_logic;
SIGNAL \ALT_INV_coin10~input_o\ : std_logic;
SIGNAL \ALT_INV_coin5~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_coin5 <= coin5;
ww_coin10 <= coin10;
dispense <= ww_dispense;
change <= ww_change;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_current_state.S5~q\ <= NOT \current_state.S5~q\;
\ALT_INV_current_state.S0~q\ <= NOT \current_state.S0~q\;
\ALT_INV_current_state.DISP~q\ <= NOT \current_state.DISP~q\;
\ALT_INV_current_state.DISP_C~q\ <= NOT \current_state.DISP_C~q\;
\ALT_INV_current_state.S10~q\ <= NOT \current_state.S10~q\;
\ALT_INV_coin10~input_o\ <= NOT \coin10~input_o\;
\ALT_INV_coin5~input_o\ <= NOT \coin5~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;

-- Location: IOOBUF_X89_Y38_N5
\dispense~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dispense~0_combout\,
	devoe => ww_devoe,
	o => ww_dispense);

-- Location: IOOBUF_X89_Y37_N5
\change~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.DISP_C~q\,
	devoe => ww_devoe,
	o => ww_change);

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

-- Location: IOIBUF_X89_Y38_N38
\coin10~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_coin10,
	o => \coin10~input_o\);

-- Location: IOIBUF_X89_Y38_N55
\coin5~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_coin5,
	o => \coin5~input_o\);

-- Location: LABCELL_X88_Y38_N48
\current_state~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state~9_combout\ = ( \current_state.S10~q\ & ( \current_state.S0~q\ & ( (!\reset~input_o\ & ((!\coin5~input_o\ & (!\coin10~input_o\)) # (\coin5~input_o\ & ((\current_state.S5~q\))))) ) ) ) # ( !\current_state.S10~q\ & ( \current_state.S0~q\ & ( 
-- (\coin5~input_o\ & (\current_state.S5~q\ & !\reset~input_o\)) ) ) ) # ( \current_state.S10~q\ & ( !\current_state.S0~q\ & ( (!\reset~input_o\ & ((!\coin5~input_o\) # (\current_state.S5~q\))) ) ) ) # ( !\current_state.S10~q\ & ( !\current_state.S0~q\ & ( 
-- (!\reset~input_o\ & ((!\coin5~input_o\ & (\coin10~input_o\)) # (\coin5~input_o\ & ((\current_state.S5~q\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010011100000000101011110000000000000101000000001000110100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_coin5~input_o\,
	datab => \ALT_INV_coin10~input_o\,
	datac => \ALT_INV_current_state.S5~q\,
	datad => \ALT_INV_reset~input_o\,
	datae => \ALT_INV_current_state.S10~q\,
	dataf => \ALT_INV_current_state.S0~q\,
	combout => \current_state~9_combout\);

-- Location: FF_X88_Y38_N50
\current_state.S10\ : dffeas
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
	q => \current_state.S10~q\);

-- Location: LABCELL_X88_Y38_N6
\current_state~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state~8_combout\ = ( !\coin5~input_o\ & ( \current_state.S10~q\ & ( (\coin10~input_o\ & !\reset~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110000001100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_coin10~input_o\,
	datac => \ALT_INV_reset~input_o\,
	datae => \ALT_INV_coin5~input_o\,
	dataf => \ALT_INV_current_state.S10~q\,
	combout => \current_state~8_combout\);

-- Location: FF_X88_Y38_N8
\current_state.DISP_C\ : dffeas
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
	q => \current_state.DISP_C~q\);

-- Location: LABCELL_X88_Y38_N18
\current_state~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state~11_combout\ = ( \current_state.S0~q\ & ( !\current_state.DISP_C~q\ & ( (!\reset~input_o\ & !\current_state.DISP~q\) ) ) ) # ( !\current_state.S0~q\ & ( !\current_state.DISP_C~q\ & ( (!\reset~input_o\ & (!\current_state.DISP~q\ & 
-- ((\coin10~input_o\) # (\coin5~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_coin5~input_o\,
	datab => \ALT_INV_coin10~input_o\,
	datac => \ALT_INV_reset~input_o\,
	datad => \ALT_INV_current_state.DISP~q\,
	datae => \ALT_INV_current_state.S0~q\,
	dataf => \ALT_INV_current_state.DISP_C~q\,
	combout => \current_state~11_combout\);

-- Location: FF_X88_Y38_N20
\current_state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_state~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S0~q\);

-- Location: LABCELL_X88_Y38_N36
\current_state~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state~10_combout\ = ( \current_state.S0~q\ & ( (!\reset~input_o\ & (!\coin10~input_o\ & (!\coin5~input_o\ & \current_state.S5~q\))) ) ) # ( !\current_state.S0~q\ & ( (!\reset~input_o\ & (((!\coin10~input_o\ & \current_state.S5~q\)) # 
-- (\coin5~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010001010000010101000101000000000100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \ALT_INV_coin10~input_o\,
	datac => \ALT_INV_coin5~input_o\,
	datad => \ALT_INV_current_state.S5~q\,
	dataf => \ALT_INV_current_state.S0~q\,
	combout => \current_state~10_combout\);

-- Location: FF_X88_Y38_N38
\current_state.S5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_state~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S5~q\);

-- Location: LABCELL_X88_Y38_N57
\current_state~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state~7_combout\ = ( \current_state.S5~q\ & ( \current_state.S10~q\ & ( (!\reset~input_o\ & ((\coin5~input_o\) # (\coin10~input_o\))) ) ) ) # ( !\current_state.S5~q\ & ( \current_state.S10~q\ & ( (!\reset~input_o\ & \coin5~input_o\) ) ) ) # ( 
-- \current_state.S5~q\ & ( !\current_state.S10~q\ & ( (!\reset~input_o\ & (\coin10~input_o\ & !\coin5~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000000000000000101010100000101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_coin10~input_o\,
	datad => \ALT_INV_coin5~input_o\,
	datae => \ALT_INV_current_state.S5~q\,
	dataf => \ALT_INV_current_state.S10~q\,
	combout => \current_state~7_combout\);

-- Location: FF_X88_Y38_N59
\current_state.DISP\ : dffeas
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
	q => \current_state.DISP~q\);

-- Location: LABCELL_X88_Y38_N39
\dispense~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dispense~0_combout\ = ( \current_state.DISP_C~q\ ) # ( !\current_state.DISP_C~q\ & ( \current_state.DISP~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_current_state.DISP~q\,
	dataf => \ALT_INV_current_state.DISP_C~q\,
	combout => \dispense~0_combout\);

-- Location: LABCELL_X13_Y71_N3
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


