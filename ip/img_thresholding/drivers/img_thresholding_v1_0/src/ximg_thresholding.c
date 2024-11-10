// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "ximg_thresholding.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XImg_thresholding_CfgInitialize(XImg_thresholding *InstancePtr, XImg_thresholding_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_bus_BaseAddress = ConfigPtr->Ctrl_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XImg_thresholding_Start(XImg_thresholding *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImg_thresholding_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_AP_CTRL) & 0x80;
    XImg_thresholding_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XImg_thresholding_IsDone(XImg_thresholding *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImg_thresholding_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XImg_thresholding_IsIdle(XImg_thresholding *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImg_thresholding_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XImg_thresholding_IsReady(XImg_thresholding *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XImg_thresholding_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XImg_thresholding_EnableAutoRestart(XImg_thresholding *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImg_thresholding_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_AP_CTRL, 0x80);
}

void XImg_thresholding_DisableAutoRestart(XImg_thresholding *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImg_thresholding_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_AP_CTRL, 0);
}

void XImg_thresholding_InterruptGlobalEnable(XImg_thresholding *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImg_thresholding_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_GIE, 1);
}

void XImg_thresholding_InterruptGlobalDisable(XImg_thresholding *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImg_thresholding_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_GIE, 0);
}

void XImg_thresholding_InterruptEnable(XImg_thresholding *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XImg_thresholding_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_IER);
    XImg_thresholding_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_IER, Register | Mask);
}

void XImg_thresholding_InterruptDisable(XImg_thresholding *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XImg_thresholding_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_IER);
    XImg_thresholding_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_IER, Register & (~Mask));
}

void XImg_thresholding_InterruptClear(XImg_thresholding *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XImg_thresholding_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_ISR, Mask);
}

u32 XImg_thresholding_InterruptGetEnabled(XImg_thresholding *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XImg_thresholding_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_IER);
}

u32 XImg_thresholding_InterruptGetStatus(XImg_thresholding *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XImg_thresholding_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XIMG_THRESHOLDING_CTRL_BUS_ADDR_ISR);
}

