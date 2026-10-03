/* differs: XL v1.20 +7, 6 bytes */
void __far cmd_dispatch_setup(int, int, int);

void __far L_3ECCC(int p0, int p1, int p2, int p3)
{
	cmd_dispatch_setup(p0, p1, p3);
	cmd_dispatch_setup(p0 + 0x18, p1, p2);
}
