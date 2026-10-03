extern char SMEM_POOL[1];
extern char TBL_09DA[1];

long __near __pascal mpc_status_read(char far *p3, char far *p1, unsigned char p0)
{
	long l4;

	*(long far *)(p3 + 22) = (unsigned long)((long)0x1b9 * *(int *)(TBL_09DA + -(p3[1] - 0x80) * p0 / 0x7f + -(p3[1] - 0x80) * p0 / 0x7f)) / 0xaL + *(long far *)(p1 + 20);
	l4 = (*(long far *)(p1 + 24) - *(long far *)(p3 + 22)) * 10 / 0x1b9L;
	if (p3[4]) goto br_0314C;
	l4 -= 0x1eL;
br_0314C:
	*(long far *)(p3 + 22) += *(long *)(SMEM_POOL + *(int far *)(p1 + 48) * 10);
	return l4;
}
