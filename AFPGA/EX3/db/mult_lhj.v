//lpm_mult CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone V" DSP_BLOCK_BALANCING="Auto" LPM_REPRESENTATION="UNSIGNED" MAXIMIZE_SPEED=5 dataa datab result CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 13.1 cbx_cycloneii 2013:10:23:18:05:48:SJ cbx_lpm_add_sub 2013:10:23:18:05:48:SJ cbx_lpm_mult 2013:10:23:18:05:48:SJ cbx_mgl 2013:10:23:18:06:54:SJ cbx_padd 2013:10:23:18:05:48:SJ cbx_stratix 2013:10:23:18:05:48:SJ cbx_stratixii 2013:10:23:18:05:48:SJ cbx_util_mgl 2013:10:23:18:05:48:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2013 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.



//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mult_lhj
	( 
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   dataa;
	input   datab;
	output   result;


	initial/*synthesis enable_verilog_initial_construct*/
 	begin
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHA has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHB has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHP has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHA has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHB has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHP has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHA has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHB has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHP has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHA has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHB has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHP has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHA has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHB has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHP has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHA has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHB has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHB has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHA has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHA has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHB has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: MGL_INTERNAL_ERROR: Parameter lpm_mult|LPM_WIDTHA has no default value and has not been assigned any value. CAUSE : An attempt was made to access the value of a parameter which has no default, and has not been assigned a value. All parameters should have a default value, or, if the parameter is a required parameter, an assignment should be made. ACTION : Specify a value for the parameter or if the parameter is an optional parameter, specify a default value.");
		$display("Error: Parameter error: value of LPM_WIDTHA parameter must be greater than 0");
	end
endmodule //mult_lhj
//ERROR FILE
