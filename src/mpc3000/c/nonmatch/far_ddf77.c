/* differs: 308 at +1, 117 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern char B_8A9E;
extern char TBL_A57E[];
extern int far far_d9748(void);
extern int far far_db00c(void);
extern int far far_dce14(void far *, int, int);

long far far_ddf77(void)
{
    int ax;
    int ax2;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int p14;
    int p8;
    int si;
    int t1;

    bx = UNDEF;
    cx = UNDEF;
    es = UNDEF;
    ax = far_db00c();
    dx = UNDEF;
    di = 0;
    do {
        ax2 = (di << 2) + 0x6a92;
        p14 = ax2;
        si = 0;
        do {
            if (TBL_A57E[si] != 0) {
                p8 = (-1 << 8 | (unsigned char)(char)si);
                t1 = far_dce14(MK_FP(SEG_DATA, p14), 4, p8);
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                ax2 = t1;
                dx = UNDEF;
            }
            si = si + 1;
        } while (si < 64);
        di = di + 1;
    } while (di < 3);
    __stos1((char far *)TBL_A57E, 0, 64);
    B_8A9E = (char)0;
    return ((long)UNDEF << 16 | (unsigned)far_d9748());
}
