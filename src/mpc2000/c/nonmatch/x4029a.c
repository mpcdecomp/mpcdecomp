/* differs: XL v1.20 +5, 50 bytes */

int __far far_4029A(char far *p0, char far *p2)
{
	if (*(long far *)(p0 + 10) - *(long far *)(p2 + 10) <= 0L) goto br_402CC;
	return 1;
br_402CC:
	if (*(long far *)(p0 + 10) - *(long far *)(p2 + 10) >= 0L) goto br_402D6;
	return -1;
br_402D6:
	return 0;
}
