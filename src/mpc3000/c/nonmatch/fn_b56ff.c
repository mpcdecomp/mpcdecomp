/* differs: 308 at +5, 976 bytes; 311 at +5, 986 bytes; 312 at +5, 986 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[1548];
    int f_60c;
    int f_60e;
};
extern unsigned char B_7AC3;
extern char B_7AD0;
extern char B_D5DD;
extern char B_D5DE;
extern unsigned int W_E570;
extern int far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(void far *);
extern int far far_b1d48(void far *, int, int);
extern long far far_b353b(void far *, unsigned int far *, char far *, int);
extern long far far_b3b9f(int);
extern int far far_b5536();
extern long far far_b6beb(char far *, void far *);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_cac0f(char far *, char far *);
extern long far far_cac7b(char far *, char far *);
extern long far far_cad00(int);
extern long far far_d7a63(int);
extern long far far_d7a79(void);
extern int far far_fa6e5(char far *, int, int, void far *);
extern long far fn_b556b(int, int, long);
extern long far fn_b5aab(int);
extern long far fn_b5e89(int, int);
extern long far fn_b5f49(long);
extern int far fn_b6cf0(char far *, int);
extern int far fn_b6dd7(char far *, int);
int far far_b5536(void) { return 0; }
long far fn_b556b(int p0, int p1, long p2) { return 0; }

long far fn_b56ff(int arg_0, int arg_2)
{
    char loc_1b[27];
    char loc_22[7];
    char loc_36[20];
    char loc_83a[2052];
    char loc_363d[11779];
    char loc_3652[21];
    int ax;
    int ax2;
    int ax3;
    struct s1 near *ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int di;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int p13916;
    int p13918;
    int p13920;
    int p13922;
    int si;
    int si2;
    long t1;
    int t10;
    long t11;
    long t12;
    long t13;
    long t14;
    int t15;
    long t16;
    int t17;
    int t18;
    long t19;
    long t2;
    long t20;
    long t21;
    int t22;
    long t23;
    long t24;
    long t25;
    long t3;
    long t4;
    long t5;
    int t6;
    int t7;
    int t8;
    int t9;

    B_D5DD = (char)7;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x2317));
    t2 = far_b90dd();
    far_b1b05(MK_FP(SEG_DATA, 0x2542));
    dx = (int)(far_cad00(0) >> 16);
    *(int *)((char *)&loc_1b + 25) = 0;
    *(int *)((char *)&loc_1b + 23) = 0;
    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_36), 0x3f3f, 20);
    loc_36[19] = (char)0;
    *(int *)((char *)&loc_363d + 11776) = 0;
    *(int *)((char *)&loc_83a + 2050) = 0;
    *(int *)((char *)&loc_83a + 2048) = 0;
    si = 0;
    goto L1;
L2:
    if (si != 0) {
        goto L3;
    }
    t3 = far_cac0f((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_36), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22));
    dx2 = (int)t3;
    goto L4;
L3:
    t4 = far_cac7b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_36), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22));
    dx2 = (int)t4;
L4:
    if (dx2 >= 0) {
        goto L5;
    }
    if (dx2 == -0x300) {
        goto L6;
    }
    return (long)MK_FP((int)(far_b3b9f(dx2) >> 16), B_D5DE);
L6:
    *(int *)((char *)&loc_363d + 0 + si * 23) = 0;
    bx = (int)(unsigned)(loc_83a + (si << 2));
    *(int far *)MK_FP(SEG_STACK, bx + 2) = 0;
    *(int far *)MK_FP(SEG_STACK, bx) = 0;
    if (si == 0) {
        goto L7;
    }
    goto L8;
L7:
    *(int *)((char *)&loc_83a + 2) = SEG_DATA;
    *(int *)((char *)&loc_83a + 0) = 0x2300;
    *(int *)((char *)&loc_83a + 6) = 0;
    *(int *)((char *)&loc_83a + 4) = 0;
    goto L8;
L5:
    ax2 = (int)(unsigned)(loc_3652 + si * 23);
    bx2 = (int)(unsigned)(loc_83a + (si << 2));
    *(int far *)MK_FP(SEG_STACK, bx2 + 2) = SEG_STACK;
    *(int far *)MK_FP(SEG_STACK, bx2) = ax2;
    t5 = far_b6beb((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1b), MK_FP(SEG_STACK, ax2));
    dx3 = *(int *)((char *)&loc_22 + 1);
    *(int *)((char *)&loc_363d + 0 + si * 23) = (int)((((long)*(int *)((char *)&loc_22 + 3) << 16 | (unsigned)dx3) + 0x3ffL) / 0x400L);
    *(int *)((char *)&loc_1b + 25) = 1;
    *(int *)((char *)&loc_1b + 23) = *(int *)((char *)&loc_1b + 23) + 1;
    si = si + 1;
L1:
    if (si >= 0x200) {
        goto L8;
    }
    goto L2;
L8:
    if (W_E570 < (unsigned int)*(int *)((char *)&loc_1b + 23)) {
        goto L9;
    }
    W_E570 = 0;
L9:
    if (*(int *)((char *)&loc_1b + 23) <= 1) {
        goto L10;
    }
    t6 = fn_b6cf0((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_83a), *(int *)((char *)&loc_1b + 23));
    t7 = far_fa6e5((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_83a), *(int *)((char *)&loc_1b + 23), 4, (void far *)far_b5536);
    ax3 = fn_b6dd7((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_83a), *(int *)((char *)&loc_1b + 23));
L10:
    si2 = -1;
L11:
    t21 = far_b6cd3(MK_FP(SEG_DATA, 0x2317));
    t22 = far_b1ad0(1, 0);
    t23 = far_b353b(MK_FP(SEG_DATA, 0x2552), (unsigned int far *)&W_E570, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_83a), 20);
    bx3 = (int)*(long *)((char *)&loc_83a + 0 + (W_E570 << 2));
    t24 = fn_b5aab(*(int far *)MK_FP((int)(*(long far *)MK_FP(SEG_STACK, bx3) >> 16), bx3 + 21));
    if (B_7AD0 == 0) {
        goto L12;
    }
    t8 = far_b1ad0(2, 0);
    ax4 = (struct s1 near *)(B_7AC3 << 2);
    t9 = far_b1d48(MK_FP(SEG_DATA, 0x2558), ax4->f_60c, ax4->f_60e);
L12:
    bx4 = (int)(unsigned)(loc_83a + (W_E570 << 2));
    p13918 = *(int far *)MK_FP(SEG_STACK, bx4 + 2);
    p13920 = *(int far *)MK_FP(SEG_STACK, bx4);
    p13922 = 0xb52d;
    di = (int)fn_b556b(p13920, p13918, *(long *)((char *)&arg_0 + 0));
    t25 = far_b90dd();
    p13916 = 0x2560;
    ax5 = far_b1b05(MK_FP(SEG_DATA, p13916));
    *(int *)((char *)&loc_1b + 21) = 3;
    if (B_7AD0 == 0) {
        goto L13;
    }
    p13916 = 0x257c;
    t10 = far_b1b05(MK_FP(SEG_DATA, p13916));
    *(int *)((char *)&loc_1b + 21) = 4;
L13:
    dx4 = (int)(far_d7a79() >> 16);
    goto L14;
L15:
    bx5 = (int)*(long *)((char *)&loc_83a + 0 + (W_E570 << 2));
    t19 = fn_b5aab(*(int far *)MK_FP((int)(*(long far *)MK_FP(SEG_STACK, bx5) >> 16), bx5 + 21));
    p13916 = arg_0;
    bx6 = (int)(unsigned)(loc_83a + (W_E570 << 2));
    p13918 = *(int far *)MK_FP(SEG_STACK, bx6 + 2);
    p13920 = *(int far *)MK_FP(SEG_STACK, bx6);
    p13922 = 0xb52d;
    t20 = fn_b556b(p13920, p13918, ((long)arg_2 << 16 | (unsigned)p13916));
    dx5 = (int)(t20 >> 16);
    di = (int)t20;
    if (si2 != 117) {
        goto L16;
    }
    if (B_7AD0 == 0) {
        goto L16;
    }
    return ((long)dx5 << 16 | (unsigned)si2);
L16:
    t18 = far_b08f7(*(int *)((char *)&loc_1b + 21));
    ax7 = t18;
    dx4 = UNDEF;
    si2 = ax7;
    if (ax7 == 0) {
        goto L15;
    }
    if (*(int *)((char *)&loc_1b + 25) != 0) {
        goto L14;
    }
    if (ax7 == 120) {
        goto L17;
    }
    if (ax7 == 121) {
        goto L17;
    }
    if (ax7 != 122) {
        goto L14;
    }
L17:
    si2 = 0;
L14:
    if (si2 <= 0) {
        goto L16;
    }
    ax6 = si2;
    if (ax6 == 120) {
        goto L18;
    }
    if (ax6 == 121) {
        goto L19;
    }
    if (ax6 == 122) {
        goto L20;
    }
    goto L21;
L18:
    t15 = far_b1af9();
    si2 = -(di + 1);
    if (si2 != 0) {
        goto L22;
    }
    t16 = far_b3b9f(-30);
    t17 = far_b1aff();
    dx4 = UNDEF;
    goto L21;
L22:
    return ((long)UNDEF << 16 | (unsigned)si2);
L19:
    t13 = fn_b5e89(arg_0, arg_2);
    dx4 = (int)(t13 >> 16);
    si2 = (int)t13;
    if ((int)t13 != 0) {
        goto L21;
    }
    si2 = B_D5DE;
    t14 = far_d7a63(55);
    dx4 = (int)(t14 >> 16);
    if (*(int *)((char *)&loc_1b + 23) - 1 != W_E570) {
        goto L21;
    }
    W_E570 = W_E570 - 1;
    goto L21;
L20:
    t11 = fn_b5f49(*(long *)((char *)&arg_0 + 0));
    dx4 = (int)(t11 >> 16);
    si2 = (int)t11;
    if ((int)t11 != 0) {
        goto L21;
    }
    si2 = B_D5DE;
    t12 = far_d7a63(55);
    dx4 = (int)(t12 >> 16);
L21:
    if (si2 > 0) {
        goto L23;
    }
    goto L11;
L23:
    return ((long)dx4 << 16 | (unsigned)si2);
}
long far far_b6beb(char far *p0, void far *p1) { return 0; }
long far far_b6cd3(void far *p0) { return 0; }
long far fn_b5aab(int p0) { return 0; }
long far fn_b5e89(int p0, int p1) { return 0; }
long far fn_b5f49(long p0) { return 0; }
int far fn_b6cf0(char far *p0, int p1) { return 0; }
int far fn_b6dd7(char far *p0, int p1) { return 0; }
