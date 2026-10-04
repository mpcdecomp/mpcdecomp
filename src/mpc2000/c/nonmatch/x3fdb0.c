/* differs: XL v1.20 +1E, 26 bytes */
void __far far_3FD1E(char far *);

int __far far_3FDB0(char far *p0)
{
	far_3FD1E(p0);
	p0[17] = 0x64;
	p0[18] = 0;
	p0[19] = 0;
	*(long far *)(p0 + 20) = 0L;
	*(long far *)(p0 + 24) = 0L;
	*(long far *)(p0 + 28) = 0L;
	*(long far *)(p0 + 32) = 0L;
	p0[36] = 0;
	p0[37] = 4;
	*(int far *)(p0 + 38) = -0x53bc;
	return 0;
}
