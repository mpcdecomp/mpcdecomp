/* differs: XL v1.20 +6, 19 bytes */
extern unsigned char C1_B_0D7BF;
extern int C2_FP_PGM_ARRAY;
extern char C2_W_033D2[1];
extern int C2_W_PGM_ARRAY_SEG;
extern int C2_W_PROGRAM_CURSOR;
void __far ui_field_engine(char far *, int, int);

void __far L_4F118(void)
{
	C2_W_PROGRAM_CURSOR = 0;
	ui_field_engine(C2_W_033D2, C1_B_0D7BF * 0x99e + C2_FP_PGM_ARRAY + 2, C2_W_PGM_ARRAY_SEG);
}
