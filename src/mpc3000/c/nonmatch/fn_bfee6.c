/* differs: 308 at +8, 161 bytes; 311 at +8, 161 bytes; 312 at +8, 160 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9A;
extern char B_8A9C;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_956A;
extern char TBL_905D[];
extern long far far_b1073(int);
extern long far far_e37be(unsigned char far *);
extern int far far_e3b75(void);
extern long far far_e4d15(int, int, void far *);
extern long far fn_bfff8(void);
extern long far fn_c007f(void);
extern long far fn_c01d2(void);
extern long far fn_c0254(void);
extern long far fn_c0446(void);

long far fn_bfee6(char arg_0)
{
    int ax;
    int ax2;
    int t1;
    long t10;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_e3b75();
    B_956A = (char)(B_956A - 1);
    B_8A9A = arg_0;
    if (TBL_905D[arg_0] == -1) {
        ax = (int)far_e37be((unsigned char far *)B_901B);
    }
    ax2 = ((char)-(B_8A9A < 0) << 8 | (unsigned char)TBL_905D[B_8A9A]);
    B_8A9C = (char)ax2;
    t2 = far_e4d15(B_8A9F, ax2, MK_FP(SEG_DATA, -0x6c09));
    t3 = far_b1073(9);
    t4 = fn_c01d2();
    t5 = fn_c007f();
    t6 = far_b1073(10);
    t7 = far_b1073(17);
    t8 = far_b1073(18);
    t9 = fn_c0254();
    t10 = fn_bfff8();
    return fn_c0446();
}
long far fn_bfff8(void) { return 0; }
long far fn_c007f(void) { return 0; }
long far fn_c01d2(void) { return 0; }
long far fn_c0254(void) { return 0; }
long far fn_c0446(void) { return 0; }
