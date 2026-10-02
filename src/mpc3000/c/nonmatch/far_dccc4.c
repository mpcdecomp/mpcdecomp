/* differs: 308 at +5, 425 bytes; 311 at +5, 425 bytes; 312 at +5, 425 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_W_8C35 {
    long f_0;
};
extern char B_8800;
extern char B_8A9B;
extern char B_8A9C;
extern char B_8A9E;
extern char B_8A9F;
extern char B_901B;
extern char B_901C;
extern int W_8814;
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern int W_901D;
extern int W_901F;
extern int W_9021;
extern int W_9023;
extern int W_9025;
extern int W_9027;
extern int W_9029;
extern int W_902B;
extern int W_902D;
extern int W_902F;
extern int W_9031;
extern int W_9033;
extern int W_903D;
extern int W_903F;
extern int W_904B;
extern int W_9055;
extern long far far_da9e4();
extern long far far_e259f();
extern long far far_e26cc();
extern long far far_e3478();

int far far_dccc4(char arg_0)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int dx;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;
    int dx5;
    int dx6;
    int es;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    if (B_8800 == 0 && B_8A9E == 0) {
        return -1;
    }
    if ((B_901B & 1) == 0) {
        return -1;
    }
    if ((int)far_e259f(arg_0) != 0) {
        W_901F = 0;
        W_901D = 0;
        B_901B = (char)-1;
        W_904B = 0;
        W_903F = 0;
        W_903D = 0;
        return -1;
    }
    B_901C = (char)(B_901C & -3);
    ax2 = W_8C37;
    dx = *(int *)((char *)&W_8C35 + 0);
    W_901F = ax2;
    W_901D = dx;
    t1 = far_e26cc(((long)ax2 << 16 | (unsigned)dx));
    loc_a = -((int)t1 < 0);
    bx = (int)W_8C35.f_0;
    es = (int)(W_8C35.f_0 >> 16);
    dx2 = *(int far *)MK_FP(es, bx + 1);
    loc_2 = *(int far *)MK_FP(es, bx + 3);
    loc_4 = dx2;
    ax3 = *(int far *)MK_FP(es, bx + 7);
    dx3 = *(int far *)MK_FP(es, bx + 5);
    loc_6 = ax3;
    loc_8 = dx3;
    dx4 = dx3 + (int)t1;
    t2 = far_da9e4(W_901D, W_901F, dx4, ax3 + loc_a + (dx4 < dx3));
    W_9033 = (int)(t2 >> 16);
    W_9031 = (int)t2;
    W_902B = (int)(t2 >> 16);
    W_9029 = (int)t2;
    t3 = far_da9e4(W_901D, W_901F, (int)t1, loc_a);
    W_9027 = (int)(t3 >> 16);
    W_9025 = (int)t3;
    t4 = far_da9e4((int)t3, (int)(t3 >> 16), loc_4, loc_2);
    W_9023 = (int)(t4 >> 16);
    W_9021 = (int)t4;
    ax4 = W_9033;
    dx5 = W_9031;
    W_902F = ax4;
    W_902D = dx5;
    if (ax4 == W_9023 && W_9031 == W_9021) {
        dx6 = W_9025;
        W_902F = W_9027;
        W_902D = dx6;
    }
    W_9055 = 0;
    W_8814 = 0;
    B_901B = (char)1;
    t5 = far_e3478((char far *)&B_901B);
    B_8A9B = B_8A9C;
    B_8A9F = arg_0;
    return 0;
}
