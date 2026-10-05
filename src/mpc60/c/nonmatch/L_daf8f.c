/* differs: +10 mov ax, word ptr W_52CE_V112_ | mov dx, word ptr [W_52CE_V112] */
extern char B_4CBE_V112;
extern char B_52B5_V112;
extern char B_52E2_V112;
extern char B_52E3_V112;
extern char B_BED2_V112;
extern char B_BED3_V112;
extern long W_52CC_V112;
extern int W_52CE_V112;
extern int W_BED4_V112;
extern int W_BED6_V112;
extern int W_BED8_V112;
extern int W_BEDA_V112;

L_daf8f()
{
	B_BED2_V112 = B_52B5_V112;
	W_BED4_V112 = B_4CBE_V112;
	W_BEDA_V112 = W_52CE_V112;
	W_BED8_V112 = W_52CC_V112;
	B_BED3_V112 = B_52E3_V112;
	W_BED6_V112 = B_52E2_V112;
	return;
}
