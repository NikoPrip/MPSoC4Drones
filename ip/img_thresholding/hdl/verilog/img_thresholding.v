// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="img_thresholding_img_thresholding,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu3eg-sbva484-1-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.111000,HLS_SYN_LAT=307203,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=86,HLS_SYN_LUT=187,HLS_VERSION=2020_2}" *)

module img_thresholding (
        ap_clk,
        ap_rst_n,
        inStream_TDATA,
        inStream_TVALID,
        inStream_TREADY,
        inStream_TKEEP,
        inStream_TSTRB,
        inStream_TUSER,
        inStream_TLAST,
        inStream_TID,
        inStream_TDEST,
        outStream_TDATA,
        outStream_TVALID,
        outStream_TREADY,
        outStream_TKEEP,
        outStream_TSTRB,
        outStream_TUSER,
        outStream_TLAST,
        outStream_TID,
        outStream_TDEST,
        s_axi_CTRL_BUS_AWVALID,
        s_axi_CTRL_BUS_AWREADY,
        s_axi_CTRL_BUS_AWADDR,
        s_axi_CTRL_BUS_WVALID,
        s_axi_CTRL_BUS_WREADY,
        s_axi_CTRL_BUS_WDATA,
        s_axi_CTRL_BUS_WSTRB,
        s_axi_CTRL_BUS_ARVALID,
        s_axi_CTRL_BUS_ARREADY,
        s_axi_CTRL_BUS_ARADDR,
        s_axi_CTRL_BUS_RVALID,
        s_axi_CTRL_BUS_RREADY,
        s_axi_CTRL_BUS_RDATA,
        s_axi_CTRL_BUS_RRESP,
        s_axi_CTRL_BUS_BVALID,
        s_axi_CTRL_BUS_BREADY,
        s_axi_CTRL_BUS_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state5 = 3'd4;
parameter    C_S_AXI_CTRL_BUS_DATA_WIDTH = 32;
parameter    C_S_AXI_CTRL_BUS_ADDR_WIDTH = 4;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CTRL_BUS_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
input  [31:0] inStream_TDATA;
input   inStream_TVALID;
output   inStream_TREADY;
input  [3:0] inStream_TKEEP;
input  [3:0] inStream_TSTRB;
input  [1:0] inStream_TUSER;
input  [0:0] inStream_TLAST;
input  [4:0] inStream_TID;
input  [5:0] inStream_TDEST;
output  [31:0] outStream_TDATA;
output   outStream_TVALID;
input   outStream_TREADY;
output  [3:0] outStream_TKEEP;
output  [3:0] outStream_TSTRB;
output  [1:0] outStream_TUSER;
output  [0:0] outStream_TLAST;
output  [4:0] outStream_TID;
output  [5:0] outStream_TDEST;
input   s_axi_CTRL_BUS_AWVALID;
output   s_axi_CTRL_BUS_AWREADY;
input  [C_S_AXI_CTRL_BUS_ADDR_WIDTH - 1:0] s_axi_CTRL_BUS_AWADDR;
input   s_axi_CTRL_BUS_WVALID;
output   s_axi_CTRL_BUS_WREADY;
input  [C_S_AXI_CTRL_BUS_DATA_WIDTH - 1:0] s_axi_CTRL_BUS_WDATA;
input  [C_S_AXI_CTRL_BUS_WSTRB_WIDTH - 1:0] s_axi_CTRL_BUS_WSTRB;
input   s_axi_CTRL_BUS_ARVALID;
output   s_axi_CTRL_BUS_ARREADY;
input  [C_S_AXI_CTRL_BUS_ADDR_WIDTH - 1:0] s_axi_CTRL_BUS_ARADDR;
output   s_axi_CTRL_BUS_RVALID;
input   s_axi_CTRL_BUS_RREADY;
output  [C_S_AXI_CTRL_BUS_DATA_WIDTH - 1:0] s_axi_CTRL_BUS_RDATA;
output  [1:0] s_axi_CTRL_BUS_RRESP;
output   s_axi_CTRL_BUS_BVALID;
input   s_axi_CTRL_BUS_BREADY;
output  [1:0] s_axi_CTRL_BUS_BRESP;
output   interrupt;

 reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
reg    inStream_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
wire   [0:0] icmp_ln18_fu_136_p2;
reg    outStream_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter1;
reg   [0:0] icmp_ln18_reg_189;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] icmp_ln18_reg_189_pp0_iter1_reg;
reg   [18:0] i_reg_119;
wire   [18:0] i_1_fu_130_p2;
reg    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
reg    ap_block_state4_pp0_stage0_iter2;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage0_11001;
reg   [3:0] valOut_keep_V_reg_193;
reg   [3:0] valOut_strb_V_reg_198;
reg   [1:0] valOut_user_V_reg_203;
reg   [0:0] valOut_last_V_reg_208;
reg   [4:0] valOut_id_V_reg_213;
reg   [5:0] valOut_dest_V_reg_218;
wire   [0:0] valOut_data_V_fu_170_p2;
reg   [0:0] valOut_data_V_reg_223;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_block_pp0_stage0_01001;
wire    ap_CS_fsm_state5;
wire    regslice_both_outStream_V_data_V_U_apdone_blk;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_inStream_V_data_V_U_apdone_blk;
wire   [31:0] inStream_TDATA_int_regslice;
wire    inStream_TVALID_int_regslice;
reg    inStream_TREADY_int_regslice;
wire    regslice_both_inStream_V_data_V_U_ack_in;
wire    regslice_both_inStream_V_keep_V_U_apdone_blk;
wire   [3:0] inStream_TKEEP_int_regslice;
wire    regslice_both_inStream_V_keep_V_U_vld_out;
wire    regslice_both_inStream_V_keep_V_U_ack_in;
wire    regslice_both_inStream_V_strb_V_U_apdone_blk;
wire   [3:0] inStream_TSTRB_int_regslice;
wire    regslice_both_inStream_V_strb_V_U_vld_out;
wire    regslice_both_inStream_V_strb_V_U_ack_in;
wire    regslice_both_inStream_V_user_V_U_apdone_blk;
wire   [1:0] inStream_TUSER_int_regslice;
wire    regslice_both_inStream_V_user_V_U_vld_out;
wire    regslice_both_inStream_V_user_V_U_ack_in;
wire    regslice_both_inStream_V_last_V_U_apdone_blk;
wire   [0:0] inStream_TLAST_int_regslice;
wire    regslice_both_inStream_V_last_V_U_vld_out;
wire    regslice_both_inStream_V_last_V_U_ack_in;
wire    regslice_both_inStream_V_id_V_U_apdone_blk;
wire   [4:0] inStream_TID_int_regslice;
wire    regslice_both_inStream_V_id_V_U_vld_out;
wire    regslice_both_inStream_V_id_V_U_ack_in;
wire    regslice_both_inStream_V_dest_V_U_apdone_blk;
wire   [5:0] inStream_TDEST_int_regslice;
wire    regslice_both_inStream_V_dest_V_U_vld_out;
wire    regslice_both_inStream_V_dest_V_U_ack_in;
wire   [31:0] outStream_TDATA_int_regslice;
reg    outStream_TVALID_int_regslice;
wire    outStream_TREADY_int_regslice;
wire    regslice_both_outStream_V_data_V_U_vld_out;
wire    regslice_both_outStream_V_keep_V_U_apdone_blk;
wire    regslice_both_outStream_V_keep_V_U_ack_in_dummy;
wire    regslice_both_outStream_V_keep_V_U_vld_out;
wire    regslice_both_outStream_V_strb_V_U_apdone_blk;
wire    regslice_both_outStream_V_strb_V_U_ack_in_dummy;
wire    regslice_both_outStream_V_strb_V_U_vld_out;
wire    regslice_both_outStream_V_user_V_U_apdone_blk;
wire    regslice_both_outStream_V_user_V_U_ack_in_dummy;
wire    regslice_both_outStream_V_user_V_U_vld_out;
wire    regslice_both_outStream_V_last_V_U_apdone_blk;
wire    regslice_both_outStream_V_last_V_U_ack_in_dummy;
wire    regslice_both_outStream_V_last_V_U_vld_out;
wire    regslice_both_outStream_V_id_V_U_apdone_blk;
wire    regslice_both_outStream_V_id_V_U_ack_in_dummy;
wire    regslice_both_outStream_V_id_V_U_vld_out;
wire    regslice_both_outStream_V_dest_V_U_apdone_blk;
wire    regslice_both_outStream_V_dest_V_U_ack_in_dummy;
wire    regslice_both_outStream_V_dest_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

