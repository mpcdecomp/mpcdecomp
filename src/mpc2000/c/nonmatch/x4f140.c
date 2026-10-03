/* differs: XL v1.20 +6, 19 bytes */
extern unsigned char C1_B_0D7BF;
extern int C2_FP_PGM_ARRAY;
extern char C2_W_033FC[1];
extern int C2_W_PGM_ARRAY_SEG;
extern int C2_W_PROGRAM_CURSOR;
extern char EP_FIELD_HANDLER_NOP_2_OFF[1];
extern char EP_FIELD_HANDLER_NOP_2_SEG[1];
void __far handler_install_one(int, char __near *, char __near *);
void __far ui_field_engine(char far *, int, int);

void __far L_4F140(void)
{
	C2_W_PROGRAM_CURSOR = 1;
	ui_field_engine(C2_W_033FC, C1_B_0D7BF * 0x99e + C2_FP_PGM_ARRAY + 0x1c, C2_W_PGM_ARRAY_SEG);
	handler_install_one(0x37, EP_FIELD_HANDLER_NOP_2_OFF, EP_FIELD_HANDLER_NOP_2_SEG);
}
