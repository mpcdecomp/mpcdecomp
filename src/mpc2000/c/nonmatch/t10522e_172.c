/* differs: 172 +11 image `mov bx, ax` CL `mov si, ax` */
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
    char pad_0[104];
    char f_68;
};
extern char G_ASSIGN_VIEW_FIELD;
extern unsigned char G_PAD_NOTE_BASE;
extern struct g_TBL_ASSIGN_VIEW_FIELD_FIX TBL_ASSIGN_VIEW_FIELD_FIX;
extern long __near assign_view_arm_field(void);
extern long __near __pascal track_calc_offset(int);

void __far __fastcall __loadds assign_view_key_down(void)
{
	struct s1 far *t1;
	long t2;

	t1 = (struct s1 far *)track_calc_offset(G_PAD_NOTE_BASE);
	G_ASSIGN_VIEW_FIELD = *(char *)((char *)&TBL_ASSIGN_VIEW_FIELD_FIX + 104 + t1->f_5 * 13 + G_ASSIGN_VIEW_FIELD);
	t2 = assign_view_arm_field();
	return;
}
