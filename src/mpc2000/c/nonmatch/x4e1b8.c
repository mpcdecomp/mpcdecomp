/* differs: XL v1.20 +4, 46 bytes */
extern unsigned char C2_B_PAD_DRUM;
extern char C2_B_PAD_NOTE;
extern char C2_TBL_02C9C[1];
extern int C2_W_PGM_ASSIGN_CURSOR;
char far * __far ivt_get_vector(int);

void __far far_4E1B8(int p0)
{
	int si_;
	int dx_;

	si_ = ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0];
	if (si_ < 0x23) goto L_4D88A;
	if (si_ > 0x62) goto L_4D88A;
	dx_ = 1;
	goto br_4E1EC;
L_4D88A:
	dx_ = 0;
br_4E1EC:
	if (!dx_) goto br_4E1F3;
	C2_B_PAD_NOTE = (char)si_;
br_4E1F3:
	((int (__far *)(void))*(long *)(C2_TBL_02C9C + C2_W_PGM_ASSIGN_CURSOR * 42))();
}
