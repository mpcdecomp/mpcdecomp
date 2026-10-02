/* differs: 308 at +F, 48 bytes; 311 at +F, 48 bytes; 312 at +F, 48 bytes */
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

void far far_e5a2b(void)
{
    int ax;
    int si;

    B_F75C = (char)(B_901C & 1);
    W_F759 = W_904D;
    ax = W_8A98;
    W_F757 = ax;
    si = 0;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)TBL_8A93[si]);
        TBL_F752[si] = (char)ax;
        si = si + 1;
    } while (si < 5);
    B_F75B = B_8A9A;
    return;
}
