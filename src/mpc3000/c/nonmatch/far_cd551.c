/* differs: 308 absent; 311 at +5, 191 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern long far far_cdb31(char far *, int);
extern long far far_fa74e(char far *, void far *, int);

int far far_cd551(long arg_0, int arg_2)
{
    char loc_12[18];
    int ax;
    unsigned int cx;
    int cx2;
    int cx3;
    int di;
    int di2;
    int dx;
    int si;
    int si2;
    long t1;

    cx = ~__repne_scas1((int)arg_0, 0, -1);
    ax = arg_2;
    si = *(int *)((char *)&arg_0 + 0);
    dx = 17 - cx;
    if (cx <= 17) {
        goto L1;
    }
    cx = cx + dx;
    dx = 0;
L1:
    cx2 = cx >> 1;
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12), ((long)ax << 16 | (unsigned)si), cx2 * 2);
    di = (int)(unsigned)(loc_12 + cx2 * 2);
    cx3 = cx & 1;
    __movs1(MK_FP(SEG_STACK, di), ((long)ax << 16 | (unsigned)(si + cx2 * 2)), cx3);
    __stos1(MK_FP(SEG_STACK, di + cx3), 0, dx);
    t1 = far_cdb31((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12), 16);
    di2 = 0;
    si2 = 0x4800;
L2:
    if ((int)far_fa74e((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12), MK_FP(0xa283 /* SEG_A28F */, si2), 16) != 0) {
        goto L3;
    }
    return di2;
L3:
    si2 = si2 + 36;
    di2 = di2 + 1;
    if (si2 != 0x5a00) {
        goto L2;
    }
    return -4;
}
long far far_cdb31(char far *p0, int p1) { return 0; }
