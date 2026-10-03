/* differs: 150 size 370, image 228; +1 image `enter 0xa, 0` CL `enter 0x14, 0`; 172 size 370, image 258; +1 image `enter 0xa, 0` CL `enter 0x14, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int SMEM_SIZE;
extern int SMEM_SIZE_HI;
extern long __far __pascal flash_write_words(int, int, int, int, int);
extern void __far __pascal smem_read_words(int, int, int, int, int);

long __far __pascal system_init_handler(int arg_2, int arg_0)
{
	unsigned int loc_8;
	char loc_7;
	char loc_6[4];
	int loc_2;
	unsigned int ax;
	unsigned int bx;
	int bx2;
	int di;
	int dx;
	int dx2;
	int flags;
	int flags2;
	unsigned int si;
	long t1;
	long t2;
	int t3;

	loc_2 = 0x7000;
	loc_8 = 0;
	*(int *)((char *)&loc_6 + 0) = 1;
	flags = SMEM_SIZE_HI - 1;
	if (CC(">=", flags)) {
		goto L1;
	}
	goto L2;
L1:
	if (CC(">", flags)) {
		goto L3;
	}
	if (SMEM_SIZE != 0) {
		goto L3;
	}
	goto L2;
L3:
	bx = 0;
	di = 0;
L4:
	*(int far *)MK_FP(0x7000, di) = bx + loc_8 ^ *(int *)((char *)&loc_6 + 0) + (bx + loc_8 < bx) ^ arg_2;
	di = di + 2;
	bx = bx + 1;
	if (bx < 0x4000) {
		goto L4;
	}
	t2 = flash_write_words(*(int *)((char *)&loc_6 + 0), loc_8, 0x7000, 0, 0x4000);
	__stos2(0x70000000L, 0, -0x8000);
	smem_read_words(*(int *)((char *)&loc_6 + 0), loc_8, 0x7000, 0, 0x4000);
	si = 0;
	loc_2 = 0x7000;
	bx2 = si;
L5:
	dx = *(int *)((char *)&loc_6 + 0) + (si + loc_8 < si);
	if ((si + loc_8 ^ dx ^ arg_2) != *(int far *)MK_FP(loc_2, bx2)) {
		goto L6;
	}
	bx2 = bx2 + 2;
	si = si + 1;
	if (si < 0x4000) {
		goto L5;
	}
	if (arg_0 == 0) {
		goto L7;
	}
	t1 = (*(long (*)())arg_0)(*(long *)((char *)&loc_8 + 0));
L7:
	ax = SMEM_SIZE;
	dx2 = SMEM_SIZE_HI;
	loc_7 = (char)(loc_7 + 64);
	*(int *)((char *)&loc_6 + 0) = (int)(((long)*(int *)((char *)&loc_6 + 0) << 16 | (unsigned)loc_7) + 64L >> 16);
	flags2 = *(int *)((char *)&loc_6 + 0) - dx2;
	if (CC(">=", flags2)) {
		goto L8;
	}
	goto L3;
L8:
	if (CC(">", flags2)) {
		goto L2;
	}
	if (loc_8 >= ax) {
		goto L9;
	}
	goto L3;
L9:
	goto L2;
L6:
	return ((long)dx << 16 | (unsigned)0);
L2:
	return ((long)dx2 << 16 | (unsigned)1);
}
