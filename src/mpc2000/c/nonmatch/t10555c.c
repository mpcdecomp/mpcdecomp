/* differs: 150 size 84, image 88; +5 image `and ax, 0xf` CL `and al, 0xf`; 172 size 84, image 88; +5 image `and ax, 0xf` CL `and al, 0xf` */
extern unsigned char EDIT_CURSOR_X;
extern char EDIT_CURSOR_Y;
extern char G_PAD_INDEX;
extern char far *PTR_TRACK_DATA;
extern char WIN_FIELD_BOX_W;
void __far __pascal timer_value_read_1(char far *, int, int, int);

void __near L_054DC(void)
{
	int si_;
	int di_;

	di_ = (G_PAD_INDEX & 0xf) % 4;
	si_ = (G_PAD_INDEX & 0xf) / 4;
	timer_value_read_1(PTR_TRACK_DATA + G_PAD_INDEX, 0x5b, 0xa, 1);
	EDIT_CURSOR_X = (char)((char)di_ * 0x36) + 0x13;
	EDIT_CURSOR_Y = -(((char)si_ << 3) - 0x2b);
	WIN_FIELD_BOX_W = 0x30;
}
