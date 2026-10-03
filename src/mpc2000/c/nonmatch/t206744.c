/* differs: 150 size 128, image 104; +1 image `enter 6, 0` CL `enter 8, 0`; 172 size 128, image 104; +1 image `enter 6, 0` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[2];
    char f_2;
};
extern char far *PTR_TRACK_DATA;
extern long __far __pascal note_clamp_multi(int, int, int);
extern long __far __pascal note_range_clamp(int);

void __far __pascal note_range_calc_2(int arg_0)
{
	int loc_2;
	int ax;
	int ax2;
	struct s1 far *t1;
	long t2;

	ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)((char far *)*(long *)((char *)&PTR_TRACK_DATA + 0) + arg_0));
	if ((unsigned int)((char)ax - 35) > 63) {
		goto L1;
	}
	t1 = (struct s1 far *)note_range_clamp((char)ax);
	loc_2 = (t1->f_2 + 2) / 3;
	if (loc_2 <= 0) {
		goto L1;
	}
	loc_2 = loc_2 - 1;
	if (loc_2 == 1) {
		goto L2;
	}
	loc_2 = loc_2 * 3 - 2;
L2:
	t1->f_2 = *(char *)((char *)&loc_2 + 0);
	t2 = note_clamp_multi(5, arg_0, *(char *)((char *)&loc_2 + 0));
L1:
	return;
}
