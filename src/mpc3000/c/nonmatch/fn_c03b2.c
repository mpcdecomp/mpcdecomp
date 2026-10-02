/* differs: matches beside its same-file callees (the stubs) */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_A5C2;
extern long far far_b1073(int);
extern int far far_c036b(void);
extern int far far_ea926(int);
extern long far fn_bfff8(void);
extern long far fn_c01d2(void);
extern long far fn_c0211(void);
extern long far fn_c0254(void);
extern long far fn_c0325(void);
int far far_c036b(void) { return 0; }
long far fn_bfff8(void) { return 0; }
long far fn_c01d2(void) { return 0; }
long far fn_c0211(void) { return 0; }
long far fn_c0254(void) { return 0; }
long far fn_c0325(void) { return 0; }

long far fn_c03b2(int far *arg_0)
{
    int ax;
    long t1;
    long t10;
    long t11;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    *arg_0 = far_c036b();
    t1 = far_b1073(0);
    t2 = far_b1073(1);
    t3 = far_b1073(8);
    t4 = far_b1073(9);
    t5 = far_b1073(10);
    t6 = far_b1073(17);
    t7 = far_b1073(18);
    t8 = fn_c0211();
    t9 = fn_c01d2();
    t10 = fn_bfff8();
    t11 = fn_c0254();
    far_ea926(B_A5C2);
    return fn_c0325();
}
