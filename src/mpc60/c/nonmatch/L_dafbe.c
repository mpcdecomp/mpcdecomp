/* differs: +1d cmp byte ptr B_BED2_V112_,0 | mov ax, 1 */
extern char B_BED2_V112;
extern char B_BED3_V112;
extern int W_BED4_V112;
extern int W_BED6_V112;
extern int W_BED8_V112;
extern int W_BEDA_V112;

L_dafbe()
{
	if (B_BED3_V112 != -1)
		far_eddc3(W_BED6_V112);
	else
		L_e5326();
	if (B_BED2_V112 >= 0)
		L_d97d2(W_BED8_V112, W_BEDA_V112);
	return;
}
