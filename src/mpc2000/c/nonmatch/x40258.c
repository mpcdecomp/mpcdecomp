/* differs: XL v1.20 +5, 51 bytes */

int __far sound_cmp_size(char far *p0, char far *p2)
{
	if (*(long far *)(p0 + 14) - *(long far *)(p2 + 14) <= 0L) goto br_4028A;
	return 1;
br_4028A:
	if (*(long far *)(p0 + 14) - *(long far *)(p2 + 14) >= 0L) goto br_40294;
	return -1;
br_40294:
	return 0;
}
