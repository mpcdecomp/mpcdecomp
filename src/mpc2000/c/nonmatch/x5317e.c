/* differs: XL v1.20 +0, 97 bytes */
extern char C2_W_07A1D[1];
extern char EP_FAR_4877E_OFF[1];
extern char EP_FAR_4877E_SEG[1];
void __far draw_bitmap_ptr(int, int, char far *);
void __far draw_signed_value(int, int, long, int);
void __far draw_string_at(int, int, char __near *, char __near *);

void __far far_5317E(int p0, int p1, char p2)
{
	int si_;
	int di_;

	if (p2 > 0xdb) {
		di_ = p1;
		si_ = p0;
		draw_signed_value(si_, di_, (long)p2, 2);
	} else {
		di_ = p1;
		si_ = p0;
		draw_bitmap_ptr(si_, di_ + 1, C2_W_07A1D);
	}
	draw_string_at(si_ + 0x12, di_, EP_FAR_4877E_OFF, EP_FAR_4877E_SEG);
}
