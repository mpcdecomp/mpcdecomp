/* differs: 150 size 58, image 50; +0 image `push si` CL `enter 0xc, 0`; 172 size 58, image 50; +0 image `push si` CL `enter 0xc, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[6];
    char f_6;
};
extern unsigned char G_PAD_NOTE_BASE;
extern long __far __pascal status_read_6A_3(int, int, char, int, int, int, int, int, int, int, int);
extern long __near __pascal track_calc_offset(int);

void __near X_05140(void)
{
	struct s1 far *t1;
	long t2;

	t1 = (struct s1 far *)track_calc_offset(G_PAD_NOTE_BASE);
	t2 = status_read_6A_3(FP_SEG(t1), FP_OFF(t1) + 8, (char)(t1->f_6 + 1), 100, 3, 146, 39, 0, 0, 0, 0);
	return;
}