img_thresholding_CTRL_BUS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CTRL_BUS_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CTRL_BUS_DATA_WIDTH ))
CTRL_BUS_s_axi_U(
    .AWVALID(s_axi_CTRL_BUS_AWVALID),
    .AWREADY(s_axi_CTRL_BUS_AWREADY),
    .AWADDR(s_axi_CTRL_BUS_AWADDR),
    .WVALID(s_axi_CTRL_BUS_WVALID),
    .WREADY(s_axi_CTRL_BUS_WREADY),
    .WDATA(s_axi_CTRL_BUS_WDATA),
    .WSTRB(s_axi_CTRL_BUS_WSTRB),
    .ARVALID(s_axi_CTRL_BUS_ARVALID),
    .ARREADY(s_axi_CTRL_BUS_ARREADY),
    .ARADDR(s_axi_CTRL_BUS_ARADDR),
    .RVALID(s_axi_CTRL_BUS_RVALID),
    .RREADY(s_axi_CTRL_BUS_RREADY),
    .RDATA(s_axi_CTRL_BUS_RDATA),
    .RRESP(s_axi_CTRL_BUS_RRESP),
    .BVALID(s_axi_CTRL_BUS_BVALID),
    .BREADY(s_axi_CTRL_BUS_BREADY),
    .BRESP(s_axi_CTRL_BUS_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

img_thresholding_regslice_both #(
    .DataWidth( 32 ))
regslice_both_inStream_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(inStream_TDATA),
    .vld_in(inStream_TVALID),
    .ack_in(regslice_both_inStream_V_data_V_U_ack_in),
    .data_out(inStream_TDATA_int_regslice),
    .vld_out(inStream_TVALID_int_regslice),
    .ack_out(inStream_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStream_V_data_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 4 ))
