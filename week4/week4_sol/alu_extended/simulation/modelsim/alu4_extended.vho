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

-- DATE "06/25/2026 23:52:13"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	alu4_extended IS
    PORT (
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	op : IN std_logic_vector(2 DOWNTO 0);
	result : OUT std_logic_vector(3 DOWNTO 0);
	zero : OUT std_logic;
	carry : OUT std_logic;
	negative : OUT std_logic
	);
END alu4_extended;

-- Design Ports Information
-- result[0]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[1]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[2]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[3]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- zero	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- negative	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[0]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[1]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[2]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF alu4_extended IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_op : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_result : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_zero : std_logic;
SIGNAL ww_carry : std_logic;
SIGNAL ww_negative : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \op[0]~input_o\ : std_logic;
SIGNAL \op[1]~input_o\ : std_logic;
SIGNAL \op[2]~input_o\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \ALT_INV_a[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_op[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_op[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_op[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~9_sumout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_op <= op;
result <= ww_result;
zero <= ww_zero;
carry <= ww_carry;
negative <= ww_negative;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Add0~5_sumout\ <= NOT \Add0~5_sumout\;
\ALT_INV_Add0~1_sumout\ <= NOT \Add0~1_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add1~9_sumout\ <= NOT \Add1~9_sumout\;
\ALT_INV_a[3]~input_o\ <= NOT \a[3]~input_o\;
\ALT_INV_b[3]~input_o\ <= NOT \b[3]~input_o\;
\ALT_INV_a[2]~input_o\ <= NOT \a[2]~input_o\;
\ALT_INV_b[2]~input_o\ <= NOT \b[2]~input_o\;
\ALT_INV_a[1]~input_o\ <= NOT \a[1]~input_o\;
\ALT_INV_b[1]~input_o\ <= NOT \b[1]~input_o\;
\ALT_INV_a[0]~input_o\ <= NOT \a[0]~input_o\;
\ALT_INV_b[0]~input_o\ <= NOT \b[0]~input_o\;
\ALT_INV_op[2]~input_o\ <= NOT \op[2]~input_o\;
\ALT_INV_op[1]~input_o\ <= NOT \op[1]~input_o\;
\ALT_INV_op[0]~input_o\ <= NOT \op[0]~input_o\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_Mux1~1_combout\ <= NOT \Mux1~1_combout\;
\ALT_INV_Mux1~0_combout\ <= NOT \Mux1~0_combout\;
\ALT_INV_Mux2~1_combout\ <= NOT \Mux2~1_combout\;
\ALT_INV_Mux2~0_combout\ <= NOT \Mux2~0_combout\;
\ALT_INV_Mux3~0_combout\ <= NOT \Mux3~0_combout\;
\ALT_INV_Mux0~2_combout\ <= NOT \Mux0~2_combout\;
\ALT_INV_Add0~17_sumout\ <= NOT \Add0~17_sumout\;
\ALT_INV_Add0~13_sumout\ <= NOT \Add0~13_sumout\;
\ALT_INV_Add1~13_sumout\ <= NOT \Add1~13_sumout\;
\ALT_INV_Add0~9_sumout\ <= NOT \Add0~9_sumout\;

-- Location: IOOBUF_X89_Y35_N79
\result[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_result(0));

-- Location: IOOBUF_X89_Y38_N22
\result[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~2_combout\,
	devoe => ww_devoe,
	o => ww_result(1));

-- Location: IOOBUF_X89_Y37_N22
\result[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~2_combout\,
	devoe => ww_devoe,
	o => ww_result(2));

-- Location: IOOBUF_X89_Y37_N56
\result[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~1_combout\,
	devoe => ww_devoe,
	o => ww_result(3));

-- Location: IOOBUF_X89_Y35_N62
\zero~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal0~1_combout\,
	devoe => ww_devoe,
	o => ww_zero);

-- Location: IOOBUF_X89_Y37_N5
\carry~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_carry);

-- Location: IOOBUF_X89_Y37_N39
\negative~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~1_combout\,
	devoe => ww_devoe,
	o => ww_negative);

-- Location: IOIBUF_X89_Y35_N44
\a[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X89_Y36_N21
\b[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: LABCELL_X88_Y36_N0
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \a[0]~input_o\ ) + ( \b[0]~input_o\ ) + ( !VCC ))
-- \Add0~2\ = CARRY(( \a[0]~input_o\ ) + ( \b[0]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_a[0]~input_o\,
	dataf => \ALT_INV_b[0]~input_o\,
	cin => GND,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: IOIBUF_X89_Y9_N4
\op[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(0),
	o => \op[0]~input_o\);

-- Location: IOIBUF_X89_Y38_N38
\op[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(1),
	o => \op[1]~input_o\);

-- Location: IOIBUF_X89_Y38_N4
\op[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(2),
	o => \op[2]~input_o\);

-- Location: LABCELL_X88_Y36_N30
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( !\a[0]~input_o\ $ (!\b[0]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \Add1~2\ = CARRY(( !\a[0]~input_o\ $ (!\b[0]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \Add1~3\ = SHARE((!\b[0]~input_o\) # (\a[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100111111001100000000000000000011110000111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_a[0]~input_o\,
	datac => \ALT_INV_b[0]~input_o\,
	cin => GND,
	sharein => GND,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\,
	shareout => \Add1~3\);

-- Location: LABCELL_X88_Y36_N24
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( !\op[1]~input_o\ & ( (!\op[0]~input_o\ & (\Add0~1_sumout\)) # (\op[0]~input_o\ & (((!\op[2]~input_o\ & (\Add1~1_sumout\)) # (\op[2]~input_o\ & ((!\a[0]~input_o\)))))) ) ) # ( \op[1]~input_o\ & ( ((!\op[0]~input_o\ & (\a[0]~input_o\ & 
-- ((\op[2]~input_o\) # (\b[0]~input_o\)))) # (\op[0]~input_o\ & (!\op[2]~input_o\ & ((\a[0]~input_o\) # (\b[0]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0100011101000111000000110011111101110111010001000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~1_sumout\,
	datab => \ALT_INV_op[0]~input_o\,
	datac => \ALT_INV_b[0]~input_o\,
	datad => \ALT_INV_a[0]~input_o\,
	datae => \ALT_INV_op[1]~input_o\,
	dataf => \ALT_INV_op[2]~input_o\,
	datag => \ALT_INV_Add1~1_sumout\,
	combout => \Mux3~0_combout\);

-- Location: IOIBUF_X89_Y35_N95
\a[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: IOIBUF_X89_Y9_N21
\b[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LABCELL_X88_Y37_N33
\Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = ( \b[1]~input_o\ & ( (!\op[1]~input_o\ & (!\a[1]~input_o\)) # (\op[1]~input_o\ & (!\op[0]~input_o\ & (!\a[1]~input_o\ $ (!\a[0]~input_o\)))) ) ) # ( !\b[1]~input_o\ & ( (!\op[0]~input_o\ & (!\a[1]~input_o\ $ (((!\op[1]~input_o\) # 
-- (!\a[0]~input_o\))))) # (\op[0]~input_o\ & (!\a[1]~input_o\ & (!\op[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010001101000011001000110100010100100101010001010010010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[1]~input_o\,
	datab => \ALT_INV_op[0]~input_o\,
	datac => \ALT_INV_op[1]~input_o\,
	datad => \ALT_INV_a[0]~input_o\,
	dataf => \ALT_INV_b[1]~input_o\,
	combout => \Mux2~1_combout\);

-- Location: LABCELL_X88_Y36_N3
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \b[1]~input_o\ ) + ( \a[1]~input_o\ ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( \b[1]~input_o\ ) + ( \a[1]~input_o\ ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[1]~input_o\,
	datac => \ALT_INV_b[1]~input_o\,
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: LABCELL_X88_Y36_N33
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( !\a[1]~input_o\ $ (\b[1]~input_o\) ) + ( \Add1~3\ ) + ( \Add1~2\ ))
-- \Add1~6\ = CARRY(( !\a[1]~input_o\ $ (\b[1]~input_o\) ) + ( \Add1~3\ ) + ( \Add1~2\ ))
-- \Add1~7\ = SHARE((\a[1]~input_o\ & !\b[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000101000000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[1]~input_o\,
	datac => \ALT_INV_b[1]~input_o\,
	cin => \Add1~2\,
	sharein => \Add1~3\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\,
	shareout => \Add1~7\);

-- Location: LABCELL_X88_Y36_N42
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \a[1]~input_o\ & ( \op[1]~input_o\ & ( (\b[1]~input_o\) # (\op[0]~input_o\) ) ) ) # ( !\a[1]~input_o\ & ( \op[1]~input_o\ & ( (\op[0]~input_o\ & \b[1]~input_o\) ) ) ) # ( \a[1]~input_o\ & ( !\op[1]~input_o\ & ( (!\op[0]~input_o\ & 
-- (\Add0~5_sumout\)) # (\op[0]~input_o\ & ((\Add1~5_sumout\))) ) ) ) # ( !\a[1]~input_o\ & ( !\op[1]~input_o\ & ( (!\op[0]~input_o\ & (\Add0~5_sumout\)) # (\op[0]~input_o\ & ((\Add1~5_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100011101000111010001110100011100000000001100110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~5_sumout\,
	datab => \ALT_INV_op[0]~input_o\,
	datac => \ALT_INV_Add1~5_sumout\,
	datad => \ALT_INV_b[1]~input_o\,
	datae => \ALT_INV_a[1]~input_o\,
	dataf => \ALT_INV_op[1]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LABCELL_X88_Y37_N39
\Mux2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = ( \Mux2~0_combout\ & ( (!\op[2]~input_o\) # (\Mux2~1_combout\) ) ) # ( !\Mux2~0_combout\ & ( (\Mux2~1_combout\ & \op[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000111011101110111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux2~1_combout\,
	datab => \ALT_INV_op[2]~input_o\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \Mux2~2_combout\);

-- Location: IOIBUF_X89_Y38_N55
\a[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: IOIBUF_X89_Y36_N55
\b[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: LABCELL_X88_Y36_N6
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( \b[2]~input_o\ ) + ( \a[2]~input_o\ ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( \b[2]~input_o\ ) + ( \a[2]~input_o\ ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[2]~input_o\,
	datac => \ALT_INV_b[2]~input_o\,
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: LABCELL_X88_Y36_N36
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( !\a[2]~input_o\ $ (\b[2]~input_o\) ) + ( \Add1~7\ ) + ( \Add1~6\ ))
-- \Add1~10\ = CARRY(( !\a[2]~input_o\ $ (\b[2]~input_o\) ) + ( \Add1~7\ ) + ( \Add1~6\ ))
-- \Add1~11\ = SHARE((\a[2]~input_o\ & !\b[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000101000000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[2]~input_o\,
	datac => \ALT_INV_b[2]~input_o\,
	cin => \Add1~6\,
	sharein => \Add1~7\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\,
	shareout => \Add1~11\);

-- Location: LABCELL_X88_Y36_N48
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \a[2]~input_o\ & ( \op[1]~input_o\ & ( (\b[2]~input_o\) # (\op[0]~input_o\) ) ) ) # ( !\a[2]~input_o\ & ( \op[1]~input_o\ & ( (\op[0]~input_o\ & \b[2]~input_o\) ) ) ) # ( \a[2]~input_o\ & ( !\op[1]~input_o\ & ( (!\op[0]~input_o\ & 
-- (\Add0~9_sumout\)) # (\op[0]~input_o\ & ((\Add1~9_sumout\))) ) ) ) # ( !\a[2]~input_o\ & ( !\op[1]~input_o\ & ( (!\op[0]~input_o\ & (\Add0~9_sumout\)) # (\op[0]~input_o\ & ((\Add1~9_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001001110111001000100111011100000101000001010101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_op[0]~input_o\,
	datab => \ALT_INV_Add0~9_sumout\,
	datac => \ALT_INV_b[2]~input_o\,
	datad => \ALT_INV_Add1~9_sumout\,
	datae => \ALT_INV_a[2]~input_o\,
	dataf => \ALT_INV_op[1]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LABCELL_X88_Y37_N42
\Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = ( !\op[0]~input_o\ & ( \a[2]~input_o\ & ( (!\op[1]~input_o\ & (!\b[2]~input_o\)) # (\op[1]~input_o\ & (((!\a[0]~input_o\ & !\a[1]~input_o\)))) ) ) ) # ( \op[0]~input_o\ & ( !\a[2]~input_o\ & ( !\op[1]~input_o\ ) ) ) # ( !\op[0]~input_o\ 
-- & ( !\a[2]~input_o\ & ( (!\op[1]~input_o\ & (\b[2]~input_o\)) # (\op[1]~input_o\ & (((\a[1]~input_o\) # (\a[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100111111111111110000000010101010110000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_b[2]~input_o\,
	datab => \ALT_INV_a[0]~input_o\,
	datac => \ALT_INV_a[1]~input_o\,
	datad => \ALT_INV_op[1]~input_o\,
	datae => \ALT_INV_op[0]~input_o\,
	dataf => \ALT_INV_a[2]~input_o\,
	combout => \Mux1~1_combout\);

-- Location: LABCELL_X88_Y37_N30
\Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = ( \Mux1~1_combout\ & ( (\op[2]~input_o\) # (\Mux1~0_combout\) ) ) # ( !\Mux1~1_combout\ & ( (\Mux1~0_combout\ & !\op[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux1~0_combout\,
	datad => \ALT_INV_op[2]~input_o\,
	dataf => \ALT_INV_Mux1~1_combout\,
	combout => \Mux1~2_combout\);

-- Location: IOIBUF_X89_Y36_N38
\a[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: IOIBUF_X89_Y36_N4
\b[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LABCELL_X88_Y36_N18
\Mux0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = ( !\op[1]~input_o\ & ( ((!\a[3]~input_o\ $ (((!\op[0]~input_o\ & !\b[3]~input_o\))))) ) ) # ( \op[1]~input_o\ & ( (!\op[0]~input_o\ & (!\a[3]~input_o\ $ (((!\a[2]~input_o\ & (!\a[0]~input_o\ & !\a[1]~input_o\)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0011111100111111010011001100110011000000110000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[2]~input_o\,
	datab => \ALT_INV_op[0]~input_o\,
	datac => \ALT_INV_a[0]~input_o\,
	datad => \ALT_INV_a[1]~input_o\,
	datae => \ALT_INV_op[1]~input_o\,
	dataf => \ALT_INV_a[3]~input_o\,
	datag => \ALT_INV_b[3]~input_o\,
	combout => \Mux0~2_combout\);

-- Location: LABCELL_X88_Y36_N9
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \b[3]~input_o\ ) + ( \a[3]~input_o\ ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( \b[3]~input_o\ ) + ( \a[3]~input_o\ ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_b[3]~input_o\,
	datac => \ALT_INV_a[3]~input_o\,
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: LABCELL_X88_Y36_N39
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( !\b[3]~input_o\ $ (\a[3]~input_o\) ) + ( \Add1~11\ ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_b[3]~input_o\,
	datac => \ALT_INV_a[3]~input_o\,
	cin => \Add1~10\,
	sharein => \Add1~11\,
	sumout => \Add1~13_sumout\);

-- Location: LABCELL_X88_Y36_N54
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \b[3]~input_o\ & ( \a[3]~input_o\ & ( ((!\op[0]~input_o\ & (\Add0~13_sumout\)) # (\op[0]~input_o\ & ((\Add1~13_sumout\)))) # (\op[1]~input_o\) ) ) ) # ( !\b[3]~input_o\ & ( \a[3]~input_o\ & ( (!\op[1]~input_o\ & ((!\op[0]~input_o\ & 
-- (\Add0~13_sumout\)) # (\op[0]~input_o\ & ((\Add1~13_sumout\))))) # (\op[1]~input_o\ & (((\op[0]~input_o\)))) ) ) ) # ( \b[3]~input_o\ & ( !\a[3]~input_o\ & ( (!\op[1]~input_o\ & ((!\op[0]~input_o\ & (\Add0~13_sumout\)) # (\op[0]~input_o\ & 
-- ((\Add1~13_sumout\))))) # (\op[1]~input_o\ & (((\op[0]~input_o\)))) ) ) ) # ( !\b[3]~input_o\ & ( !\a[3]~input_o\ & ( (!\op[1]~input_o\ & ((!\op[0]~input_o\ & (\Add0~13_sumout\)) # (\op[0]~input_o\ & ((\Add1~13_sumout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000101010001001010010111100100101001011110111010101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_op[1]~input_o\,
	datab => \ALT_INV_Add0~13_sumout\,
	datac => \ALT_INV_op[0]~input_o\,
	datad => \ALT_INV_Add1~13_sumout\,
	datae => \ALT_INV_b[3]~input_o\,
	dataf => \ALT_INV_a[3]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X88_Y37_N21
\Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = ( \Mux0~0_combout\ & ( \op[2]~input_o\ & ( \Mux0~2_combout\ ) ) ) # ( !\Mux0~0_combout\ & ( \op[2]~input_o\ & ( \Mux0~2_combout\ ) ) ) # ( \Mux0~0_combout\ & ( !\op[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux0~2_combout\,
	datae => \ALT_INV_Mux0~0_combout\,
	dataf => \ALT_INV_op[2]~input_o\,
	combout => \Mux0~1_combout\);

-- Location: LABCELL_X88_Y37_N36
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( \Mux2~0_combout\ & ( (!\Mux2~1_combout\ & (\op[2]~input_o\ & !\Mux3~0_combout\)) ) ) # ( !\Mux2~0_combout\ & ( (!\Mux3~0_combout\ & ((!\Mux2~1_combout\) # (!\op[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000011100000111000001110000000100000001000000010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux2~1_combout\,
	datab => \ALT_INV_op[2]~input_o\,
	datac => \ALT_INV_Mux3~0_combout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \Equal0~0_combout\);

-- Location: LABCELL_X88_Y37_N24
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( \Equal0~0_combout\ & ( \op[2]~input_o\ & ( (!\Mux0~2_combout\ & !\Mux1~1_combout\) ) ) ) # ( \Equal0~0_combout\ & ( !\op[2]~input_o\ & ( (!\Mux1~0_combout\ & !\Mux0~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101000001010000000000000000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux1~0_combout\,
	datab => \ALT_INV_Mux0~2_combout\,
	datac => \ALT_INV_Mux0~0_combout\,
	datad => \ALT_INV_Mux1~1_combout\,
	datae => \ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_op[2]~input_o\,
	combout => \Equal0~1_combout\);

-- Location: LABCELL_X88_Y36_N12
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( GND ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\);

-- Location: LABCELL_X88_Y37_N0
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( !\op[0]~input_o\ & ( !\op[1]~input_o\ & ( (\Add0~17_sumout\ & !\op[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Add0~17_sumout\,
	datad => \ALT_INV_op[2]~input_o\,
	datae => \ALT_INV_op[0]~input_o\,
	dataf => \ALT_INV_op[1]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LABCELL_X62_Y16_N0
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


