/* differs: 150 size 256, image 206; +1 image `enter 0xc, 0` CL `enter 0x16, 0`; 172 size 256, image 206; +1 image `enter 0xc, 0` CL `enter 0x16, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[23];
    char f_17;
    char f_18;
    char f_19;
    char f_1a;
    char f_1b;
    char f_1c;
};
extern long __far __pascal lcd_region_helper(void far *, long);

void __far __pascal lcd_line_clear(int arg_6, int arg_4, int arg_2, int arg_0)
{
	struct s1 far *loc_c;
	char loc_a[4];
	int loc_6;
	int loc_4;
	int loc_2;
	int ax;
	int ax2;
	int ax3;
	int di;
	int si;
	long t1;

	*(char far *)MK_FP(arg_6, arg_4 + 22) = *(char far *)MK_FP(arg_2, arg_0 + 22);
	*(int *)((char *)&loc_c + 0) = arg_4;
	*(int *)((char *)&loc_a + 0) = arg_6;
	if (*(char far *)MK_FP(arg_2, arg_0 + 23) != 2) {
		goto L1;
	}
	ax = ((char)(arg_6 >> 8) << 8 | (unsigned char)1);
	goto L2;
L1:
	ax = ((char)(arg_6 >> 8) << 8 | (unsigned char)0);
L2:
	loc_c->f_17 = (char)ax;
	if (*(char far *)MK_FP(arg_2, arg_0 + 24) != 2) {
		goto L3;
	}
	ax2 = ((char)(ax >> 8) << 8 | (unsigned char)1);
	goto L4;
L3:
	ax2 = ((char)(ax >> 8) << 8 | (unsigned char)0);
L4:
	loc_c->f_18 = (char)ax2;
	if (*(char far *)MK_FP(arg_2, arg_0 + 25) != 2) {
		goto L5;
	}
	ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)1);
	goto L6;
L5:
	ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)0);
L6:
	loc_c->f_19 = (char)ax3;
	loc_c->f_1a = *(char far *)MK_FP(arg_2, arg_0 + 26);
	loc_c->f_1b = *(char far *)MK_FP(arg_2, arg_0 + 27);
	loc_c->f_1c = *(char far *)MK_FP(arg_2, arg_0 + 28);
	si = arg_0 + 65;
	loc_6 = arg_2;
	loc_2 = -0x64a4;
	loc_4 = 64;
	di = loc_2;
L7:
	t1 = lcd_region_helper(MK_FP(SEG_DATA, di), ((long)loc_6 << 16 | (unsigned)si));
	si = si + 4;
	di = di + 6;
	loc_4 = loc_4 - 1;
	if (loc_4 != 1) {
		goto L7;
	}
	return;
}