regslice_both_inStream_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(inStream_TKEEP),
    .vld_in(inStream_TVALID),
    .ack_in(regslice_both_inStream_V_keep_V_U_ack_in),
    .data_out(inStream_TKEEP_int_regslice),
    .vld_out(regslice_both_inStream_V_keep_V_U_vld_out),
    .ack_out(inStream_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStream_V_keep_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 4 ))
regslice_both_inStream_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(inStream_TSTRB),
    .vld_in(inStream_TVALID),
    .ack_in(regslice_both_inStream_V_strb_V_U_ack_in),
    .data_out(inStream_TSTRB_int_regslice),
    .vld_out(regslice_both_inStream_V_strb_V_U_vld_out),
    .ack_out(inStream_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStream_V_strb_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 2 ))
regslice_both_inStream_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(inStream_TUSER),
    .vld_in(inStream_TVALID),
    .ack_in(regslice_both_inStream_V_user_V_U_ack_in),
    .data_out(inStream_TUSER_int_regslice),
    .vld_out(regslice_both_inStream_V_user_V_U_vld_out),
    .ack_out(inStream_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStream_V_user_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 1 ))
regslice_both_inStream_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(inStream_TLAST),
    .vld_in(inStream_TVALID),
    .ack_in(regslice_both_inStream_V_last_V_U_ack_in),
    .data_out(inStream_TLAST_int_regslice),
    .vld_out(regslice_both_inStream_V_last_V_U_vld_out),
    .ack_out(inStream_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStream_V_last_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 5 ))
