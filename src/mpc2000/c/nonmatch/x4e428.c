/* differs: XL v1.20 +12, 60 bytes */
extern unsigned char C2_B_PAD_DRUM;
extern char C2_B_PAD_NOTE;
extern char C2_W_02DB4[1];
extern int C2_W_PGM_ASSIGN_CURSOR;
char far * __far ivt_get_vector(int);
void __far pgm_assign_focus_6(void);
void __far ui_field_engine(char far *, char far *);

void __far pgm_assign_mode_field(void)
{
	char far *v0;

	v0 = ivt_get_vector(C2_B_PAD_DRUM + 0x5c);
	if (!*(v0 + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a)) goto br_4E472;
	if (*(v0 + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a) != 1) {
		C2_W_PGM_ASSIGN_CURSOR = 7;
		ui_field_engine(C2_W_02DB4, v0 + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a + 1);
		return;
	}
br_4E472:
	pgm_assign_focus_6();
}
