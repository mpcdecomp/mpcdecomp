/* differs: 308 at +0, 117 bytes; 311 at +0, 117 bytes; 312 at +0, 117 bytes */
#define UNDEF 0
struct g_TBL_9CFD {
    int f_0;
};
extern struct g_TBL_9CFD TBL_9CFD;
extern int W_9D61;
extern int W_9D63;
extern int W_9D65;
extern void near fn_de3b8(void);

void far far_de362(void)
{
    int ax;
    unsigned int ax2;
    int bx;
    int cx;
    int dx;
    int es;
    unsigned int si;
    int t1;

    if (W_9D63 <= 0) {
        return;
    }
    W_9D63 = W_9D63 - 1;
    if (W_9D63 != 1) {
        return;
    }
    dx = W_9D65;
    cx = W_9D61;
    si = -1;
    bx = -2;
    do {
        bx = bx + 2;
        ax = *(int *)((char *)&TBL_9CFD + 0 + bx);
        if (ax != 0) {
            ax2 = ax - dx;
            if (ax > dx) {
                *(int *)((char *)&TBL_9CFD + 0 + bx) = ax2;
                if (ax2 < si) {
                    si = ax2;
                }
            } else {
                *(int *)((char *)&TBL_9CFD + 0 + bx) = 0;
                fn_de3b8();
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                dx = UNDEF;
            }
        }
        cx = cx - 1;
    } while (cx != 0);
    if (si == -1) {
        si = 0;
    }
    W_9D63 = si;
    W_9D65 = si;
    return;
}
void near fn_de3b8(void) { }
