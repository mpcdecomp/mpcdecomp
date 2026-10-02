/* differs: 308 at +5, 720 bytes; 311 at +5, 717 bytes; 312 at +5, 718 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_F77A {
    int f_0;
};
extern char B_8A9F;
extern unsigned char B_8C41[];
extern char B_901B;
extern char B_956A;
extern unsigned char B_F77B;
extern char TBL_737A[];
extern char TBL_905D[];
extern unsigned char TBL_F779;
extern struct g_TBL_F77A TBL_F77A;
extern int W_8814;
extern int W_9051;
extern int W_9053;
extern int W_9055;
extern int W_947E;
extern long far far_d97ca(int, unsigned char far *, int);
extern int far far_daa82(int);
extern long far far_dad54(int);
extern long far far_deeab(void);
extern int far far_e0031(unsigned char far *);
extern long far far_e3d12(char far *, long);
extern long far far_e51be(char far *, int, int);
extern long far far_e7644(void);
extern long far far_e7d89(unsigned char far *, int);
extern int far fn_e75c8(long);
extern int far fn_e7623(void);

long far far_e7341(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8)
{
    int loc_2;
    int loc_4;
    int loc_6;
    long loc_8;
    int loc_a;
    int loc_c;
    int ax;
    int ax2;
    int ax3;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int flags;
    long t1;
    long t10;
    int t11;
    long t12;
    long t13;
    long t14;
    int t2;
    long t3;
    long t4;
    int t5;
    int t6;
    int t7;
    int t8;
    int t9;

    if (B_901B >= 0) {
        goto L1;
    }
    goto L2;
L1:
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)TBL_905D[arg_0]);
    dx = W_9051;
    loc_2 = W_9053;
    loc_4 = dx;
    t1 = far_e7644();
    loc_6 = (int)(t1 >> 16);
    *(int *)((char *)&loc_8 + 0) = (int)t1;
    t2 = far_e0031((unsigned char far *)B_8C41);
    t3 = far_e51be((char far *)&B_901B, B_8A9F, 0);
    t4 = far_e3d12((char far *)&B_901B, *(long *)((char *)&W_947E + 0));
    B_956A = (char)(B_956A + 1);
    loc_c = 0;
    if (W_9055 != 0) {
        goto L3;
    }
    goto L4;
L3:
    W_8814 = W_8814 + W_9055;
    W_9055 = 0;
    goto L4;
L5:
    loc_a = (int)far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
    ax3 = TBL_F779 & 248;
    if (ax3 == 136) {
        goto L6;
    }
    if (ax3 != 168) {
        goto L7;
    }
    goto L8;
L7:
    if (ax3 == 248) {
        goto L9;
    }
    goto L10;
L6:
    t11 = far_daa82(TBL_F77A.f_0);
    W_8814 = W_8814 + t11;
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) - t11;
    loc_6 = (int)(loc_8 - (long)(int)t11 >> 16);
    flags = loc_6;
    if (CC("<=", flags)) {
        goto L11;
    }
    goto L4;
L11:
    if (CC("!=", flags)) {
        goto L12;
    }
    if (*(int *)((char *)&loc_8 + 0) == 0) {
        goto L12;
    }
    goto L4;
L12:
    loc_c = 1;
    goto L4;
L9:
    loc_c = 1;
    goto L8;
L10:
    if ((char)ax == 0) {
        goto L13;
    }
    if ((unsigned char)*(char *)((char *)&TBL_F77A + 0) == (char)ax) {
        goto L13;
    }
    goto L8;
L13:
    if (arg_6 != 0) {
        goto L14;
    }
    if (ax3 == 152) {
        goto L15;
    }
    goto L4;
L15:
    if ((char)ax != 0) {
        goto L16;
    }
    goto L4;
L16:
    t5 = fn_e75c8(*(long *)((char *)&arg_2 + 0));
    if (t5 != 0) {
        goto L17;
    }
    goto L8;
L17:
    goto L4;
L14:
    if (arg_6 == 1) {
        goto L18;
    }
    goto L19;
L18:
    if (arg_8 != 137) {
        goto L20;
    }
    if (ax3 != 232) {
        goto L21;
    }
    goto L8;
L21:
    goto L4;
L20:
    if (arg_8 <= 8) {
        goto L22;
    }
    if (ax3 == 176) {
        goto L23;
    }
    goto L4;
L23:
    if (B_F77B != arg_8 - 9) {
        goto L24;
    }
    goto L8;
L24:
    goto L4;
L22:
    if (ax3 != 240) {
        goto L25;
    }
    t8 = fn_e7623();
    dx3 = t8;
    if (t8 != 0) {
        goto L26;
    }
    goto L8;
L26:
    if (arg_8 - 5 != dx3) {
        goto L27;
    }
    goto L8;
L27:
    goto L4;
L25:
    if (ax3 != 152) {
        goto L28;
    }
    if (arg_8 != 0) {
        goto L29;
    }
    goto L8;
L29:
    if ((char)ax != 0) {
        goto L30;
    }
    goto L4;
L30:
    t9 = fn_e75c8(*(long *)((char *)&arg_2 + 0));
    if (t9 == 0) {
        goto L8;
    }
    goto L4;
L28:
    if (ax3 == (unsigned char)TBL_737A[arg_8]) {
        goto L8;
    }
    goto L4;
L19:
    if (ax3 != 152) {
        goto L31;
    }
    if (arg_8 != 0) {
        goto L8;
    }
    if ((char)ax == 0) {
        goto L4;
    }
    t6 = fn_e75c8(*(long *)((char *)&arg_2 + 0));
    if (t6 == 0) {
        goto L8;
    }
    goto L4;
L31:
    if (arg_8 != 137) {
        goto L32;
    }
    if (ax3 != 232) {
        goto L8;
    }
    goto L4;
L32:
    if (arg_8 <= 8) {
        goto L33;
    }
    if (B_F77B != arg_8 - 9) {
        goto L8;
    }
    goto L4;
L33:
    if (ax3 != 240) {
        goto L34;
    }
    t7 = fn_e7623();
    dx2 = t7;
    if (t7 == 0) {
        goto L4;
    }
    if (arg_8 - 5 != dx2) {
        goto L8;
    }
    goto L4;
L34:
    if (ax3 == (unsigned char)TBL_737A[arg_8]) {
        goto L4;
    }
L8:
    t10 = far_e7d89((unsigned char far *)&TBL_F779, loc_a);
L4:
    if (loc_c != 0) {
        goto L35;
    }
    goto L5;
L35:
    t12 = far_dad54(1);
    B_956A = (char)(B_956A - 1);
    W_9053 = 0;
    W_9051 = 0;
    t13 = far_e3d12((char far *)&B_901B, *(long *)((char *)&loc_4 + 0));
    t14 = far_deeab();
    ax2 = (int)t14;
    dx4 = (int)(t14 >> 16);
L2:
    return ((long)dx4 << 16 | (unsigned)ax2);
}
long far far_e7644(void) { return 0; }
int far fn_e75c8(long p0) { return 0; }
int far fn_e7623(void) { return 0; }
