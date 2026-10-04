/* differs: XL v1.20 +3, 98 bytes */
void __far draw_char_at(int, int, int);
void __far far_47CB4(long, int, long);
void __far far_47D5E(char far *, long);

void __far L_47CFE(char far *p0, int p2, char far *p3, char far *p5)
{
	int dx_;

	far_47CB4(p0, p2, p3);
	if (p2 < 0x23) goto br_47D2C;
	if (p2 > 0x62) goto br_47D2C;
	dx_ = 1;
	goto br_47D2E;
br_47D2C:
	dx_ = 0;
br_47D2E:
	if (!dx_) goto br_47D5A;
	draw_char_at(FP_OFF(p0 + 0x24), ((int *)&p0)[1], 0x2d);
	far_47D5E(p0 + 0x2a, p5);
br_47D5A:
	;
}
