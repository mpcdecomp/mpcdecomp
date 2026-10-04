#include "mpc2k.h"
#include <conio.h>

void __far __pascal mpc_poll_data(int v)
{
	int s;

	PUSHF();
	_disable();
	s = inpw(ASIC_DMA_C038);
	outpw(ASIC_DMA_C038, s | 4);
	outp(ASIC_DMA_C03F, inp(ASIC_DMA_C03F) | v);
	outpw(ASIC_DMA_C038, s);
	POPF();
}

void __far __pascal mpc_poll_data2(int v)
{
	int s;

	v = ~v;
	PUSHF();
	_disable();
	s = inpw(ASIC_DMA_C038);
	outpw(ASIC_DMA_C038, s | 4);
	outp(ASIC_DMA_C03F, inp(ASIC_DMA_C03F) & v);
	outpw(ASIC_DMA_C038, s);
	POPF();
}
