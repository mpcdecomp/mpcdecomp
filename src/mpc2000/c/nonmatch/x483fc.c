/* differs: XL v1.20 +1, 55 bytes */
extern char far *C2_W_FE_DESC_OFF;

int __far __fastcall __loadds far_483FC(int a0, int a1)
{
	char far *l4;
	int l6;

	l6 = a1;
	l4 = *(long far *)(C2_W_FE_DESC_OFF + 34);
	if (l4) {
		return ((int (__far *)(int, int))l4)(a0, l6);
	}
	return 1;
}
