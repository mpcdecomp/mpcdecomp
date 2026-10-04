#include <conio.h>
unsigned __near v53_read_timer(void);

void __far __pascal smem_poll_ready(unsigned seg, unsigned off)
{
	unsigned base;
	unsigned long a;

	base = v53_read_timer();
	a = (unsigned long)seg * 16 + off;
	outpw(base + 4, (unsigned)a);
	outp(base + 6, (unsigned)(a >> 16));
}
