/* differs: 308 at +1, 84 bytes; 311 at +1, 84 bytes; 312 at +1, 84 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9A;
extern char B_901C;
extern char B_F75B;
extern char B_F75C;
extern char TBL_8A93[];
extern char TBL_F752[];
extern int W_8A98;
extern int W_904D;
extern int W_F757;
extern int W_F759;
extern long far far_eb6bd(char far *, void far *);

void far far_e5a58(void)
{
    int ax;
    int si;
    long t1;

    B_901C = (char)(B_901C & -2);
    B_901C = (char)(B_901C | B_F75C);
    W_904D = W_F759;
    ax = W_F757;
    W_8A98 = ax;
    si = 0;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)TBL_F752[si]);
        TBL_8A93[si] = (char)ax;
        si = si + 1;
    } while (si < 5);
    t1 = far_eb6bd((char far *)TBL_8A93, MK_FP(SEG_DATA, 0x7e5f));
    B_8A9A = B_F75B;
    return;
}
