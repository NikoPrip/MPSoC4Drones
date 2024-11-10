// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "ximg_thresholding.h"

extern XImg_thresholding_Config XImg_thresholding_ConfigTable[];

XImg_thresholding_Config *XImg_thresholding_LookupConfig(u16 DeviceId) {
	XImg_thresholding_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XIMG_THRESHOLDING_NUM_INSTANCES; Index++) {
		if (XImg_thresholding_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XImg_thresholding_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XImg_thresholding_Initialize(XImg_thresholding *InstancePtr, u16 DeviceId) {
	XImg_thresholding_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XImg_thresholding_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XImg_thresholding_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

