/* differs: +10 shl al,1 | cbw */
extern char B_4C31;
extern unsigned char B_5B1C_V112;
extern unsigned char B_A065;
extern char B_A066;
extern char TBL_4443_2[];
extern int W_A061;

far_e5842()
{
	B_A065 = TBL_4443_2[B_4C31];
	B_A066 = B_A065 << 1;
	W_A061 = (B_A065 * B_5B1C_V112 + 25) / 50;
	return;
}
