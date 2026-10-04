/* differs: 150 size 174, image 150; +1 image `enter 0xe, 0` CL `enter 0x16, 0`; 172 size 174, image 150; +1 image `enter 0xe, 0` CL `enter 0x16, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int __far int2F_call_fn6(long, int);
extern void __far __pascal range_proc_setup(int);

long __far __pascal range_io_handler(int arg_6, int arg_4, int arg_2, unsigned int arg_0)
{
	int loc_e;
	int loc_c;
	int loc_a;
	int loc_8;
	char loc_6[4];
	int loc_2;
	int ax;
	int di;
	int di2;
	int si;
	int t1;
	int t2;

	di = arg_2;
	if (di <= 64) {
		goto L1;
	}
	di = 64;
L1:
	loc_e = arg_2 - di;
	ax = arg_0 - 25 & (int)((unsigned long)(unsigned int)arg_0 - 25L >> 16);
	loc_8 = ax + 25;
	loc_a = arg_0 - (ax + 25);
	*(int *)((char *)&loc_6 + 0) = 0;
	if (di <= 0) {
		goto L2;
	}
	loc_c = di;
	loc_2 = arg_6;
	si = *(int *)((char *)&loc_6 + 0);
	di2 = arg_4 + 4;
L3:
	if (int2F_call_fn6(((long)loc_2 << 16 | (unsigned)di2), loc_8) != loc_8) {
		goto L4;
	}
	range_proc_setup(loc_a);
	di2 = di2 + 29;
	si = si + 1;
	if (loc_c > si) {
		goto L3;
	}
	goto L2;
L4:
	return ((long)UNDEF << 16 | (unsigned)0);
L2:
	range_proc_setup(loc_e * arg_0);
	return ((long)UNDEF << 16 | (unsigned)1);
}
