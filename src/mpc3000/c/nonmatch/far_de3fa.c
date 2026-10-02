/* differs: 308 at +0, 62 bytes; 311 at +0, 62 bytes; 312 at +0, 62 bytes */
#define UNDEF 0
struct g_TBL_9CFD {
    int f_0;
};
extern struct g_TBL_9CFD TBL_9CFD;
extern int W_9D61;
extern int W_9D65;
extern int far far_de341(void);
extern void near fn_de3b8(void);
int far far_de341(void) { return 0; }
void near fn_de3b8(void) { }

long far far_de3fa(void)
{
    int ax;
    int bx;
    int cx;
    int dx;
    int es;
    int t1;

    if (W_9D65 != 0) {
        cx = W_9D61;
        bx = 0;
        do {
            if (*(int *)((char *)&TBL_9CFD + 0 + bx) != 0) {
                fn_de3b8();
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                ax = UNDEF;
                dx = UNDEF;
            }
            bx = bx + 2;
            cx = cx - 1;
        } while (cx != 0);
        ax = far_de341();
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
