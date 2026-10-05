extern unsigned char B_94E2;
extern unsigned char B_94E3;
extern int W_52C6_V112;
extern int W_94E4;

L_de80e(a0, a1)
char a0;
char a1;
{
	B_94E2 = a0;
	B_94E3 = a1;
	W_94E4 = B_94E2 * 384 / B_94E3;
	W_52C6_V112 = 384 / B_94E3;
	return;
}
