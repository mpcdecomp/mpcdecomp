/* differs: XL v1.20 +6, 67 bytes */
extern char C1_SEG[1];
extern char C2_W_0268C[1];
extern long C2_W_02696;
extern char C2_W_08D4C[1];
extern int C2_W_08D52;
extern int C2_W_08D54;
extern char C2_W_0F1DC[1];
extern int C2_W_TS_CURSOR;
void __far ui_field_engine(char far *, char far *);

void __far L_4D108(void)
{
	int ax_;

	C2_W_TS_CURSOR = 0;
	if (C2_W_08D52 != C2_W_0F1DC) goto br_4D124;
	if (C2_W_08D54 != C1_SEG) goto br_4D124;
	ax_ = 8;
	goto br_4D127;
br_4D124:
	ax_ = 7;
br_4D127:
	C2_W_02696 = (long)ax_;
	ui_field_engine(C2_W_0268C, C2_W_08D4C);
}
