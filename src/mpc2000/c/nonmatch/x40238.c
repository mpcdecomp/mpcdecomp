/* differs: XL v1.20 +E, 22 bytes */
int __far __fstricmp(char far *, unsigned);

void __far sound_cmp_name(char far *p0, char far *p2)
{
	__fstricmp(p0 + 0x12, FP_OFF(p2 + 0x12));
}
