/* differs: 150 size 110, image 76; +0 image `push si` CL `enter 8, 0`; 172 size 110, image 76; +0 image `push si` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[5];
    char f_5;
};
struct g_TBL_ASSIGN_VIEW_FIELD_FIX {
    char f_0;
};
extern char G_ASSIGN_VIEW_FIELD;
extern unsigned char G_PAD_NOTE_BASE;
extern int TBL_ASSIGN_VIEW_ARM[1];
extern struct g_TBL_ASSIGN_VIEW_FIELD_FIX TBL_ASSIGN_VIEW_FIELD_FIX;
extern long __near __pascal track_calc_offset(int);

long __near assign_view_arm_field(void)
{
	int ax;
	struct s1 far *t1;

	if (G_ASSIGN_VIEW_FIELD <= 12) {
		goto L1;
	}
	G_ASSIGN_VIEW_FIELD = (char)0;
L1:
	t1 = (struct s1 far *)track_calc_offset(G_PAD_NOTE_BASE);
	ax = ((char)-(G_ASSIGN_VIEW_FIELD < 0) << 8 | (unsigned char)*(char *)((char *)&TBL_ASSIGN_VIEW_FIELD_FIX + 0 + t1->f_5 * 13 + G_ASSIGN_VIEW_FIELD));
	G_ASSIGN_VIEW_FIELD = (char)ax;
	return (*(long (*)())TBL_ASSIGN_VIEW_ARM[(char)ax])();
}
