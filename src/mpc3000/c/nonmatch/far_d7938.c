/* differs: 308 absent; 311 at +3, 112 bytes; 312 at +3, 112 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_717A;
extern char B_D4C0;
extern long far far_cc641(void far *);
extern int far far_dac6a(void);

int far far_d7938(long arg_0)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
    ax3 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax & -8));
    if ((char)ax3 == -112) {
        ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 2));
        if (B_717A != 0) {
            ax4 = (int)far_cc641(MK_FP(es, bx));
        }
        B_D4C0 = (char)ax4;
        ax3 = far_dac6a();
    }
    return ax3;
}
