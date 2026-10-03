/* differs: 150 size 98, image 96; +1A image `jmp +4B` CL `jmp +4D`; 172 size 98, image 96; +1A image `jmp +4B` CL `jmp +4D` */
extern long W_1556;
extern int W_1558;
void __far __pascal cmd_dispatch_1E(int, int, char far *);

void __far __pascal cmd_exec_1E(int p2, int p1, int p0)
{
	char l4[4];
	int si_;

	if (!p0) {
		*(long *)l4 = W_1556;
	} else {
		l4[0] = p0 >= 0 ? 0x52 : 0x4c;
		si_ = (p0 ^ (int)((unsigned long)(long)p0 >> 16)) - (int)((unsigned long)(long)p0 >> 16);
		l4[1] = (char)(si_ / 0xa) + 0x30;
		l4[2] = (char)(si_ % 0xa) + 0x30;
		l4[3] = 0;
	}
	cmd_dispatch_1E(p2, p1, l4);
}
