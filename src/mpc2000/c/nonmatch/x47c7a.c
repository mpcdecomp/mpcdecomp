/* differs: XL v1.20 +3, 17 bytes */
extern char EP_FAR_48768_OFF[1];
extern char EP_FAR_48768_SEG[1];
void __far draw_string_at(long, char __near *, char __near *);
void __far draw_unsigned_value(int, int, long, int);

void __far far_47C7A(long p0, int p2)
{
	if (p2 < 0x23) goto br_47CA0;
	if (p2 <= 0x62) {
		draw_unsigned_value(*(int *)&p0, ((int *)&p0)[1], (long)p2, 2);
		return;
	}
br_47CA0:
	draw_string_at(p0, EP_FAR_48768_OFF, EP_FAR_48768_SEG);
}
