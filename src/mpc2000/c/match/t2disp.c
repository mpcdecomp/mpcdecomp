/* MPC2000 SYS text2: display-list commands, each built on the stack and run by
 * text1's disp_list_run (../2k/common/sys/text2.asm). */

#include "mpc2k.h"

#pragma pack(1)

typedef struct { int quot, rem; } div_t;
div_t __cdecl div(int, int);
#pragma intrinsic(strcpy, strlen)

/* Every list ends on a zero command byte. */
struct op_bbl { char op, a, b; long v; char end; };
struct op_bbb { char op, a, b, c; int end; };
struct op_bbbb { char op, a, b, c, d, end; };
struct op_bbw { char op, a, b; int w; char end; };
struct op_w { char op; int w; char end; };
struct op_bbbl { char op, a, b, c; long v; char end; };
struct op_b3 { char op, a, b, c; char end; };
struct c4 { char a, b, c, d; };
struct op_bc4 { char a, op; struct c4 c; char end; };

void __pascal cmd_dispatch_1E(char a, char b, long v)
{
	struct op_bbl l;

	l.op = 0x1e;
	l.a = a;
	l.b = b;
	l.v = v;
	l.end = 0;
	((void (__far __pascal *)(void __far *))disp_list_run)(&l);
}

void __pascal cmd_ratio_setup(int a, int b, char c)
{
	struct op_bbb l;

	l.op = 7;
	l.a = a;
	l.b = b;
	l.c = c;
	l.end = 0;
	((void (__far __pascal *)(void __far *))disp_list_run)(&l);
}

void cmd_far_stub(void)
{
	int l;

	l = 5;
	((void (__far __pascal *)(void __far *))disp_list_run)(&l);
}

/* A value right-aligned in n digits at pixel (x, y). */
void __pascal draw_unsigned_value(int x, int y, long v, int n)
{
	struct op_bbbl l;

	l.op = 0x17;
	l.a = x;
	l.b = y;
	l.c = n;
	l.v = v;
	l.end = 0;
	((void (__far __pascal *)(void __far *))disp_list_run)(&l);
}

