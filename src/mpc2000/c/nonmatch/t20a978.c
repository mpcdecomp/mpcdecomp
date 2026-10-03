/* differs: 150 size 274, image 234; +1 image `enter 0x12, 0` CL `enter 0x14, 0`; 172 size 274, image 234; +1 image `enter 0x12, 0` CL `enter 0x14, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern long __far __pascal lcd_line_copy(long, long);
extern long __far __pascal lcd_region_helper(int, int, long);

void __far __pascal lcd_buffer_copy(int arg_6, int arg_4, int arg_2, long arg_0)
{
	int loc_12;
	int loc_10;
	int loc_e;
	int loc_c;
	int loc_a;
	int loc_8;
	int loc_6;
	int loc_4;
	int loc_2;
	int cx;
	unsigned int cx2;
	int cx3;
	int di;
	int di2;
	int si;
	long t1;
	long t2;

	__movs2(MK_FP(arg_6, arg_4 + 2), arg_0, 26);
	cx = ~__repne_scas1(MK_FP(arg_6, arg_4 + 2), 0, -1);
	loc_2 = cx - 1;
	if (cx - 1 >= 16) {
		goto L1;
	}
	cx2 = 16 - (cx - 1);
	di = arg_4 + 2 + (cx - 1);
	cx3 = cx2 >> 1;
	__stos2(MK_FP(arg_6, di), 0x2020, cx3 * 2);
	if (!(cx2 & 1)) {
		goto L1;
	}
	*(char far *)MK_FP(arg_6, di + cx3 * 2) = (char)32;
L1:
	*(char far *)MK_FP(arg_6, arg_4 + 18) = (char)0;
	__movs2(MK_FP(arg_6, arg_4 + 0x8de), ((long)arg_2 << 16 | (unsigned)(*(int *)((char *)&arg_0 + 0) + 0x73e)), 64);
	loc_c = *(int *)((char *)&arg_0 + 0) + 0x63e;
	loc_a = arg_2;
	loc_10 = arg_4 + 0x75e;
	loc_e = arg_6;
	loc_4 = *(int *)((char *)&arg_0 + 0) + 62;
	loc_2 = arg_2;
	loc_8 = arg_4 + 30;
	loc_6 = arg_6;
	loc_12 = 64;
	si = loc_c;
	di2 = loc_10;
L2:
	t1 = lcd_line_copy(*(long *)((char *)&loc_8 + 0), *(long *)((char *)&loc_4 + 0));
	t2 = lcd_region_helper(loc_e, di2, ((long)loc_a << 16 | (unsigned)si));
	si = si + 4;
	di2 = di2 + 6;
	loc_4 = loc_4 + 24;
	loc_8 = loc_8 + 29;
	loc_12 = loc_12 - 1;
	if (loc_12 != 1) {
		goto L2;
	}
	return;
}
