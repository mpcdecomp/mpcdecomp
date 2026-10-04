/* differs: 150 size 30, image 26; +0 image `push ds` CL `enter 2, 0`; 172 size 30, image 26; +0 image `push ds` CL `enter 2, 0` */
extern char G_PAD_NOTE_BASE[1];
extern char WIN_FIELD_BOX_W;
void __far __pascal timer_value_read_1(char far *, char, char, int);

void __far X_07230(void)
{
	char l1;
	char l2;

	timer_value_read_1(G_PAD_NOTE_BASE, l1, l2, 0);
	WIN_FIELD_BOX_W += 0x66;
}
