/* Leaf functions of the MPC2000XL OS, written back as C for Microsoft C/C++
 * 8.00c: cl /c /AL /G2 /Ox /Gy.  Names are the labels in ../xl/common/flash;
 * the 2K SYS's C is in t1*.c and t2*.c. */

#include "mpc2kxl.h"
#include <conio.h>

/* The XL's voice record is two bytes longer than the 2K's, one in front. */
struct voice {
	char pad;
	char state;
	char rest[18];
};

extern char P_9A4E[32];
extern int TBL_574E[32], VOICE_TIMER[32], VOICE_HOLD[32], TBL_578E[32];

/* Not __pascal, as the 2K's is. */
void voice_release(int v)
{
	if (P_9A4E[v] == 0) {
		VOICE_HOLD[v] = VOICE_TIMER[v] = TBL_574E[v] = 0;
		TBL_578E[v] = 3;
		((struct voice *)VOICE_TABLE)[v].state = -1;
		outpw(0x80, v | 0x400);
		outpw(0x82, 0xf448);
		outpw(0x84, 0);
	}
}

struct blk { int w[32]; };
struct six { char a, b, c, d, e, f; };
struct snd { char name[8]; unsigned char n; };

extern struct blk B_0494;
extern char far *TBL_073C[11];

void L_3E4EE(unsigned addr, int ctl)
{
	outpw(0xc034, addr);
	outp(0xc036, ctl);
}

void far_3F46E(struct blk far *p)
{
	*p = B_0494;
}

void far_3F556(struct six far *p)
{
	int n;

	for (n = 0x40; n; n--) {
		p->a = 100;
		p->b = 50;
		p->c = 100;
		p->d = 0;
		p->e = 0;
		p->f = 0;
		p++;
	}
}

int L_3F9AC(struct snd far *a, struct snd far *b)
{
	return a->n - b->n;
}

char far *fs_error_msg(unsigned n)
{
	if (n >= 11)
		n = 10;
	return TBL_073C[n];
}

/* Clears bit 1 of every other P_9A4E byte: the index steps by two, which is
 * what makes CL keep it in bx rather than walk a pointer. */
void far_41A9E(int n)
{
	int i;

	if (n == 16)
		for (i = 0; i < 32; i += 2)
			P_9A4E[i] &= ~2;
}

extern long D_98D8, D_8EC0;
extern int W_D762, W_98A4, W_D7E6;

long pow10_lookup(int n)
{
	return POW10_TABLE[n];
}

void far_4610A(void)
{
	W_D762 = 0x7fff;
	D_98D8 = 0;
	D_8EC0 = 0;
	W_98A4 = 0;
	W_D7E6 = 0;
}
