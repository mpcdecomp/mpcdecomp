/* differs: XL v1.20 +3, 44 bytes */
void __far draw_char_at(int, int, int);
void __far far_47BC0(int, int, int);
int __far far_47C30(long, int);
void __far far_47C7A(int, char far *);

void __far far_47CB4(int p0, char far *p1, long p3)
{
	far_47C7A(p0, p1);
	draw_char_at(p0 + 0xc, *(int *)&p1, 0x2f);
	far_47BC0(p0 + 0x12, *(int *)&p1, far_47C30(p3, ((int *)&p1)[1]));
}
