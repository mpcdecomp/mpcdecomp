/* differs: 150 +19 image `mov ax, word ptr es:[bx + 0x1e]` CL `mov ax, word ptr es:[bx + 0x1c]`; 172 +19 image `mov ax, word ptr es:[bx + 0x1e]` CL `mov ax, word ptr es:[bx + 0x1c]` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char far *SND_CURRENT;
extern void __far __pascal cmd_build_params(int, int, int, int, int);
extern long __far __pascal cmd_exec_0E_wrapper(int);

int __far __pascal cmd_exec_caller(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int ax;
	int ax2;
	int di;
	int p10;
	int p102;
	int p12;
	int p122;
	int si;
	long t1;
	long t2;
	long t3;
	long t4;
	int t5;
	int t6;

	ax = *(int *)((char *)&SND_CURRENT + 2) | *(int *)((char *)&SND_CURRENT + 0);
	if (ax != 0) {
		goto L1;
	}
	goto L2;
L1:
	ax = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 30) | *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 28);
	if (ax != 0) {
		goto L3;
	}
	goto L2;
L3:
	p10 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 30);
	p12 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 28);
	t1 = *(long *)((char *)&arg_4 + 0) * 245L;
	t2 = t1 / ((long)p10 << 16 | (unsigned)p12);
	di = (int)t2;
	p102 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 30);
	p122 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 28);
	t3 = *(long *)((char *)&arg_0 + 0) * 245L;
	ax2 = (int)(t3 / ((long)p102 << 16 | (unsigned)p122)) - (int)t2;
	si = ax2;
	if (ax2 != 0) {
		goto L4;
	}
	si = 1;
L4:
	t4 = cmd_exec_0E_wrapper(2);
	cmd_build_params(19, 1, 21, 245, 27);
	cmd_build_params(18, di + 1, 21, si, 27);
	ax = (int)cmd_exec_0E_wrapper(0);
L2:
	return ax;
}
