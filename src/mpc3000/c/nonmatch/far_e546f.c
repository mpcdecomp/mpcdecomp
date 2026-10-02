/* differs: 308 absent; 311 at +5, 539 bytes; 312 at +5, 538 bytes */
#define UNDEF 0
struct g_TBL_F77A {
    int f_0;
};
extern unsigned char B_901B[];
extern char B_956A;
extern unsigned char B_F77B;
extern unsigned char B_F77D;
extern char B_F77E;
extern unsigned char B_F781;
extern char TBL_83D1;
extern char TBL_83D3[];
extern unsigned char TBL_F779;
extern struct g_TBL_F77A TBL_F77A;
extern int W_903D;
extern int W_903F;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daa82(int);
extern long far far_dad54(int);
extern int far far_e0031(unsigned char far *);
extern long far far_e4a1d(int);
extern long far far_e51be(unsigned char far *, int, int);

long far far_e546f(int arg_0, int far *arg_2)
{
    int loc_8;
    int loc_6;
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int dx;
    int dx2;
    int flags;
    int flags2;
    int si;
    long t1;
    long t10;
    int t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_e51be((unsigned char far *)B_901B, arg_0, 0);
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    if (ax == 0) {
        goto L1;
    }
    goto L2;
L1:
    dx2 = W_903D;
    loc_2 = W_903F;
    *(int *)((char *)&loc_4 + 0) = dx2;
    B_956A = (char)(B_956A + 1);
    loc_8 = 0;
    goto L3;
L4:
    loc_6 = (int)far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
    ax2 = TBL_F779 & 248;
    flags = ax2 - 160;
    if (CC("==", flags)) {
        goto L5;
    }
    if (CC(">", flags)) {
        goto L6;
    }
    if (ax2 == 136) {
        goto L7;
    }
    if (ax2 == 152) {
        goto L5;
    }
    goto L8;
L6:
    if (ax2 != 240) {
        goto L9;
    }
    goto L10;
L9:
    if (ax2 != 248) {
        goto L11;
    }
    goto L12;
L11:
    goto L8;
L7:
    t2 = far_daa82(TBL_F77A.f_0);
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - t2;
    loc_2 = (int)(loc_4 - (long)(int)t2 >> 16);
    flags2 = loc_2;
    if (CC("<=", flags2)) {
        goto L13;
    }
    goto L8;
L13:
    if (CC("!=", flags2)) {
        goto L14;
    }
    if (*(int *)((char *)&loc_4 + 0) == 0) {
        goto L14;
    }
    goto L8;
L14:
    loc_8 = 1;
    goto L8;
L5:
    t5 = far_e4a1d((unsigned char)*(char *)((char *)&TBL_F77A + 0));
    if ((int)t5 != 0) {
        goto L15;
    }
    goto L8;
L15:
    if (B_F77B != 0) {
        goto L16;
    }
    if (ax2 != 152) {
        goto L17;
    }
    TBL_F779 = (unsigned char)(TBL_F779 | 1);
    t6 = (long)(int)B_F77D * 33L;
    t7 = (long)(int)(int)t6;
    B_F77D = (unsigned char)((char)(int)(t7 / 127L) + 12);
L17:
    B_F77B = TBL_83D1;
    goto L8;
L16:
    si = B_F77B & 31;
    if (ax2 != 152) {
        goto L18;
    }
    t8 = (long)(int)(arg_2[si] - 0x2000);
    bx = B_F77D + (int)(t8 / 20L);
    if (bx <= 124) {
        goto L19;
    }
    bx = 124;
L19:
    if (bx >= 4) {
        goto L20;
    }
    bx = 4;
L20:
    B_F77D = (char)bx;
L18:
    B_F77B = TBL_83D3[si];
    goto L8;
L10:
    if (B_F77B != 71) {
        goto L8;
    }
    if (B_F77E == 69) {
        goto L21;
    }
    if (B_F77E != 70) {
        goto L8;
    }
L21:
    t3 = (long)(int)B_F781 * 100L;
    t4 = (long)(int)(int)t3;
    B_F781 = (char)(int)(t4 / 127L);
    goto L8;
L12:
    loc_8 = 1;
L8:
    t9 = far_dad54(1);
    t10 = far_d9b6e(1, (unsigned char far *)&TBL_F779, loc_6);
L3:
    if (loc_8 != 0) {
        goto L22;
    }
    goto L4;
L22:
    ax = far_e0031((unsigned char far *)B_901B);
    dx = UNDEF;
    B_956A = (char)(B_956A - 1);
L2:
    return ((long)dx << 16 | (unsigned)ax);
}
