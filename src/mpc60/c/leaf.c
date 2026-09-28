/* Leaf functions of the MPC60 OS v2.14, written back as C for Aztec C86
 * 3.40a: cc +LC +F -n, then as -S.  Names are the labels in ../common.
 * K&R, as the compiler takes nothing else. */

struct cell { char a, b; };

extern char B_A426[], *W_A61A, B_A61C, B_A622;
extern struct cell TBL_5517[][250];
extern int W_8D82, W_53D5[], W_8D84[];
extern long W_8D7C;

far_d97f5()
{
	B_A426[0] = 0;
	B_A426[1] = 0;
	W_A61A = B_A426;
	W_A61A++;
	B_A61C = 0;
	B_A622 = 1;
}

far_da067(p)
char *p;
{
	while (*p) {
		if (*p == ' ')
			*p = '_';
		p++;
	}
}

far_da083(d)
char *d;
{
	char *s;

	s = d;
	while (*s == ' ')
		s++;
	while (*s)
		*d++ = *s++;
	*d = 0;
}

far_da0bd(p, n)
char *p;
int n;
{
	while (*p) {
		n--;
		p++;
	}
	while (n-- > 0)
		*p++ = ' ';
	*p = 0;
}

far_e1617(n)
int n;
{
	int i;

	while (n) {
		for (i = 0; i < 1500; i++)
			;
		n--;
	}
}

far_e2fd8(p, lo, hi, off)
int *p, lo, hi, off;
{
	int r;

	r = hi - lo;
	if (off > 999)
		off = 999;
	if (*p * r + off > 999)
		*p = (999 - off) / r;
}

far_e4b4f(n)
int n;
{
	int i;

	for (i = 0; i < 249; i++)
		if (TBL_5517[n][i].a == 0)
			break;
	return i + 1;
}

far_e544a(a, b, max)
int *a, *b, max;
{
	if (*a > max)
		*a = max;
	if (*a < 1)
		*a = 1;
	if (*b <= *a)
		*b = *a + 1;
	if (*b > max + 1)
		*b = max + 1;
}

far_efe2c()
{
	W_8D82 = 0x7fff;
	W_8D7C = 0;
	W_53D5[0] = W_53D5[1] = 0;
	W_8D84[0] = W_8D84[1] = 0;
}
