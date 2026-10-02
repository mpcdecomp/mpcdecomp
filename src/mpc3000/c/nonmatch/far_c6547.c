/* differs: 308 absent; 311 at +4, 272 bytes; 312 at +4, 273 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_977C;
extern char B_977D;
extern char B_977E;
extern char B_977F;
extern char B_9780;
extern char B_9781;
extern char B_D4AB;
extern char B_D4BE;
extern char B_E421;
extern char FP_E40C[];
extern int W_E40E;
extern long far far_c2b07(long);
extern long far far_c2c33(void);
extern long far far_da7e0(char, int);
extern long far far_dac45(int);

long far far_c6547(int arg_0)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int dx;
    int es;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    if (arg_0 >= 0 && arg_0 < 24) {
        t1 = far_dac45(arg_0);
        W_E40E = (int)(t1 >> 16);
        *(int *)((char *)&FP_E40C + 0) = (int)t1;
        B_E421 = *(char *)((char *)&arg_0 + 0);
        t2 = far_c2c33();
        ax = (int)far_c2b07(t2);
        if (B_D4AB != 0) {
            t3 = (long)(signed char)B_9781 * 24L;
            ax = ((char)((int)t3 >> 8) << 8 | (unsigned char)*(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + -755 + (int)t3));
            B_9780 = (char)ax;
        }
        bx = (int)*(long *)((char *)&FP_E40C + 0);
        es = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 17));
        B_977F = (char)ax2;
        t4 = (long)(signed char)(char)ax2 * 24L;
        ax3 = ((char)((int)t4 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + (int)t4 - 0x2f3));
        B_977E = (char)ax3;
        t5 = far_da7e0(B_977C, ax3);
        ax4 = (int)t5;
        dx = (int)(t5 >> 16);
        B_977D = (char)ax4;
        B_D4BE = (char)80;
    }
    return ((long)dx << 16 | (unsigned)ax4);
}
