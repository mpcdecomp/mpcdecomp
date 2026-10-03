/* differs: XL v1.20 +12, 73 bytes */
extern unsigned char C2_B_PAD_DRUM;
extern char C2_B_PAD_NOTE;
extern char C2_W_02DDE[1];
extern long C2_W_02DE4;
extern int C2_W_PGM_ASSIGN_CURSOR;
char far * __far ivt_get_vector(int);
void __far pgm_assign_focus_6(void);
void __far ui_field_engine(char far *, char far *);

void __far pgm_assign_focus_threshold2(void)
{
	char far *v0;

	v0 = ivt_get_vector(C2_B_PAD_DRUM + 0x5c);
	if (!*(v0 + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a)) goto br_4E514;
	if (*(v0 + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a) != 1) {
		C2_W_PGM_ASSIGN_CURSOR = 8;
		C2_W_02DE4 = (long)((unsigned char)(v0 + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a)[1] + 1);
		ui_field_engine(C2_W_02DDE, v0 + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a + 3);
		return;
	}
br_4E514:
	pgm_assign_focus_6();
}
