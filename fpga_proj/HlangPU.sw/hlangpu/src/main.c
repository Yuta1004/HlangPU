#include "string.h"
#include "xil_printf.h"
#include "xil_cache.h"

#define CRST		(*(volatile unsigned int*)(XPAR_CORE_CONTROLLER_0_S_AXI_BASEADDR + 0x0000))
#define CEXEC		(*(volatile unsigned int*)(XPAR_CORE_CONTROLLER_0_S_AXI_BASEADDR + 0x0004))
#define CMEM_ADDR	(*(volatile unsigned int*)(XPAR_CORE_CONTROLLER_0_S_AXI_BASEADDR + 0x0008))
#define CSTAT		(*(volatile unsigned int*)(XPAR_CORE_CONTROLLER_0_S_AXI_BASEADDR + 0x000c))

#define INST_MEM  	( (char*)(0x20000000))

int main(void) {
	Xil_DCacheDisable();

	char *program = "a = 1 ; b = 2 ; c = 1 << a + b ; d = c if ( 1 ) ; out d ; EOF\0";
	strcpy(INST_MEM, program);

	CRST = 0;
	CEXEC = 0;

	CMEM_ADDR = 0x20000000;
	CRST = 1;
	CRST = 0;

	CEXEC = 1;
	CEXEC = 0;

	xil_printf("Result : %d (Wait: 4, Acc: 2, Err: 1)\n", CSTAT & 0x00ff);
	xil_printf("Output : %d\n", (CSTAT & 0xff00) >> 8);

	return 0;
}
