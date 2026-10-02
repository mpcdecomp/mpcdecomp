/* differs: 308 at +5A, 14 bytes; 311 at +78, 12 bytes; 312 at +78, 12 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1aac(void);
extern int far far_b1ae0(int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1d48(void far *, int, int, int, int, int);
extern int far far_d79ee(void);
extern void far fn_b5183(int, int far *, int far *, int far *, int far *);
void far fn_b5183(int p0, int far *p1, int far *p2, int far *p3, int far *p4) { }

long far fn_b51c5(int arg_0)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int si;
    int t1;
    int t2;

    far_b1af9();
    ax2 = far_b1aac();
    si = arg_0;
    while (arg_0 + 8 > si) {
        fn_b5183(si, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4));
        if (si % 8 != 0) {
            t1 = far_b1ae0(10);
        }
        ax4 = far_b1d48(MK_FP(SEG_DATA, 0x227a), si, loc_6, loc_8, loc_2, loc_4);
        si = si + 1;
    }
    far_d79ee();
    return ((long)UNDEF << 16 | (unsigned)far_b1aff());
}
