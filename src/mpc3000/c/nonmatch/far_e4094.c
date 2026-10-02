/* differs: 308 at +3, 199 bytes; 311 at +3, 203 bytes; 312 at +3, 203 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_A5C0;
extern int W_9051;
extern int W_9053;
extern long far far_deee8(unsigned char far *, int);
extern long far far_e562e(void);
extern long far far_e5a99(unsigned char far *);
extern long far far_e6890(void);
extern long far far_ea926(int);
extern void far fn_e4147(void);
extern void far fn_e41ef(void);
extern void far fn_e4354(void);
extern void far fn_e443f(void);

long far far_e4094(int arg_0, int arg_2)
{
    int ax;
    int dx;
    int dx2;
    int flags;
    long t1;
    long t2;
    long t3;
    int t4;
    int t5;
    int t6;
    int t7;
    long t8;
    long t9;

    t1 = far_e5a99((unsigned char far *)B_901B);
    dx = (int)(far_e5a99((unsigned char far *)B_8C41) >> 16);
    ax = *(char *)((char *)&arg_0 + 0);
    flags = ax - 123;
    if (!CC("==", flags)) {
        if (!CC(">", flags)) {
            if (ax != 91) {
                if (ax == 93) {
                    t2 = far_deee8((unsigned char far *)B_901B, W_9053 + 1);
                }
            } else {
                dx2 = W_9053;
                if (W_9051 == 0x100) {
                    dx2 = dx2 - 1;
                }
                t3 = far_deee8((unsigned char far *)B_901B, dx2);
            }
        } else if (ax == 125) {
            if (arg_2 != 0 && B_A5C0 != 0) {
                fn_e4354();
            } else {
                fn_e4147();
            }
        }
    } else if (arg_2 != 0 && B_A5C0 != 0) {
        fn_e443f();
    } else {
        fn_e41ef();
    }
    t8 = far_e6890();
    t9 = far_e562e();
    return far_ea926(0);
}
void far fn_e4147(void) { }
void far fn_e41ef(void) { }
void far fn_e4354(void) { }
void far fn_e443f(void) { }
