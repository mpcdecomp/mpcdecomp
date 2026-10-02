/* differs: 308 at +5, 162 bytes; 311 at +5, 162 bytes; 312 at +5, 162 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_W_901D {
    long f_0;
};
extern char B_8A9A;
extern char B_8A9C;
extern char TBL_90C1[];
extern struct g_W_901D W_901D;
extern int W_901F;

long far fn_c0446(void)
{
    int loc_2;
    long loc_4;
    int ax;
    int ax2;
    int bx;
    int dx;
    int dx2;
    int es;
    int es2;

    ax = *(int *)((char *)&W_901D + 0) | W_901F;
    if (ax != 0) {
        bx = (int)W_901D.f_0;
        es = (int)(W_901D.f_0 >> 16);
        *(char far *)MK_FP(es, bx + 0x14e) = B_8A9A;
        dx = *(int *)((char *)&W_901D + 0);
        loc_2 = (int)(((long)W_901F << 16 | (unsigned)dx) + 0x151L >> 16);
        *(int *)((char *)&loc_4 + 0) = dx + 0x151;
        dx2 = *(char far *)MK_FP(es, bx + 0x150);
        for (;;) {
            ax = dx2;
            dx2 = dx2 - 1;
            if (ax == 0) {
                break;
            }
            es2 = (int)(loc_4 >> 16);
            if (*(char far *)MK_FP(es2, (int)loc_4) == B_8A9C) {
                goto L1;
            }
            *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 24;
        }
L2:
        return ((long)dx2 << 16 | (unsigned)ax);
    }
    goto L2;
L1:
    ax2 = ((char)-(B_8A9C < 0) << 8 | (unsigned char)TBL_90C1[B_8A9C]);
    *(char far *)MK_FP(es2, *(int *)((char *)&loc_4 + 0) + 2) = (char)ax2;
    return ((long)dx2 << 16 | (unsigned)ax2);
}
