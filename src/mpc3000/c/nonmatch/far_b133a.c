/* differs: 308 at +3, 343 bytes; 311 at +3, 343 bytes; 312 at +3, 343 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char W_1D1B;
extern int near fn_b142d(void);

long far far_b133a(long arg_0, int arg_4, int arg_6, int arg_8, char arg_10)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    unsigned int bx;
    int bx2;
    int bx3;
    unsigned int bx4;
    int bx5;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int dx;
    int es;
    int si;
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;

    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_1D1B) = 0;
    es = (int)(arg_0 >> 16);
    bx = arg_4;
    si = (int)arg_0 + (bx >> 3);
    dx = *(int far *)MK_FP(es, si);
    cx = arg_8;
    ax = -0x100 << (unsigned char)(char)cx | (unsigned int)-0x100 >> 16 - (unsigned char)(char)cx;
    bx2 = bx & 7;
    bx3 = ((char)(bx2 >> 8) << 8 | (unsigned char)((char)bx2 + (char)cx));
    cx2 = ((char)cx << 8 | (unsigned char)(8 - (char)bx3));
    bx4 = ((char)(bx3 >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_6 + 0));
    if ((char)cx2 >= 0) {
        bx5 = ((char)(bx4 >> 8) << 8 | (unsigned char)((char)bx4 << (char)cx2));
        ax2 = (unsigned char)((char)ax << (char)cx2);
    } else {
        cx3 = ((char)(cx2 >> 8) << 8 | (unsigned char)-(char)cx2);
        bx5 = bx4 >> (unsigned char)(char)cx3 | bx4 << 16 - (unsigned char)(char)cx3;
        ax2 = (unsigned char)(char)ax >> (unsigned char)(char)cx3 | (unsigned char)(char)ax << 16 - (unsigned char)(char)cx3;
    }
    ax3 = ~ax2 & dx | bx5;
    *(int far *)MK_FP(es, si) = ax3;
    if (arg_10 == 0) {
        if ((char)ax3 != (char)dx) {
            t1 = fn_b142d();
            t2 = fn_b142d();
            t3 = fn_b142d();
            cx4 = UNDEF;
            dx = UNDEF;
            if ((char)(cx4 >> 8) != (char)(dx >> 8)) {
                goto L1;
            }
            goto L2;
        }
        if ((char)(ax3 >> 8) != (char)(dx >> 8)) {
            t4 = fn_b142d();
            t5 = fn_b142d();
            cx4 = UNDEF;
L1:
            ax4 = fn_b142d();
            dx = UNDEF;
L2:
            *(int far *)MK_FP(-0x7ff0, (unsigned)&W_1D1B) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_1D1B) + 1;
        }
    }
    return ((long)dx << 16 | (unsigned)*(int far *)MK_FP(-0x7ff0, (unsigned)&W_1D1B));
}
int near fn_b142d(void) { return 0; }
