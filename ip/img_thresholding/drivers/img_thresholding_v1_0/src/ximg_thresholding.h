// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XIMG_THRESHOLDING_H
#define XIMG_THRESHOLDING_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "ximg_thresholding_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Ctrl_bus_BaseAddress;
} XImg_thresholding_Config;
#endif

typedef struct {
    u64 Ctrl_bus_BaseAddress;
    u32 IsReady;
} XImg_thresholding;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XImg_thresholding_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XImg_thresholding_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XImg_thresholding_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XImg_thresholding_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XImg_thresholding_Initialize(XImg_thresholding *InstancePtr, u16 DeviceId);
XImg_thresholding_Config* XImg_thresholding_LookupConfig(u16 DeviceId);
int XImg_thresholding_CfgInitialize(XImg_thresholding *InstancePtr, XImg_thresholding_Config *ConfigPtr);
#else
int XImg_thresholding_Initialize(XImg_thresholding *InstancePtr, const char* InstanceName);
int XImg_thresholding_Release(XImg_thresholding *InstancePtr);
#endif

void XImg_thresholding_Start(XImg_thresholding *InstancePtr);
u32 XImg_thresholding_IsDone(XImg_thresholding *InstancePtr);
u32 XImg_thresholding_IsIdle(XImg_thresholding *InstancePtr);
u32 XImg_thresholding_IsReady(XImg_thresholding *InstancePtr);
void XImg_thresholding_EnableAutoRestart(XImg_thresholding *InstancePtr);
void XImg_thresholding_DisableAutoRestart(XImg_thresholding *InstancePtr);


void XImg_thresholding_InterruptGlobalEnable(XImg_thresholding *InstancePtr);
void XImg_thresholding_InterruptGlobalDisable(XImg_thresholding *InstancePtr);
void XImg_thresholding_InterruptEnable(XImg_thresholding *InstancePtr, u32 Mask);
void XImg_thresholding_InterruptDisable(XImg_thresholding *InstancePtr, u32 Mask);
void XImg_thresholding_InterruptClear(XImg_thresholding *InstancePtr, u32 Mask);
u32 XImg_thresholding_InterruptGetEnabled(XImg_thresholding *InstancePtr);
u32 XImg_thresholding_InterruptGetStatus(XImg_thresholding *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
