/* differs: 308 at +4, 766 bytes; 311 at +4, 768 bytes; 312 at +4, 769 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far far_b1ff2(long arg_0, long arg_4, long arg_8)
{
    int loc_18;
    int loc_16;
    unsigned int loc_14;
    unsigned int loc_12;
    char loc_10[2];
    int loc_e;
    int loc_c;
    char loc_a[2];
    char loc_8[2];
    char loc_6[2];
    unsigned int loc_4;
    unsigned int loc_2;
    unsigned int ax;
    unsigned int ax2;
    unsigned int ax3;
    unsigned int ax4;
    unsigned int ax5;
    unsigned int ax6;
    int ax7;
    int ax8;
    int bx;
    int bx2;
    unsigned int bx3;
    int bx4;
    int bx5;
    int cx;
    unsigned int cx2;
    int cx3;
    int di;
    int ds;
    int ds2;
    int ds3;
    int dx;
    int dx2;
    int dx3;
    unsigned int dx4;
    int dx5;
    int dx6;
    int flags;
    int flags2;
    int flags3;
    int si;
    unsigned long t1;
    long t2;
    long t3;
    long t4;

    bx = (int)arg_0;
    ds = (int)(arg_0 >> 16);
    loc_2 = *(int far *)MK_FP(ds, bx);
    loc_4 = *(int far *)MK_FP(ds, bx + 2);
    *(int *)((char *)&loc_6 + 0) = *(int far *)MK_FP(ds, bx + 4);
    *(int *)((char *)&loc_8 + 0) = *(int far *)MK_FP(ds, bx + 6);
    bx2 = (int)arg_4;
    ds2 = (int)(arg_4 >> 16);
    ax = *(int far *)MK_FP(ds2, bx2);
    *(int *)((char *)&loc_a + 0) = ax;
    dx = *(int far *)MK_FP(ds2, bx2 + 2);
    loc_c = dx;
    loc_18 = si;
    cx = 0;
L1:
    flags = dx;
    if (CC("s", flags)) {
        goto L2;
    }
    cx = cx + 1;
    ax = ax << 1 | CC("<u", flags);
    dx = dx << 1 | ax >> 15 & 1;
    goto L1;
L2:
    loc_16 = cx;
    loc_14 = dx;
    loc_12 = ax;
L3:
    if (cx == 0) {
        goto L4;
    }
    loc_2 = loc_2 << 1;
    loc_4 = loc_4 << 1 | loc_2 >> 15 & 1;
    *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) << 1 | loc_4 >> 15 & 1;
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) << 1 | (unsigned int)*(int *)((char *)&loc_6 + 0) >> 15 & 1;
    cx = cx - 1;
    goto L3;
L4:
    di = 0;
    *(int *)((char *)&loc_a + 0) = di;
L5:
    dx2 = *(int *)((char *)&loc_a + 0 + di);
    ax2 = *(int *)((char *)&loc_8 + 0 + di);
    bx3 = loc_14;
    if (dx2 == bx3) {
        goto L6;
    }
    t1 = ((long)dx2 << 16 | (unsigned)ax2);
    ax3 = (unsigned)(t1 / (unsigned long)(unsigned int)bx3);
    cx2 = ax3;
    bx4 = (unsigned)(t1 % (unsigned long)(unsigned int)bx3);
    goto L7;
L6:
    dx3 = -1;
    goto L8;
L9:
    dx3 = cx2 - 1;
    ax2 = bx4;
L8:
    cx2 = dx3;
    ax4 = ax2 + loc_14;
    if (ax4 < ax2) {
        goto L10;
    }
    bx4 = ax4;
    ax3 = cx2;
L7:
    t2 = (unsigned long)(unsigned int)ax3 * (unsigned long)(unsigned int)loc_12;
    ax5 = (int)t2;
    flags2 = (int)(t2 >> 16) - bx4;
    if (CC("<u", flags2)) {
        goto L10;
    }
    if (CC(">u", flags2)) {
        goto L9;
    }
    if (ax5 > (unsigned int)*(int *)((char *)&loc_6 + 0 + di)) {
        goto L9;
    }
L10:
    t3 = (unsigned long)(unsigned int)loc_12 * (unsigned long)(unsigned int)cx2;
    t4 = (unsigned long)(unsigned int)loc_14 * (unsigned long)(unsigned int)cx2;
    ax6 = (int)t4 + (int)(t3 >> 16);
    dx4 = (int)(t4 >> 16) + (ax6 < (unsigned int)(int)t4);
    *(int *)((char *)&loc_6 + 0 + di) = *(int *)((char *)&loc_6 + 0 + di) - (int)t3;
    *(int *)((char *)&loc_8 + 0 + di) = (int)(((long)*(int *)((char *)&loc_8 + 0 + di) << 16 | (unsigned)*(int *)((char *)&loc_6 + 0 + di)) - ((long)ax6 << 16 | (unsigned)(int)t3) >> 16);
    *(int *)((char *)&loc_a + 0 + di) = (int)(((long)*(int *)((char *)&loc_a + 0 + di) << 16 | (unsigned)*(int *)((char *)&loc_8 + 0 + di)) - ((long)dx4 << 16 | (unsigned)ax6) >> 16);
    if ((unsigned int)*(int *)((char *)&loc_a + 0 + di) >= dx4) {
        goto L11;
    }
    ax7 = loc_12;
    dx5 = loc_14;
    *(int *)((char *)&loc_6 + 0 + di) = *(int *)((char *)&loc_6 + 0 + di) + ax7;
    flags3 = *(int *)((char *)&loc_6 + 0 + di) + ax7;
    *(int *)((char *)&loc_8 + 0 + di) = *(int *)((char *)&loc_8 + 0 + di) + dx5 + CC("<u", flags3);
    *(int *)((char *)&loc_a + 0 + di) = *(int *)((char *)&loc_a + 0 + di) + ((unsigned int)(*(int *)((char *)&loc_8 + 0 + di) + dx5 + CC("<u", flags3)) < (unsigned int)*(int *)((char *)&loc_8 + 0 + di));
    cx2 = cx2 - 1;
L11:
    *(int *)((char *)&loc_10 + 0 + di) = cx2;
    di = di + 2;
    if (di <= 4) {
        goto L5;
    }
    cx3 = loc_16;
L12:
    if (cx3 == 0) {
        goto L13;
    }
    *(int *)((char *)&loc_8 + 0) = (unsigned int)*(int *)((char *)&loc_8 + 0) >> 1;
    *(int *)((char *)&loc_6 + 0) = (unsigned int)*(int *)((char *)&loc_6 + 0) >> 1 | (*(int *)((char *)&loc_8 + 0) & 1) << 15;
    loc_4 = loc_4 >> 1 | (*(int *)((char *)&loc_6 + 0) & 1) << 15;
    loc_2 = loc_2 >> 1 | (loc_4 & 1) << 15;
    cx3 = cx3 - 1;
    goto L12;
L13:
    bx5 = (int)arg_8;
    ds3 = (int)(arg_8 >> 16);
    *(int far *)MK_FP(ds3, bx5 + 4) = loc_2;
    *(int far *)MK_FP(ds3, bx5 + 6) = loc_4;
    ax8 = loc_c;
    *(int far *)MK_FP(ds3, bx5) = ax8;
    dx6 = loc_e;
    *(int far *)MK_FP(ds3, bx5 + 2) = dx6;
    return ((long)dx6 << 16 | (unsigned)ax8);
}
