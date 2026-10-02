/* differs: 308 at +5, 159 bytes; 311 at +5, 157 bytes; 312 at +5, 157 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_e05c0(int, int, int, int);
long far far_e05c0(int p0, int p1, int p2, int p3) { return 0; }

void far far_e08cd(long arg_0, char arg_4)
{
    int loc_2;
    int loc_4;
    int loc_6;
    long loc_8;
    int ax;
    unsigned int ax2;
    unsigned int ax3;
    int bx;
    int bx2;
    int cx;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    int p12;
    int p14;
    int p16;
    int p18;
    int p20;
    long t1;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    dx = *(int far *)MK_FP(es, bx + 4);
    loc_2 = *(int far *)MK_FP(es, bx + 6);
    loc_4 = dx;
    dx2 = *(int far *)MK_FP(es, bx);
    loc_6 = *(int far *)MK_FP(es, bx + 2);
    *(int *)((char *)&loc_8 + 0) = dx2;
    for (;;) {
        ax = loc_4;
        dx3 = loc_2;
        loc_4 = loc_4 - 1;
        loc_2 = loc_2 - (loc_4 == 0);
        if ((ax | dx3) == 0) {
            break;
        }
        bx2 = (int)loc_8;
        *(char far *)MK_FP((int)(loc_8 >> 16), bx2) = arg_4;
        if (1 && *(int *)((char *)&loc_8 + 0) == -1) {
            p12 = 0;
            p14 = 1;
            p16 = loc_6;
            p18 = bx2;
            p20 = 0xe094;
            t1 = far_e05c0(p18, p16, p14, p12);
            cx = UNDEF;
            ax2 = (int)t1;
            dx4 = (int)(t1 >> 16);
        } else {
            ax3 = *(int *)((char *)&loc_8 + 0);
            ax2 = ax3 + 1;
            dx4 = loc_6 + (ax2 < ax3);
        }
        loc_6 = dx4;
        *(int *)((char *)&loc_8 + 0) = ax2;
    }
    return;
}
