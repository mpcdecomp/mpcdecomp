/* differs: 308 at +7, 124 bytes; 311 at +7, 122 bytes; 312 at +7, 124 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_STACK _SS
struct g_W_8C35 {
    long f_0;
    char pad_4[332];
    char f_150;
};
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern long far far_e259f(char);

void far far_e392e(char arg_0)
{
    char loc_68[100];
    char far *loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int cx;
    unsigned int dx;
    unsigned int dx2;
    int es;
    int si;

    if ((int)far_e259f(arg_0) == 0) {
        __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_68), 0, 100);
        dx = *(int *)((char *)&W_8C35 + 0);
        dx2 = dx + 0x151;
        loc_2 = W_8C37 + (dx2 < dx);
        *(int *)((char *)&loc_4 + 0) = dx2;
        cx = *(char far *)((char far *)W_8C35.f_0 + 336);
        for (;;) {
            ax2 = cx;
            cx = cx - 1;
            if (ax2 == 0) {
                break;
            }
            bx = FP_OFF(loc_4);
            es = FP_SEG(loc_4);
            if ((unsigned char)*(char far *)MK_FP(es, bx) > 99 || *(char far *)MK_FP(es, bx) == 0) {
                goto L1;
            }
            dx2 = (unsigned int)(unsigned)loc_68;
            ax3 = (unsigned char)*(char far *)MK_FP(es, bx) + dx2;
            si = ax3;
            if (*(char far *)MK_FP(SEG_STACK, ax3) == 0) {
                *(char far *)MK_FP(SEG_STACK, si) = (char)1;
            } else {
L1:
                *loc_4 = (char)-1;
            }
            *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 24;
        }
    }
    return;
}
