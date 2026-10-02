/* differs: 308 at +5, 348 bytes; 311 at +5, 348 bytes; 312 at +5, 348 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1ad0(int, int);
extern int far far_b1ae0(int);
extern int far far_b1d48(void far *, int);
extern long far far_fa0c8(int, int, int);

long far fn_b6f20(unsigned int arg_0, int arg_2, int far *arg_4)
{
    int loc_2;
    unsigned long loc_4;
    int loc_6;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int bx;
    int bx2;
    int bx3;
    int es;
    int es2;
    int es3;
    int flags;
    int flags2;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    t1 = *(long *)((char *)&arg_0 + 0) / 0xea95L;
    si = (int)t1;
    t2 = far_fa0c8(-0x156b, (int)t1, -((int)t1 < 0));
    flags = (int)(t2 >> 16) - arg_2;
    if (CC(">", flags)) {
        goto L1;
    }
    if (CC("<", flags)) {
        goto L2;
    }
    if ((unsigned int)(int)t2 >= arg_0) {
        goto L1;
    }
L2:
    si = si + 1;
L1:
    bx = FP_OFF(arg_4);
    es = FP_SEG(arg_4);
    if (*(int far *)MK_FP(es, bx) >= si) {
        goto L3;
    }
    *(int far *)MK_FP(es, bx) = si;
L3:
    t3 = *(long *)((char *)&arg_0 + 0) / 0x1000L;
    bx2 = FP_OFF(arg_4);
    es2 = FP_SEG(arg_4);
    if (*(int far *)MK_FP(es2, bx2) <= (int)t3) {
        goto L4;
    }
    *(int far *)MK_FP(es2, bx2) = (int)t3;
L4:
    ax = *arg_4;
    t4 = *(long *)((char *)&arg_0 + 0) / (long)(int)ax;
    loc_2 = (int)(t4 >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t4;
    flags2 = loc_2;
    if (CC("<", flags2)) {
        goto L5;
    }
    if (CC(">", flags2)) {
        goto L6;
    }
    if ((unsigned int)*(int *)((char *)&loc_4 + 0) <= 0xea95) {
        goto L5;
    }
L6:
    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = -0x156b;
L5:
    bx3 = FP_OFF(arg_4);
    es3 = FP_SEG(arg_4);
    if (*(int far *)MK_FP(es3, bx3) < 26) {
        goto L7;
    }
    *(int far *)MK_FP(es3, bx3) = 26;
L7:
    far_b1ad0(5, 10);
    far_b1ae0(*arg_4 + 64);
    t5 = loc_4 / 2L;
    loc_6 = (int)((t5 + 0x1f4L) / 0x3e8L);
    far_b1ad0(4, 31);
    far_b1d48(MK_FP(SEG_DATA, 0x2bcb), loc_6);
    return loc_4;
}
