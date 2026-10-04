/* differs: XL v1.20 +0, 212 bytes */
#include <conio.h>
extern int C0_W_SMEM_SIZE;
extern int C0_W_098B6;
extern int C2_W_SMEM_SIZE_HI;
int __near fn_37D26(long, long, int, int);

void __near fn_37C3A(void)
{
	int di_;
	int bx_;

	C0_W_098B6 = 0;
	outp(0xc2, 0);
	switch (fn_37D26(0x10000L, 0x100000L, 4, 0x1001)) { case 0: goto L_37364; }
	di_ = 4;
	goto br_37C88;
L_37364:
	C0_W_098B6 = 0;
	outp(0xc2, 0);
	switch (fn_37D26(0x10000L, 0x100000L, 1, 0x1001)) { case 0: goto L_37386; }
	di_ = 1;
	goto br_37C88;
L_37386:
	di_ = 0;
br_37C88:
	C0_W_098B6 = 4;
	outp(0xc2, 4);
	switch (fn_37D26(0x10000L, 0x100000L, 0x10, 0x1001)) { case 0: goto br_37CAC; }
loop_37CA7:
	bx_ = 0x10;
	goto br_37D17;
br_37CAC:
	C0_W_098B6 = 7;
	outp(0xc2, 7);
	if (fn_37D26(0x10000L, 0x100000L, 0x10, 0x1001)) goto loop_37CA7;
	C0_W_098B6 = 5;
	outp(0xc2, 5);
	if (fn_37D26(0x10000L, 0x100000L, 0x10, 0x1001)) goto loop_37CA7;
	C0_W_098B6 = 6;
	outp(0xc2, 6);
	switch (fn_37D26(0x10000L, 0x100000L, 8, 0x1001)) { case 0: goto br_37D0E; }
	bx_ = di_ + 8;
	goto br_37D17;
br_37D0E:
	C0_W_098B6 = 0;
	outp(0xc2, 0);
	bx_ = di_;
br_37D17:
	C0_W_SMEM_SIZE = 0;
	C2_W_SMEM_SIZE_HI = bx_ << 4;
}
