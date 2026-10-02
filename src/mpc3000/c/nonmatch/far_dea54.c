/* differs: 308 at +3, 224 bytes; 311 at +3, 224 bytes; 312 at +3, 224 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_955E;

int far far_dea54(long arg_0, char arg_4)
{
    int ax;
    int ax2;
    int ax3;
    int bx;
    int es;
    int flags;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
    ax3 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax & -8));
    if ((char)ax3 == -104 || (char)ax3 == -112 || ((char)ax3 == -128 || (char)ax3 == -96)) {
        ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)arg_4);
        if ((char)ax3 == 0 || (char)ax3 == *(char far *)MK_FP(es, bx + 1)) {
            ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)B_955E);
            *(char far *)MK_FP(es, bx + 2) = (char)(*(char far *)MK_FP(es, bx + 2) + (char)ax3);
            if ((char)(*(char far *)MK_FP(es, bx + 2) + (char)ax3) < 0) {
                flags = (char)ax3;
                ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)0);
                if (!CC("s", flags)) {
                    ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)127);
                }
                *(char far *)MK_FP(es, bx + 2) = (char)ax3;
            }
        }
    }
    return ax3;
}
