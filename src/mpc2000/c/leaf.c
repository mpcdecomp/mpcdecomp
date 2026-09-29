/* Leaf functions of the MPC2000 SYS and MPC2000XL OS, written back as C for
 * Microsoft C/C++ 8.00c: cl /c /AL /G2 /Ox /Gy, plus /DXL for the XL.
 * Names are the labels in ../2k/common/sys and ../xl/common/flash. */

#include <conio.h>

/* The XL's voice record is two bytes longer, one of them in front. */
struct voice {
#ifdef XL
	char pad;
#endif
	char state;
#ifdef XL
	char rest[18];
#else
	char rest[17];
#endif
};

extern char P_9A4E[32];
extern int TBL_574E[32], VOICE_TIMER[32], VOICE_HOLD[32], TBL_578E[32];
extern struct voice VOICE_TABLE[32];

/* The XL's voice_release is the one not __pascal. */
#ifdef XL
#define DECL
#else
#define DECL __pascal
#endif

void DECL voice_release(int v)
{
	if (P_9A4E[v] == 0) {
		VOICE_HOLD[v] = VOICE_TIMER[v] = TBL_574E[v] = 0;
		TBL_578E[v] = 3;
		VOICE_TABLE[v].state = -1;
		outpw(0x80, v | 0x400);
		outpw(0x82, 0xf448);
		outpw(0x84, 0);
	}
}

#ifdef XL

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

#else

extern char G_PENDING_DMA_MASK;

void __pascal pending_ops_set(char mask)
{
	G_PENDING_DMA_MASK = mask;
}

#endif
