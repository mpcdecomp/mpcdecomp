/* differs: 308 at +5, 614 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
struct s1 {
    char pad_0[14];
    int f_e;
};
extern int W_3C82;
extern int W_3C84;
extern long far L_c4d1a(struct s1 far *, char far *, int, long);
extern int far far_b1ad0(int, int);
extern int far far_b1d48(void far *, int, int);
extern long far far_b3b9f(int);
extern long far far_cca70(void);
extern long far far_cce4b(char far *, long, int);
extern long far fn_bab60(struct s1 far *);
extern long far fn_babc8(char far *);
long far L_c4d1a(struct s1 far *p0, char far *p1, int p2, long p3) { return 0; }
long far fn_bab60(struct s1 far *p0) { return 0; }
long far fn_babc8(char far *p0) { return 0; }

long far fn_bb591(struct s1 far *arg_0, int arg_2, long arg_4, int arg_6)
{
    char loc_cb5[3];
    char loc_cb2[14];
    char loc_ca4[24];
    char loc_c8c[3200];
    int loc_c;
    int loc_a;
    unsigned int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    unsigned int cx;
    int cx2;
    int dx;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;
    int flags;
    int si;
    long t1;
    long t10;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    int t8;
    int t9;

    far_b1ad0(7, 0);
    far_b1d48(MK_FP(SEG_DATA, 0x393e), *(int *)((char *)&arg_0 + 0), arg_2);
    t1 = fn_bab60(arg_0);
    ax3 = arg_0->f_e;
    t2 = (t1 - (long)(int)ax3) / 2L;
    loc_6 = (int)(t2 >> 16);
    loc_8 = (int)t2;
    t3 = far_cca70();
    flags = (int)(t3 >> 16) - loc_6;
    if (!CC(">", flags) && (CC("<", flags) || (unsigned int)(int)t3 < loc_8)) {
        return (long)MK_FP((int)(far_b3b9f(2) >> 16), 2);
    }
    cx = ~__repne_scas1(arg_0, 0, -1);
    cx2 = cx >> 1;
    ax4 = arg_2;
    si = *(int *)((char *)&arg_0 + 0);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_cb2), ((long)ax4 << 16 | (unsigned)si), cx2 * 2);
    __movs1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_cb2 + cx2 * 2)), ((long)ax4 << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    if ((*(int *)((char *)&arg_4 + 0) | arg_6) == 0) {
        ax5 = 0;
    } else {
        ax5 = 1;
    }
    loc_c = ax5;
    if (loc_c != 0) {
        loc_cb5[~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_cb2), 0, -1)] = (char)0;
        t4 = fn_babc8((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_cb2));
    }
    t5 = far_cce4b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_cb2), *(long *)((char *)&loc_8 + 0), loc_c);
    loc_a = (int)t5;
    if (loc_a < 0) {
        return (long)MK_FP((int)(far_b3b9f(-(int)t5) >> 16), 2);
    }
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c8c), ((long)W_3C84 << 16 | (unsigned)(W_3C82 + 0x600)), 0xc80);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_ca4), arg_4, 24);
    t6 = (long)(int)loc_a * 36L;
    ax6 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t6 + 0x4822);
    dx = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t6 + 0x4820);
    loc_2 = ax6;
    loc_4 = dx;
    t7 = L_c4d1a(arg_0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c8c), loc_a, ((long)ax6 << 16 | (unsigned)dx));
    dx2 = (int)(t7 >> 16);
    if ((int)t7 != 0) {
        return ((long)dx2 << 16 | (unsigned)1);
    }
    if (loc_c == 0) {
        goto L1;
    }
    t8 = far_b1ad0(7, 0);
    t9 = far_b1d48(MK_FP(SEG_DATA, 0x393e), *(int *)((char *)&arg_4 + 0), arg_6);
    dx3 = loc_4;
    dx4 = dx3 + loc_8;
    t10 = L_c4d1a((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_ca4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c8c), loc_a, ((long)(loc_2 + loc_6 + (dx4 < dx3)) << 16 | (unsigned)dx4));
    dx2 = (int)(t10 >> 16);
    if ((int)t10 != 0) {
        return ((long)dx2 << 16 | (unsigned)1);
    }
L1:
    return ((long)dx2 << 16 | (unsigned)0);
}
