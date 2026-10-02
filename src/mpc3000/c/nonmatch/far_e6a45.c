/* differs: 308 at +24, 159 bytes; 311 at +24, 160 bytes; 312 at +24, 160 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_901C;
extern char B_956A;
extern int W_9053;
extern int W_946C;
extern long far far_deee8(unsigned char far *, int);
extern long far far_e0031(unsigned char far *);
extern long far far_e51be(unsigned char far *, int, int);
extern void far far_e598e(void);
extern long far far_e59bd(void);
extern long far far_e5a99(unsigned char far *);
extern void far fn_e6b07(int, int, int);
extern void far fn_e6bdf(int, int, int, int);

void far far_e6a45(int arg_0, int arg_2, int arg_4, int arg_6)
{
    int ax;
    int ax2;
    int ax3;
    long t1;
    int t2;
    long t3;
    long t4;
    int t5;
    int t6;
    long t7;
    long t8;
    long t9;

    ax = arg_0 * 0x180 / arg_2;
    ax2 = arg_4 * 0x180 / arg_6;
    if (ax == ax2) {
        return;
    }
    ax3 = W_946C;
    if (ax3 == W_9053) {
        t1 = far_deee8((unsigned char far *)B_901B, ax3);
    }
    far_e598e();
    t3 = far_e51be((unsigned char far *)B_901B, B_8A9F, 0);
    t4 = far_deee8((unsigned char far *)B_901B, W_946C);
    B_956A = (char)(B_956A + 1);
    if (ax2 < ax) {
        fn_e6b07(ax2, arg_4, arg_6);
    } else {
        fn_e6bdf(ax, ax2 - ax, arg_4, arg_6);
    }
    B_956A = (char)(B_956A - 1);
    B_901C = (char)(B_901C & -3);
    t7 = far_e5a99((unsigned char far *)B_901B);
    t8 = far_e0031((unsigned char far *)B_901B);
    t9 = far_e59bd();
    return;
}
void far fn_e6b07(int p0, int p1, int p2) { }
void far fn_e6bdf(int p0, int p1, int p2, int p3) { }
