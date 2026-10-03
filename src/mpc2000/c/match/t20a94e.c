
void __far __pascal lcd_region_helper(char far *p2, char far *p0)
{
	*(long far *)p2 = *(long far *)p0;
	p2[4] = 0x64;
	p2[5] = 0;
}
