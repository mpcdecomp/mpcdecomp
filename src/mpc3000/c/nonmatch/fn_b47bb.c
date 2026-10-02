/* differs: 308 at +3, 161 bytes; 311 at +3, 163 bytes; 312 at +3, 163 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[508];
    int f_1fc;
    int f_1fe;
};
extern char B_7FCA;
extern int far far_b1ad0();
extern int far far_b1ae0();
extern int far far_b1b05();
extern int far far_b1d48();
extern int far far_b1f96();
extern long far far_e49dd();
extern void far far_eac51();

long far fn_b47bb(int arg_0, int arg_2)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    struct s1 near *ax6;
    int si;
    int t1;
    int t2;

    si = 0;
    far_b1ad0(5, 0);
    ax2 = far_b1b05(MK_FP(SEG_DATA, 0x1f43));
    if (arg_2 != 0) {
        si = (int)far_e49dd(arg_0);
    }
    far_b1d48(MK_FP(SEG_DATA, 0x1f49), si);
    if (si == 0) {
        return ((long)UNDEF << 16 | (unsigned)far_b1f96(40));
    }
    far_b1f96(25);
    far_b1b05(MK_FP(SEG_DATA, 0x1f4d));
    far_eac51();
    t2 = far_b1ae0(32);
    ax6 = (struct s1 near *)(B_7FCA << 2);
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(*(long *)((char near *)ax6 + 508)));
}
