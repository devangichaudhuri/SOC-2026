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

-- DATE "06/24/2026 11:13:45"

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

ENTITY 	mod_counter IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	enable : IN std_logic;
	tick : OUT std_logic;
	count : OUT std_logic_vector(3 DOWNTO 0)
	);
END mod_counter;

-- Design Ports Information
-- tick	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[0]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[1]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[2]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[3]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF mod_counter IS
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
SIGNAL ww_enable : std_logic;
SIGNAL ww_tick : std_logic;
SIGNAL ww_count : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \count_int[0]~3_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \count_int[2]~1_combout\ : std_logic;
SIGNAL \count_int~2_combout\ : std_logic;
SIGNAL \count_int~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \tick_int~q\ : std_logic;
SIGNAL count_int : std_logic_vector(3 DOWNTO 0);
SIGNAL ALT_INV_count_int : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_enable~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_enable <= enable;
tick <= ww_tick;
count <= ww_count;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
ALT_INV_count_int(2) <= NOT count_int(2);
ALT_INV_count_int(3) <= NOT count_int(3);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_enable~input_o\ <= NOT \enable~input_o\;
ALT_INV_count_int(0) <= NOT count_int(0);
ALT_INV_count_int(1) <= NOT count_int(1);

-- Location: IOOBUF_X8_Y0_N19
\tick~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \tick_int~q\,
	devoe => ww_devoe,
	o => ww_tick);

-- Location: IOOBUF_X8_Y0_N36
\count[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => count_int(0),
	devoe => ww_devoe,
	o => ww_count(0));

-- Location: IOOBUF_X6_Y0_N53
\count[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => count_int(1),
	devoe => ww_devoe,
	o => ww_count(1));

-- Location: IOOBUF_X8_Y0_N2
\count[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => count_int(2),
	devoe => ww_devoe,
	o => ww_count(2));

-- Location: IOOBUF_X6_Y0_N19
\count[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => count_int(3),
	devoe => ww_devoe,
	o => ww_count(3));

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

-- Location: IOIBUF_X6_Y0_N35
\enable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: MLABCELL_X6_Y1_N39
\count_int[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \count_int[0]~3_combout\ = !count_int(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count_int(0),
	combout => \count_int[0]~3_combout\);

-- Location: IOIBUF_X6_Y0_N1
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X6_Y1_N41
\count_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \count_int[0]~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_int(0));

-- Location: MLABCELL_X6_Y1_N24
\count_int[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \count_int[2]~1_combout\ = ( count_int(2) & ( count_int(1) & ( (!\enable~input_o\) # (!count_int(0)) ) ) ) # ( !count_int(2) & ( count_int(1) & ( (\enable~input_o\ & count_int(0)) ) ) ) # ( count_int(2) & ( !count_int(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000011111111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_enable~input_o\,
	datad => ALT_INV_count_int(0),
	datae => ALT_INV_count_int(2),
	dataf => ALT_INV_count_int(1),
	combout => \count_int[2]~1_combout\);

-- Location: FF_X6_Y1_N26
\count_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \count_int[2]~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_int(2));

-- Location: MLABCELL_X6_Y1_N57
\count_int~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \count_int~2_combout\ = ( count_int(3) & ( count_int(1) & ( (!count_int(0)) # (!count_int(2)) ) ) ) # ( !count_int(3) & ( count_int(1) & ( (count_int(0) & count_int(2)) ) ) ) # ( count_int(3) & ( !count_int(1) & ( (!count_int(0)) # (count_int(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111111100000000000011111111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count_int(0),
	datad => ALT_INV_count_int(2),
	datae => ALT_INV_count_int(3),
	dataf => ALT_INV_count_int(1),
	combout => \count_int~2_combout\);

-- Location: FF_X6_Y1_N59
\count_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \count_int~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_int(3));

-- Location: MLABCELL_X6_Y1_N48
\count_int~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \count_int~0_combout\ = ( count_int(1) & ( count_int(3) & ( !count_int(0) ) ) ) # ( !count_int(1) & ( count_int(3) & ( (count_int(2) & count_int(0)) ) ) ) # ( count_int(1) & ( !count_int(3) & ( !count_int(0) ) ) ) # ( !count_int(1) & ( !count_int(3) & ( 
-- count_int(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111111111110000000000000000000011111111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count_int(2),
	datad => ALT_INV_count_int(0),
	datae => ALT_INV_count_int(1),
	dataf => ALT_INV_count_int(3),
	combout => \count_int~0_combout\);

-- Location: FF_X6_Y1_N50
\count_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \count_int~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_int(1));

-- Location: MLABCELL_X6_Y1_N36
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( count_int(0) & ( (!count_int(1) & (!count_int(2) & count_int(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000101000000000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count_int(1),
	datac => ALT_INV_count_int(2),
	datad => ALT_INV_count_int(3),
	dataf => ALT_INV_count_int(0),
	combout => \Equal0~0_combout\);

-- Location: FF_X6_Y1_N37
tick_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Equal0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tick_int~q\);

-- Location: LABCELL_X73_Y43_N3
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


