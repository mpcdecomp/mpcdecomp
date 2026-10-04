/* differs: XL v1.20 +11, 9 bytes */
extern unsigned char FE_COMMITTED;
extern char far *FE_VALUE;
int __far L_3F3D0(int, int);

void __far far_48484(int p0)
{
	*FE_VALUE = (char)L_3F3D0(p0, FE_COMMITTED);
}
