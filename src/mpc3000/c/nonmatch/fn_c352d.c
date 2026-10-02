/* differs: 308 at +5, 300 bytes; 311 at +5, 300 bytes; 312 at +5, 300 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void far fn_c3444(int, int, long);
void far fn_c3444(int p0, int p1, long p2) { }

long far fn_c352d(unsigned long arg_0, int arg_2, long arg_4, int arg_6)
{
    int loc_2;
    unsigned long loc_4;
    int loc_6;
    unsigned int loc_8;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int es3;
    int es4;
    int flags;
    int flags2;
    int flags3;
    int t1;

    fn_c3444(*(int *)((char *)&arg_0 + 0), arg_2, arg_4);
    if (UNDEF != 0) {
        return 0L;
    }
    bx = (int)arg_4;
    es = (int)(arg_4 >> 16);
    ax = *(int far *)MK_FP(es, bx + 26);
    dx = *(int far *)MK_FP(es, bx + 24);
    loc_6 = ax;
    loc_8 = dx;
    loc_2 = ax;
    *(int *)((char *)&loc_4 + 0) = dx;
    ax2 = *(int far *)MK_FP(es, bx + 6);
    flags = ax2 - arg_2;
    if (!CC(">", flags) && (CC("!=", flags) || (unsigned int)*(int far *)MK_FP(es, bx + 4) <= (unsigned int)*(int *)((char *)&arg_0 + 0))) {
        bx2 = (int)arg_4;
        es2 = (int)(arg_4 >> 16);
        dx2 = *(int far *)MK_FP(es2, bx2);
        loc_6 = (int)(((long)*(int far *)MK_FP(es2, bx2 + 2) << 16 | (unsigned)dx2) - arg_0 >> 16);
        loc_8 = dx2 - *(int *)((char *)&arg_0 + 0);
    } else {
        bx3 = (int)arg_4;
        es3 = (int)(arg_4 >> 16);
        ax3 = *(int far *)MK_FP(es3, bx3 + 10);
        flags2 = ax3 - arg_2;
        if (!CC("<", flags2) && (CC(">", flags2) || (unsigned int)*(int far *)MK_FP(es3, bx3 + 8) > (unsigned int)*(int *)((char *)&arg_0 + 0))) {
            bx4 = (int)arg_4;
            es4 = (int)(arg_4 >> 16);
            dx3 = *(int far *)MK_FP(es4, bx4 + 8);
            loc_6 = (int)(((long)*(int far *)MK_FP(es4, bx4 + 10) << 16 | (unsigned)dx3) - arg_0 >> 16);
            loc_8 = dx3 - *(int *)((char *)&arg_0 + 0);
        } else {
            loc_6 = 0;
            loc_8 = 0;
        }
    }
    ax4 = loc_2;
    flags3 = ax4 - loc_6;
    if (!CC("<", flags3) && (CC(">", flags3) || (unsigned int)*(int *)((char *)&loc_4 + 0) > loc_8)) {
        loc_2 = loc_6;
        *(int *)((char *)&loc_4 + 0) = loc_8;
    }
    return loc_4;
}
