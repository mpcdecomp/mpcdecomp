extern char B_A5C0;
extern unsigned char TBL_F779[];
extern int W_93F5;
extern int far far_d7b8f(int, int);
extern long far far_daf5c(void);
extern long far far_dbe67(unsigned char far *, int, int);
extern long far far_ddf77(void);
extern long far far_e5612(int, int);

void far fn_c8c0a(int arg_0, int arg_2, int arg_4)
{
    int ax;
    long t1;
    long t2;
    long t3;
    long t4;

    if (W_93F5 != 0) {
        t1 = far_dbe67((unsigned char far *)TBL_F779, W_93F5, 0);
        W_93F5 = 0;
    }
    if (arg_4 == 0) {
        t2 = far_ddf77();
    }
    t3 = far_daf5c();
    t4 = far_e5612(arg_0, arg_2);
    far_d7b8f(7, 0);
    B_A5C0 = (char)0;
    return;
}
