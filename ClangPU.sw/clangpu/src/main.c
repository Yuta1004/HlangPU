#include "xil_printf.h"

#define CRST	(*(volatile unsigned int*)(XPAR_CORE_CONTROLLER_0_S_AXI_BASEADDR + 0x0000))
#define CSTAT	(*(volatile unsigned int*)(XPAR_CORE_CONTROLLER_0_S_AXI_BASEADDR + 0x0004))

int main(void) {
	xil_printf("Hello! ClangPU project.\n");
	xil_printf("    -> Status : %d\n", CSTAT);
	return 0;
}