regslice_both_inStream_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(inStream_TID),
    .vld_in(inStream_TVALID),
    .ack_in(regslice_both_inStream_V_id_V_U_ack_in),
    .data_out(inStream_TID_int_regslice),
    .vld_out(regslice_both_inStream_V_id_V_U_vld_out),
    .ack_out(inStream_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStream_V_id_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 6 ))
regslice_both_inStream_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(inStream_TDEST),
    .vld_in(inStream_TVALID),
    .ack_in(regslice_both_inStream_V_dest_V_U_ack_in),
    .data_out(inStream_TDEST_int_regslice),
    .vld_out(regslice_both_inStream_V_dest_V_U_vld_out),
    .ack_out(inStream_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStream_V_dest_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 32 ))
regslice_both_outStream_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(outStream_TDATA_int_regslice),
    .vld_in(outStream_TVALID_int_regslice),
    .ack_in(outStream_TREADY_int_regslice),
    .data_out(outStream_TDATA),
    .vld_out(regslice_both_outStream_V_data_V_U_vld_out),
    .ack_out(outStream_TREADY),
    .apdone_blk(regslice_both_outStream_V_data_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 4 ))
regslice_both_outStream_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(valOut_keep_V_reg_193),
    .vld_in(outStream_TVALID_int_regslice),
    .ack_in(regslice_both_outStream_V_keep_V_U_ack_in_dummy),
    .data_out(outStream_TKEEP),
    .vld_out(regslice_both_outStream_V_keep_V_U_vld_out),
    .ack_out(outStream_TREADY),
    .apdone_blk(regslice_both_outStream_V_keep_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 4 ))
regslice_both_outStream_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(valOut_strb_V_reg_198),
    .vld_in(outStream_TVALID_int_regslice),
    .ack_in(regslice_both_outStream_V_strb_V_U_ack_in_dummy),
    .data_out(outStream_TSTRB),
    .vld_out(regslice_both_outStream_V_strb_V_U_vld_out),
    .ack_out(outStream_TREADY),
    .apdone_blk(regslice_both_outStream_V_strb_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 2 ))
regslice_both_outStream_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(valOut_user_V_reg_203),
    .vld_in(outStream_TVALID_int_regslice),
    .ack_in(regslice_both_outStream_V_user_V_U_ack_in_dummy),
    .data_out(outStream_TUSER),
    .vld_out(regslice_both_outStream_V_user_V_U_vld_out),
    .ack_out(outStream_TREADY),
    .apdone_blk(regslice_both_outStream_V_user_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 1 ))
regslice_both_outStream_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(valOut_last_V_reg_208),
    .vld_in(outStream_TVALID_int_regslice),
    .ack_in(regslice_both_outStream_V_last_V_U_ack_in_dummy),
    .data_out(outStream_TLAST),
    .vld_out(regslice_both_outStream_V_last_V_U_vld_out),
    .ack_out(outStream_TREADY),
    .apdone_blk(regslice_both_outStream_V_last_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 5 ))
regslice_both_outStream_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(valOut_id_V_reg_213),
    .vld_in(outStream_TVALID_int_regslice),
    .ack_in(regslice_both_outStream_V_id_V_U_ack_in_dummy),
    .data_out(outStream_TID),
    .vld_out(regslice_both_outStream_V_id_V_U_vld_out),
    .ack_out(outStream_TREADY),
    .apdone_blk(regslice_both_outStream_V_id_V_U_apdone_blk)
);

img_thresholding_regslice_both #(
    .DataWidth( 6 ))
