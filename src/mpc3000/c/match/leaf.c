/* Leaf functions of the MPC3000 OS, written back as C for Borland C++ 3.1:
 * bcc -c -ml -O2 -1 -k -DFW_VERSION=nnn.  Names are the labels in ../common. */

#include <string.h>

struct cell { char a, b; };

extern int W_9449[], W_944D, W_D5DF[];
extern long W_9451;
extern struct cell TBL_A7B0[][250];

void fn_b0f4b(char *s)
{
	int n;

	for (n = strlen(s) - 1; n >= 0; n--) {
		if (s[n] == ' ')
			s[n] = 0;
		else
			break;
	}
}

void fn_b0f7e(char *p)
{
	while (*p) {
		if (*p == ' ')
			*p = '_';
		p++;
	}
}

void far_b0fe4(char *p, int n)
{
	while (*p) {
		n--;
		p++;
	}
	while (n-- > 0)
		*p++ = ' ';
	*p = 0;
}

void far_b1941(void)
{
	W_944D = 0x7fff;
	W_9451 = 0;
	W_D5DF[0] = W_D5DF[1] = 0;
	W_9449[1] = W_9449[0] = 0;
}

void fn_b8379(int *p, int lo, int hi, int off)
{
	int r;

#if FW_VERSION >= 311
	r = hi - lo + 1;
#else
	r = hi - lo;
#endif
	if (off > 999)
		off = 999;
	if (*p * r + off > 999)
		*p = (999 - off) / r;
}

int fn_b484b(int n)
{
	int i;

	for (i = 0; i < 249; i++)
		if (TBL_A7B0[n][i].a == 0)
			break;
	return i + 1;
}

int far_e26cc(char *p)
{
	int r;

	r = p[0x150] * 24 + p[0x14f] * 6 + 0x151;
	return r;
}

long far_e26fb(char *p)
{
	return *(long *)(p + 1);
}

int fn_e9324(int a, int b)
{
	return a * 24 + b * 6 + 0x151;
}
