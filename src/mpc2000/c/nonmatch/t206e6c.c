/* differs: 150 size 60, image 56; +0 image `mov al, byte ptr [0x8aa0]` CL `enter 2, 0`; 172 size 60, image 56; +0 image `mov al, byte ptr [0x8ce0]` CL `enter 2, 0` */
extern char G_EDIT_FIELD_VAL[1];
extern unsigned char G_PAD_NOTE_BASE;
void __far L_070FA(void);
char far * __far __pascal note_clamp_flag(int);
void __far __pascal status_read_6A_3(char far *, int, int, int, char, char, long, void (far *)(void));

void __far X_0724A(void)
{
	char l1;
	char l2;

	G_EDIT_FIELD_VAL[0] = *note_clamp_flag(G_PAD_NOTE_BASE);
	status_read_6A_3(G_EDIT_FIELD_VAL, 0, 0x64, 3, l1, l2, 0L, L_070FA);
}
