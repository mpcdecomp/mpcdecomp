/* differs: 150 size 116, image 98; +7 image `mov bx, word ptr [bp + 6]` CL `mov cx, word ptr [bp - 2]`; 172 size 116, image 98; +7 image `mov bx, word ptr [bp + 6]` CL `mov cx, word ptr [bp - 2]` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[1];
    char f_1;
};
extern char far *PTR_TRACK_DATA;
extern long __far __pascal note_clamp_flag(int);
extern long __far __pascal note_clamp_multi(int, int, int);

void __far __pascal note_pitch_calc_3(int arg_0)
{
	int ax;
	int ax2;
	int ax3;
	int si;
	struct s1 far *t1;
	long t2;

	ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)((char far *)*(long *)((char *)&PTR_TRACK_DATA + 0) + arg_0));
	if ((unsigned int)((char)ax - 35) > 63) {
		goto L1;
	}
	t1 = (struct s1 far *)note_clamp_flag((char)ax);
	ax3 = t1->f_1 - 50;
	if (ax3 >= 50) {
		goto L1;
	}
	si = (ax3 / 3 + 1) * 3;
	if (si <= 50) {
		goto L2;
	}
	si = 50;
L2:
	t1->f_1 = (char)((char)si + 50);
	t2 = note_clamp_multi(2, arg_0, (signed char)((char)si + 50));
L1:
	return;
}
