/* differs: 308 at +5, 497 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
struct g_TBL_882E {
    int f_0;
};
struct g_TBL_65DA {
    int f_0;
};
struct g_TBL_65D8 {
    int f_0;
};
extern char B_7FCA;
extern unsigned char B_8A88;
extern struct g_TBL_65D8 TBL_65D8;
extern struct g_TBL_65DA TBL_65DA;
extern struct g_TBL_882E TBL_882E;
extern int W_D651;
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1d48(void far *, int, int, int, int);
extern long far far_de7ae(int, int, int);
extern int far far_de88f(int);
extern void far far_eab36(int far *, int);
extern long far far_fa0c8(int, int, int);

long far fn_c9fa6(char far *arg_0, long arg_4, int far *arg_8, int arg_12)
{
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    unsigned int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    int bx3;
    int dx;
    int es;
    int es2;
    int es3;
    int flags;
    int flags2;
    long t1;
    long t10;
    long t2;
    int t3;
    long t4;
    long t5;
    int t6;
    long t7;
    long t8;
    long t9;

    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    if ((unsigned char)*(char far *)MK_FP(es, bx) <= B_8A88) {
        goto L1;
    }
    *(char far *)MK_FP(es, bx) = B_8A88;
L1:
    bx2 = FP_OFF(arg_0);
    es2 = FP_SEG(arg_0);
    if (*(char far *)MK_FP(es2, bx2) != 0) {
        goto L2;
    }
    *(char far *)MK_FP(es2, bx2) = (char)1;
L2:
    if (B_8A88 != 0) {
        goto L3;
    }
    loc_a = 1;
    loc_c = 0x100;
    loc_6 = 0;
    loc_8 = 0x2710;
    goto L4;
L3:
    t1 = far_fa0c8(0x2710, *(int *)((char *)&TBL_882E + 0 + (unsigned char)*arg_0 * 6), 0);
    t2 = t1 + 0x800L >> 12;
    loc_6 = (int)(t2 >> 16);
    loc_8 = (int)t2;
L4:
    far_b1ad0(5, 9);
    far_eab36((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c), 0);
    far_b1ad0(5, 31);
    t4 = far_fa0c8(loc_8, W_D651, 0);
    t5 = (t4 + 0x1388L) / 0x2710L;
    loc_2 = (int)(t5 >> 16);
    loc_4 = (int)t5;
    flags = loc_2;
    if (CC("<u", flags)) {
        goto L5;
    }
    if (CC(">u", flags)) {
        goto L6;
    }
    if (loc_4 <= 0xbb8) {
        goto L5;
    }
L6:
    loc_2 = 0;
    loc_4 = 0xbb8;
L5:
    flags2 = loc_2;
    if (CC(">u", flags2)) {
        goto L7;
    }
    if (CC("<u", flags2)) {
        goto L8;
    }
    if (loc_4 >= 0x12c) {
        goto L7;
    }
L8:
    loc_2 = 0;
    loc_4 = 0x12c;
L7:
    t6 = far_de88f((int)far_de7ae(loc_4, 0, 0));
    ax3 = B_7FCA << 2;
    far_b1d48(MK_FP(SEG_DATA, 0x6103), t6 / 10, t6 % 10, *(int *)((char *)&TBL_65D8 + 0 + ax3), *(int *)((char *)&TBL_65DA + 0 + ax3));
    t7 = *(long *)((char *)&loc_8 + 0) / 100L;
    bx3 = (int)arg_4;
    es3 = (int)(arg_4 >> 16);
    *(int far *)MK_FP(es3, bx3) = (int)t7;
    ax5 = *(int far *)MK_FP(es3, bx3);
    ax6 = (int)far_fa0c8(100, ax5, -(ax5 < 0));
    dx = loc_8 - ax6;
    *arg_8 = dx;
    if (arg_12 == 0) {
        goto L9;
    }
    t8 = far_b1073(2);
    t9 = far_b1073(3);
    t10 = far_b1073(4);
    ax6 = (int)t10;
    dx = (int)(t10 >> 16);
L9:
    return ((long)dx << 16 | (unsigned)ax6);
}
