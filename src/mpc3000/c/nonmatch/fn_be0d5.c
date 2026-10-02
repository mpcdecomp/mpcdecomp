/* differs: 308 at +5, 233 bytes; 311 at +5, 225 bytes; 312 at +5, 227 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_955B;
extern char B_955C;
extern char far *W_8C35;
extern long far far_cace7();
extern long far far_d85fa();
extern long far far_deeab();
extern int far far_e0031();
extern int far far_e1e11();
extern long far far_e259f();
extern long far far_e392e();
extern long far far_e51be();
extern long far far_e546f();

long far fn_be0d5(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8)
{
    char loc_4[4];
    char loc_8[4];
    char loc_48[64];
    int ax;
    int ax2;
    long t1;
    int t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;

    t1 = far_cace7(arg_0, arg_4, arg_6);
    if ((int)t1 != 0) {
        return t1;
    }
    *(int *)((char *)&loc_4 + 2) = B_8A9F;
    far_e0031((unsigned char far *)B_901B);
    far_e0031((unsigned char far *)B_8C41);
    t2 = far_e1e11(arg_8);
    t3 = far_e259f(*(char *)((char *)&arg_8 + 0));
    t4 = far_d85fa(arg_0, arg_2, 0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_48));
    if ((int)t4 != 0) {
        arg_8 = *(int *)((char *)&loc_4 + 2);
    } else {
        *(char far *)((char far *)*(long *)((char *)&W_8C35 + 0)) = *(char *)((char *)&arg_8 + 0);
    }
    t5 = far_e392e(arg_8);
    if (arg_2 <= 2) {
        t6 = far_e546f(arg_8, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_48));
    }
    t7 = far_e51be((unsigned char far *)B_901B, arg_8, 1);
    t8 = far_deeab();
    B_955B = (char)(B_955B | 64);
    B_955C = (char)(B_955C | -128);
    return (long)MK_FP((int)(t8 >> 16), (int)t4);
}
