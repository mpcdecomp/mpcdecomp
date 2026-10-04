/* differs: 150 size 22, image 24; +14 image `pop si` CL `ret`; 172 size 22, image 24; +14 image `pop si` CL `ret` */
extern char G_PAD_NOTE_BASE[1];
extern char WIN_FIELD_BOX_W;
void __far __pascal timer_value_read_1(char far *, int, int, int);

void __near X_05D88(void)
{
	timer_value_read_1(G_PAD_NOTE_BASE, 0x37, 0xb, 0);
	WIN_FIELD_BOX_W = 0xa2;
}
