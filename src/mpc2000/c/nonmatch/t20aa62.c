/* differs: 150 size 190, image 166; +1 image `enter 0x12, 0` CL `enter 0xe, 0`; 172 size 190, image 166; +1 image `enter 0x12, 0` CL `enter 0xe, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[28];
    char f_1c;
};
extern long __far __pascal _memcpy_1650C(long, long);
extern long __far __pascal lcd_region_helper(int, int, long);

void __far __pascal lcd_region_copy(struct s1 far *arg_4, int arg_2, long arg_0)
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
	int di;
	int si;
	long t1;
	long t2;

	__movs2((char far *)arg_4 + 2, arg_0, 26);
	arg_4->f_1c = *(char far *)MK_FP(arg_2, *(int *)((char *)&arg_0 + 0) + 26);
	__movs2(MK_FP(FP_SEG(arg_4), *(int *)((char *)&arg_4 + 0) + 0x8de), ((long)arg_2 << 16 | (unsigned)(*(int *)((char *)&arg_0 + 0) + 0x75b)), 64);
	loc_c = *(int *)((char *)&arg_0 + 0) + 0x65b;
	loc_a = arg_2;
	loc_10 = *(int *)((char *)&arg_4 + 0) + 0x75e;
	loc_e = FP_SEG(arg_4);
	loc_4 = *(int *)((char *)&arg_0 + 0) + 27;
	loc_2 = arg_2;
	loc_8 = *(int *)((char *)&arg_4 + 0) + 30;
	loc_6 = FP_SEG(arg_4);
	loc_12 = 64;
	si = loc_c;
	di = loc_10;
L1:
	t1 = _memcpy_1650C(*(long *)((char *)&loc_8 + 0), *(long *)((char *)&loc_4 + 0));
	t2 = lcd_region_helper(loc_e, di, ((long)loc_a << 16 | (unsigned)si));
	si = si + 4;
	di = di + 6;
	loc_4 = loc_4 + 25;
	loc_8 = loc_8 + 29;
	loc_12 = loc_12 - 1;
	if (loc_12 != 1) {
		goto L1;
	}
	return;
}
