/* differs: 308 at +3, 631 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
struct g_W_9031 {
    long f_0;
};
extern char B_901B;
extern int B_901C;
extern unsigned char B_9457;
extern unsigned char W_9021;
extern unsigned char W_9023;
extern unsigned char W_9025;
extern unsigned char W_9027;
extern unsigned char W_9029;
extern unsigned char W_902B;
extern unsigned char W_902D;
extern unsigned char W_902F;
extern struct g_W_9031 W_9031;
extern int W_9033;
extern int W_9035;
extern int W_9037;
extern int W_904D;
extern long far far_e56a0();

long far far_d9b6e(int arg_0, long arg_2, int arg_6)
{
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    unsigned int bx2;
    int bx3;
    int cx;
    int cx2;
    int di;
    unsigned int di2;
    int ds;
    int ds2;
    int dx;
    unsigned int dx2;
    int es;
    int es2;
    int es3;
    int flags;
    int p12;
    int p122;
    int si;
    int si2;
    long t1;

    if (*(char *)((char *)&arg_0 + 0) == 8) {
        goto L1;
    }
    if (B_901B != 0) {
        goto L2;
    }
    if (*(char *)((char *)&arg_0 + 0) == 1) {
        goto L3;
    }
    if (*(char *)((char *)&arg_0 + 0) == 4) {
        goto L4;
    }
L2:
    goto L5;
L4:
    di = 0;
    goto L6;
L1:
    di = 0x2b36;
L6:
    ax6 = 0x96e6 /* SEG_A8EC */;
    es3 = ax6;
    si2 = (int)arg_2;
    ds2 = (int)(arg_2 >> 16);
    cx2 = arg_6;
    dx2 = *(int far *)MK_FP(es3, di);
    bx2 = *(int far *)MK_FP(es3, di + 2) + cx2;
    if (bx2 <= dx2) {
        goto L7;
    }
    arg_6 = 0;
    goto L5;
L7:
    *(int far *)MK_FP(es3, di + 2) = bx2;
    bx3 = *(int far *)MK_FP(es3, di + 4);
L8:
    ax6 = ((char)(ax6 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds2, si2));
    si2 = si2 + 1;
    if (bx3 != 0) {
        goto L9;
    }
    bx3 = dx2;
L9:
    bx3 = bx3 - 1;
    *(char far *)MK_FP(es3, bx3 + 8 + di) = (char)ax6;
    cx2 = cx2 - 1;
    if (cx2 != 0) {
        goto L8;
    }
    *(int far *)MK_FP(es3, di + 4) = bx3;
    arg_6 = arg_6;
    goto L5;
L3:
    si = (int)arg_2;
    es = (int)(arg_2 >> 16);
    ax2 = ((char)(arg_6 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 & -8));
    if ((char)ax3 != -88) {
        goto L10;
    }
    ax4 = *(int far *)MK_FP(es, si + 1);
    bx = UNDEF;
    es = UNDEF;
    dx = (int)(far_e56a0(B_901C) >> 16);
    if ((unsigned int)((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 << 1)) >> 1 != W_904D) {
        goto L11;
    }
    ax5 = *(int *)((char *)&W_9031 + 0);
    W_9037 = W_9033;
    W_9035 = ax5;
L11:
    goto L12;
L10:
    if ((char)ax3 != -8) {
        goto L12;
    }
    t1 = far_e56a0(B_901C, 0, W_9031.f_0);
    bx = UNDEF;
    es = UNDEF;
L12:
    p12 = es;
    cx = arg_6;
    di2 = (int)W_9031.f_0;
    es2 = (int)(W_9031.f_0 >> 16);
    ds = p12;
L13:
    bx = ((char)(bx >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, si));
    si = si + 1;
    *(char far *)MK_FP(es2, di2) = (char)bx;
    dx2 = es2;
    di2 = di2 + 1;
    if (di2 != 0) {
        goto L14;
    }
    dx2 = dx2 + 0x1000;
    es2 = dx2;
L14:
    p122 = ds;
    flags = dx2 - *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9023);
    if (CC("<u", flags)) {
        goto L15;
    }
    if (CC("!=", flags)) {
        goto L16;
    }
    if (di2 < (unsigned int)*(int far *)MK_FP(-0x7ff0, (unsigned)&W_9021)) {
        goto L15;
    }
L16:
    dx2 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9027);
    es2 = dx2;
    di2 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9025);
L15:
    if (di2 != *(int far *)MK_FP(-0x7ff0, (unsigned)&W_902D)) {
        goto L17;
    }
    if (dx2 != *(int far *)MK_FP(-0x7ff0, (unsigned)&W_902F)) {
        goto L17;
    }
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_9457) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_9457) | 4);
    arg_6 = 0;
    goto L5;
L17:
    ds = p122;
    cx = cx - 1;
    if (cx != 0) {
        goto L13;
    }
    if (*(char far *)MK_FP(ds, (int)arg_2) != -1) {
        goto L18;
    }
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9029) = di2;
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_902B) = dx2;
L18:
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9031) = di2;
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9033) = dx2;
    arg_6 = arg_6;
L5:
    return ((long)dx2 << 16 | (unsigned)arg_6);
}