regslice_both_outStream_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(valOut_dest_V_reg_218),
    .vld_in(outStream_TVALID_int_regslice),
    .ack_in(regslice_both_outStream_V_dest_V_U_ack_in_dummy),
    .data_out(outStream_TDEST),
    .vld_out(regslice_both_outStream_V_dest_V_U_vld_out),
    .ack_out(outStream_TREADY),
    .apdone_blk(regslice_both_outStream_V_dest_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln18_fu_136_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_reg_119 <= i_1_fu_130_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_119 <= 19'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln18_reg_189 <= icmp_ln18_fu_136_p2;
        icmp_ln18_reg_189_pp0_iter1_reg <= icmp_ln18_reg_189;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln18_fu_136_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        valOut_data_V_reg_223 <= valOut_data_V_fu_170_p2;
        valOut_dest_V_reg_218 <= inStream_TDEST_int_regslice;
        valOut_id_V_reg_213 <= inStream_TID_int_regslice;
        valOut_keep_V_reg_193 <= inStream_TKEEP_int_regslice;
        valOut_last_V_reg_208 <= inStream_TLAST_int_regslice;
        valOut_strb_V_reg_198 <= inStream_TSTRB_int_regslice;
        valOut_user_V_reg_203 <= inStream_TUSER_int_regslice;
    end
end

always @ (*) begin
    if ((icmp_ln18_fu_136_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_outStream_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_outStream_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln18_fu_136_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        inStream_TDATA_blk_n = inStream_TVALID_int_regslice;
    end else begin
        inStream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln18_fu_136_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        inStream_TREADY_int_regslice = 1'b1;
    end else begin
        inStream_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln18_reg_189_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((icmp_ln18_reg_189 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        outStream_TDATA_blk_n = outStream_TREADY_int_regslice;
    end else begin
        outStream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln18_reg_189 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        outStream_TVALID_int_regslice = 1'b1;
    end else begin
        outStream_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln18_fu_136_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln18_fu_136_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((regslice_both_outStream_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((icmp_ln18_reg_189_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (outStream_TREADY_int_regslice == 1'b0)) | ((icmp_ln18_reg_189 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (outStream_TREADY_int_regslice == 1'b0)) | ((icmp_ln18_fu_136_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (inStream_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state4_io) | ((icmp_ln18_reg_189_pp0_iter1_reg == 1'd0) & (outStream_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln18_reg_189 == 1'd0) & (outStream_TREADY_int_regslice == 1'b0)))) | ((icmp_ln18_fu_136_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (inStream_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state4_io) | ((icmp_ln18_reg_189_pp0_iter1_reg == 1'd0) & (outStream_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln18_reg_189 == 1'd0) & (outStream_TREADY_int_regslice == 1'b0)))) | ((icmp_ln18_fu_136_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (inStream_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter0 = ((icmp_ln18_fu_136_p2 == 1'd0) & (inStream_TVALID_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state3_io = ((icmp_ln18_reg_189 == 1'd0) & (outStream_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = ((icmp_ln18_reg_189 == 1'd0) & (outStream_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state4_io = ((icmp_ln18_reg_189_pp0_iter1_reg == 1'd0) & (outStream_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state4_pp0_stage0_iter2 = ((icmp_ln18_reg_189_pp0_iter1_reg == 1'd0) & (outStream_TREADY_int_regslice == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign i_1_fu_130_p2 = (i_reg_119 + 19'd1);

assign icmp_ln18_fu_136_p2 = ((i_reg_119 == 19'd307200) ? 1'b1 : 1'b0);

assign inStream_TREADY = regslice_both_inStream_V_data_V_U_ack_in;

assign outStream_TDATA_int_regslice = ((valOut_data_V_reg_223[0:0] == 1'b1) ? 32'd255 : 32'd0);

assign outStream_TVALID = regslice_both_outStream_V_data_V_U_vld_out;

assign valOut_data_V_fu_170_p2 = (($signed(inStream_TDATA_int_regslice) > $signed(32'd121)) ? 1'b1 : 1'b0);

endmodule //img_thresholding
