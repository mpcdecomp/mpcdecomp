/* differs: XL v1.20 +3, 80 bytes */
extern char C0_B_098B8;
extern char C0_TBL_09160[1];
extern char C2_B_098B9;
extern int C2_B_PAD_DRUM;
extern char C2_B_PAD_NOTE;
extern char C2_TBL_037FC[1];
extern long C2_W_08D72;
extern char C2_W_098BA;
extern int C2_W_COPY_NOTE_CURSOR;
extern char CP_WIN[1];
void __far handler_set_install(char far *);

void __far far_4FA52(long p0)
{
	int si_;

	C2_W_08D72 = p0;
	handler_set_install(CP_WIN);
	if (C2_W_COPY_NOTE_CURSOR < 0) goto br_4FA7D;
	if ((unsigned)C2_W_COPY_NOTE_CURSOR < 4) goto br_4FA83;
br_4FA7D:
	C2_W_COPY_NOTE_CURSOR = 0;
br_4FA83:
	si_ = C2_B_PAD_DRUM;
	si_ &= 0xff;
	C2_B_098B9 = C0_TBL_09160[si_ * 388];
	C0_B_098B8 = C2_B_098B9;
	C2_W_098BA = C2_B_PAD_NOTE;
	((int (__far *)(void))*(long *)(C2_TBL_037FC + C2_W_COPY_NOTE_CURSOR * 42))();
}
