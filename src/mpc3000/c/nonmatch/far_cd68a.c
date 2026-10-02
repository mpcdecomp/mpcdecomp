/* differs: 308 at +5, 647 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern int far far_cb566();

long far far_cd68a(unsigned long arg_0, int arg_2, unsigned long arg_4, int arg_6, unsigned int arg_8, int arg_10)
{
    int loc_c;
    int loc_a;
    long loc_8;
    int loc_6;
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    int cx;
    unsigned int dx;
    unsigned int dx2;
    unsigned int dx3;
    unsigned int dx4;
    unsigned int dx5;
    int dx6;
    int dx7;
    int dx8;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int t1;
    int t2;
    int t3;
    int t4;

    ax = arg_2;
    flags = ax - arg_6;
    if (CC(">=", flags)) {
        goto L1;
    }
    goto L2;
L1:
    if (CC(">", flags)) {
        goto L3;
    }
    if ((unsigned int)*(int *)((char *)&arg_0 + 0) > (unsigned int)*(int *)((char *)&arg_4 + 0)) {
        goto L3;
    }
    goto L2;
L3:
    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    goto L4;
L5:
    cx = *(int *)((char *)&loc_4 + 0);
    bx2 = (int)(((long)loc_2 << 16 | (unsigned)cx) + 0x2400L >> 16);
    flags4 = bx2 - arg_10;
    if (CC(">", flags4)) {
        goto L6;
    }
    if (CC("!=", flags4)) {
        goto L7;
    }
    if ((unsigned int)(cx + 0x2400) > arg_8) {
        goto L6;
    }
L7:
    loc_6 = 0;
    *(int *)((char *)&loc_8 + 0) = 0x2400;
    goto L8;
L6:
    dx7 = arg_8;
    loc_6 = (int)(((long)arg_10 << 16 | (unsigned)dx7) - loc_4 >> 16);
    *(int *)((char *)&loc_8 + 0) = dx7 - *(int *)((char *)&loc_4 + 0);
L8:
    loc_a = 0xa853 /* SEG_A28F */;
    loc_c = 0;
    t3 = far_cb566(MK_FP(0xa853 /* SEG_A28F */, 0), arg_0, loc_8, 1);
    t4 = far_cb566(loc_c, loc_a, arg_4, loc_8, 0);
    ax4 = loc_6;
    dx8 = *(int *)((char *)&loc_8 + 0);
    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + dx8;
    arg_2 = (int)(arg_0 + ((long)ax4 << 16 | (unsigned)dx8) >> 16);
    *(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) + dx8;
    arg_6 = (int)(arg_4 + ((long)ax4 << 16 | (unsigned)dx8) >> 16);
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 0x2400;
    loc_2 = (int)(loc_4 + 0x2400L >> 16);
L4:
    ax2 = loc_2;
    dx = *(int *)((char *)&loc_4 + 0);
    flags3 = ax2 - arg_10;
    if (CC(">=", flags3)) {
        goto L9;
    }
    goto L5;
L9:
    if (CC("==", flags3)) {
        goto L10;
    }
    goto L11;
L10:
    if (dx >= arg_8) {
        goto L12;
    }
    goto L5;
L12:
    return ((long)dx << 16 | (unsigned)ax2);
L2:
    ax2 = arg_10;
    dx = arg_8;
    loc_2 = ax2;
    *(int *)((char *)&loc_4 + 0) = dx;
    goto L13;
L14:
    bx = (int)(loc_4 - 0x2400L >> 16);
    if (bx < 0) {
        goto L15;
    }
    if (bx != 0) {
        goto L16;
    }
    if (0) {
        goto L15;
    }
L16:
    loc_6 = 0;
    *(int *)((char *)&loc_8 + 0) = 0x2400;
    goto L17;
L15:
    loc_6 = loc_2;
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_4 + 0);
L17:
    loc_a = 0xa853 /* SEG_A28F */;
    loc_c = 0;
    dx2 = *(int *)((char *)&arg_0 + 0);
    dx3 = dx2 + arg_8;
    t1 = far_cb566(MK_FP(0xa853 /* SEG_A28F */, 0), MK_FP((int)(((long)(arg_2 + arg_10 + (dx3 < dx2)) << 16 | (unsigned)dx3) - loc_8 >> 16), dx3 - *(int *)((char *)&loc_8 + 0)), loc_8, 1);
    dx4 = *(int *)((char *)&arg_4 + 0);
    dx5 = dx4 + arg_8;
    t2 = far_cb566(loc_c, loc_a, MK_FP((int)(((long)(arg_6 + arg_10 + (dx5 < dx4)) << 16 | (unsigned)dx5) - loc_8 >> 16), dx5 - *(int *)((char *)&loc_8 + 0)), loc_8, 0);
    ax3 = loc_6;
    dx6 = *(int *)((char *)&loc_8 + 0);
    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - dx6;
    arg_2 = (int)(arg_0 - ((long)ax3 << 16 | (unsigned)dx6) >> 16);
    *(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) - dx6;
    arg_6 = (int)(arg_4 - ((long)ax3 << 16 | (unsigned)dx6) >> 16);
    ax2 = 0x2400;
    dx = -(ax2 < 0);
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - ax2;
    loc_2 = (int)(loc_4 - ((long)dx << 16 | (unsigned)ax2) >> 16);
L13:
    flags2 = loc_2;
    if (CC("<=", flags2)) {
        goto L18;
    }
    goto L14;
L18:
    if (CC("!=", flags2)) {
        goto L11;
    }
    if (*(int *)((char *)&loc_4 + 0) == 0) {
        goto L11;
    }
    goto L14;
L11:
    return ((long)dx << 16 | (unsigned)ax2);
}
