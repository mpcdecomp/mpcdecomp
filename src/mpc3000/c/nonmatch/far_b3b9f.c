/* differs: 308 absent; 311 at +5, 407 bytes; 312 at +5, 407 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_7AC3;
extern long far far_b3d1d(int, int, int);
extern long far far_cad00(int);
extern long far far_d5b6a(int);

long far far_b3b9f(int arg_0)
{
    int loc_2;
    int ax;
    int dx;
    int flags;
    int flags2;
    int flags3;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    if (arg_0 != 0) {
        goto L1;
    }
    return ((long)dx << 16 | (unsigned)arg_0);
L1:
    if (arg_0 <= 0) {
        goto L2;
    }
    loc_2 = 2;
    si = arg_0;
    goto L3;
L2:
    if (arg_0 <= -30) {
        goto L4;
    }
    loc_2 = 1;
    si = -arg_0;
    goto L3;
L4:
    if (arg_0 <= -64) {
        goto L5;
    }
    loc_2 = 3;
    si = -arg_0;
    goto L3;
L5:
    loc_2 = 0;
    if ((arg_0 & -0x100) == -0x100) {
        goto L6;
    }
    goto L7;
L6:
    if (arg_0 == -128) {
        goto L8;
    }
    if (arg_0 != -160) {
        goto L9;
    }
L8:
    if (B_7AC3 != 0) {
        goto L10;
    }
    si = 21;
    t3 = far_d5b6a(1);
    goto L11;
L10:
    si = 20;
    t4 = far_d5b6a(0);
L11:
    t5 = far_cad00(0);
    goto L3;
L9:
    ax = arg_0 & -129;
    flags = ax + 208;
    if (CC("==", flags)) {
        goto L12;
    }
    if (CC(">u", flags)) {
        goto L13;
    }
    flags2 = ax + 248;
    if (CC("==", flags2)) {
        goto L14;
    }
    if (CC(">u", flags2)) {
        goto L15;
    }
    if (ax == -254) {
        goto L16;
    }
    if (ax == -253) {
        goto L17;
    }
    if (ax == -252) {
        goto L16;
    }
    goto L3;
L15:
    if (ax == -240) {
        goto L18;
    }
    if (ax == -224) {
        goto L14;
    }
    goto L3;
L13:
    flags3 = ax + 183;
    if (CC("==", flags3)) {
        goto L19;
    }
    if (CC(">u", flags3)) {
        goto L20;
    }
    if (ax == -192) {
        goto L14;
    }
    if (ax == -184) {
        goto L21;
    }
    goto L3;
L20:
    if (ax == -176) {
        goto L22;
    }
    if (ax == -175) {
        goto L23;
    }
    goto L3;
L16:
    si = 22;
    goto L3;
L17:
    si = 23;
    goto L3;
L18:
    si = 24;
    goto L3;
L14:
    si = 25;
    goto L3;
L12:
    si = 27;
    goto L3;
L21:
    si = 29;
    goto L3;
L19:
    si = 30;
    goto L3;
L22:
    si = 28;
    t1 = far_d5b6a(0);
    t2 = far_cad00(0);
    goto L3;
L23:
    si = 31;
    goto L3;
L7:
    si = -(arg_0 >> 8);
L3:
    return (long)MK_FP((int)(far_b3d1d(loc_2, si, arg_0) >> 16), arg_0);
}
long far far_b3d1d(int p0, int p1, int p2) { return 0; }
