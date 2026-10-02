/* differs: 308 at +0, 234 bytes; 311 at +0, 234 bytes; 312 at +0, 234 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[8];
    int f_8;
    int f_a;
};
extern long near fn_fb739(void);

int far far_fb672(void)
{
    int ax;
    int ax2;
    unsigned int bp;
    int flags;
    int flags2;
    int q0;
    int q2;
    int si;
    char near *si2;
    struct s1 near *si3;
    long t1;

    t1 = fn_fb739();
    ax = (int)t1;
    if ((unsigned int)(int)(t1 >> 16) < bp) {
        *(int *)(0x2 + UNDEF) = (int)(t1 >> 16) + 1;
        if ((unsigned int)((int)(t1 >> 16) + 1) >= bp) {
            ax = ((char)(ax >> 8) + 1 << 8 | (unsigned char)(char)ax);
        }
        si = *(int *)(0x4 + UNDEF);
        flags = si;
        if (!CC("!=", flags)) {
            si = bp;
        }
        si2 = (char near *)(si - 1);
        *(int *)(0x4 + UNDEF) = (int)(unsigned)si2;
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax - 1));
        flags2 = (char)ax2;
        if (!CC("==", flags2)) {
            if (!CC("s", flags2)) {
                si3 = (struct s1 near *)((unsigned int)(unsigned)si2 * 4);
                *(int *)((char near *)si3 + 10 + UNDEF) = q0;
                *(int *)((char near *)si3 + 8 + UNDEF) = UNDEF;
            } else {
                si2[UNDEF + 8] = (char)UNDEF;
                goto L1;
            }
        } else {
            *(int *)(0x8 + (unsigned int)(unsigned)si2 * 2 + UNDEF) = UNDEF;
            goto L1;
        }
    } else {
        ax2 = ((char)(ax >> 8) - 1 << 8 | (unsigned char)(char)ax);
L1:
    }
    __insn("popf", q2);
    return (char)(ax2 >> 8);
}
long near fn_fb739(void) { return 0; }
