/* differs: XL v1.20 +0, 66 bytes */
extern char C0_B_098B8;
extern char C0_B_0D7C7;
extern char C0_TBL_09160[1];
extern char C2_B_098B9;
extern char C2_B_COPY_FX_DST_SET;
extern char C2_W_0466C[1];
extern char C2_W_046D8[1];
extern char C2_W_098BA;
extern int C2_W_COPY_FX_CURSOR;
void __far handler_set_install(char far *);

void __far L_52450(void)
{
	int si_;

	handler_set_install(C2_W_0466C);
	si_ = C0_B_0D7C7;
	C2_B_098B9 = C0_TBL_09160[si_ * 388];
	C0_B_098B8 = C2_B_098B9;
	C2_B_COPY_FX_DST_SET = C0_B_0D7C7;
	C2_W_098BA = C0_B_0D7C7;
	if (C2_W_COPY_FX_CURSOR < 0) goto br_52488;
	if ((unsigned)C2_W_COPY_FX_CURSOR < 4) goto br_5248E;
br_52488:
	C2_W_COPY_FX_CURSOR = 0;
br_5248E:
	((int (__far *)(void))*(long *)(C2_W_046D8 + C2_W_COPY_FX_CURSOR * 42))();
}
