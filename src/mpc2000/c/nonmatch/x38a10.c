/* differs: XL v1.20 +4, 33 bytes */
void __near note_stop(int, long);

void __near note_stop_all(char p0, char p1)
{
	char l3;
	long l4;
	char l5;
	int l6;

	*(char *)&l6 = p1;
	l3 = p0;
	*(char *)&l4 = 0x40;
	l5 = 0x23;
loop_38A28:
	note_stop(l6, l4);
	l5++;
	if (l5 <= 0x62) goto loop_38A28;
}
