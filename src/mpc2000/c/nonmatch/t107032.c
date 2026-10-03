/* differs: 150 size 50, image 58; +0 image `push si` CL `cmp byte ptr [0x9afe], 0`; 172 size 50, image 58; +0 image `push si` CL `cmp byte ptr [0x9d40], 0` */
#include <conio.h>
extern char P_9D40;
int __far port_c0_read(void);
void __far __fastcall port_c0_write(int);

void __near fn_06FB2(void)
{
	int si_;

	if (!P_9D40) goto br_06FD1;
	outp(0xc031, 2);
	outp(0xc03a, inp(0xc03a) & 0xe3);
loop_06FC9:
	if (!(inp(0xc03b) & 4)) goto loop_06FC9;
br_06FD1:
	P_9D40 = 0;
	si_ = port_c0_read();
	si_ &= -0x1d;
	port_c0_write(si_ | 0x20);
}
