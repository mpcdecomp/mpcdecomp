/* differs: 150 size 156, image 130; +1 image `enter 8, 0` CL `enter 0x10, 0`; 172 size 156, image 140; +1 image `enter 8, 0` CL `enter 0x10, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PGM_SLOT {
    int f_0;
    int f_2;
    int f_4;
    char f_6;
};
struct g_B_9D77 {
    char pad_0[18];
    char f_12;
};
extern struct g_B_9D77 B_9D77;
extern struct g_PGM_SLOT PGM_SLOT;
extern void __far __pascal lcd_region_helper(void far *, long);

void __far __pascal lcd_cmd_wrapper(int arg_2, int arg_0)
{
	int loc_8;
	char loc_6[4];
	int loc_2;
	int di;
	int si;
	int t1;

	PGM_SLOT.f_0 = *(int far *)MK_FP(arg_2, arg_0 + 22);
	PGM_SLOT.f_2 = *(int far *)MK_FP(arg_2, arg_0 + 24);
	PGM_SLOT.f_4 = *(int far *)MK_FP(arg_2, arg_0 + 26);
	PGM_SLOT.f_6 = *(char far *)MK_FP(arg_2, arg_0 + 28);
	__movs2((struct g_B_9D77 far *)&B_9D77, ((long)arg_2 << 16 | (unsigned)(arg_0 + 0x15d)), 18);
	B_9D77.f_12 = *(char far *)MK_FP(arg_2, arg_0 + 0x16f);
	loc_2 = arg_2;
	*(int *)((char *)&loc_6 + 0) = -0x64a4;
	loc_8 = 64;
	si = arg_0 + 29;
	di = *(int *)((char *)&loc_6 + 0);
L1:
	lcd_region_helper(MK_FP(SEG_DATA, di), ((long)loc_2 << 16 | (unsigned)si));
	si = si + 4;
	di = di + 6;
	loc_8 = loc_8 - 1;
	if (loc_8 != 1) {
		goto L1;
	}
	__movs2(MK_FP(SEG_DATA, -0x72c8), ((long)arg_2 << 16 | (unsigned)(arg_0 + 0x11d)), 64);
	return;
}
