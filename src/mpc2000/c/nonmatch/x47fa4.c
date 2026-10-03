/* differs: XL v1.20 +22, 15 bytes */
void __far draw_unsigned_value(int, int, long, int);
void __far far_4EAD4(int, int);

void __far far_47FA4(int p0, int p1, long p2)
{
	int si_;
	int di_;

	draw_unsigned_value(p0, p1, p2, 8);
	di_ = (unsigned char)(char)(p1 + 7);
	si_ = (unsigned char)(char)(p0 + 0xb);
	far_4EAD4(si_, di_);
	si_ += 0x12;
	far_4EAD4(si_, di_);
}
