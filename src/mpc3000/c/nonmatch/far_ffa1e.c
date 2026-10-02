/* differs: 308 at +5, 401 bytes; 311 at +5, 416 bytes; 312 at +5, 416 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_901B[];
extern char B_9469;
extern char B_946B;
extern int W_903D;
extern int W_903F;
extern unsigned int W_943F;
extern int W_9441;
extern int W_9466;
extern int W_9472;
extern int W_9474;
extern int W_9476;
extern int W_947A;
extern int W_947E;
extern long far far_dfdf5(unsigned char far *, int);
extern int far far_e0031(unsigned char near *);
extern long far far_e51be(unsigned char far *, int);
extern long far far_eb007(unsigned char far *, long, long near *);
extern long far far_fa0c8(int, int, int);

long far far_ffa1e(void)
{
    long loc_4;
    long loc_8;
    char loc_c[4];
    int ax;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int flags;
    int t1;
    long t10;
    int t11;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_e0031(B_901B);
    t2 = far_e51be((unsigned char far *)B_901B, B_946B);
    t3 = far_dfdf5((unsigned char far *)B_901B, W_947E);
    if ((int)t3 != 0) {
        return (long)MK_FP((int)(t3 >> 16), -20);
    }
    t4 = far_eb007((unsigned char far *)B_901B, *(long *)((char *)&W_947E + 0), &loc_8);
    t5 = far_dfdf5((unsigned char far *)B_901B, W_947A);
    if ((int)t5 != 0) {
        return (long)MK_FP((int)(t5 >> 16), -20);
    }
    t6 = far_eb007((unsigned char far *)B_901B, *(long *)((char *)&W_947A + 0), loc_c);
    dx = *(int *)((char *)&loc_c + 0);
    dx2 = dx - *(int *)((char *)&loc_8 + 0);
    W_9474 = (int)(((long)*(int *)((char *)&loc_c + 2) << 16 | (unsigned)dx) - loc_8 >> 16);
    W_9472 = dx2;
    if (B_946B != B_9469) {
        t7 = far_e51be((unsigned char far *)B_901B, B_9469);
    }
    t8 = far_dfdf5((unsigned char far *)B_901B, W_9476);
    if ((int)t8 != 0) {
        return (long)MK_FP((int)(t8 >> 16), -20);
    }
    t9 = far_eb007((unsigned char far *)B_901B, *(long *)((char *)&W_9476 + 0), &loc_4);
    dx3 = W_903D;
    dx4 = dx3 - *(int *)((char *)&loc_4 + 0);
    W_9441 = (int)(((long)W_903F << 16 | (unsigned)dx3) - loc_4 >> 16);
    W_943F = dx4;
    ax = W_9466;
    t10 = far_fa0c8(W_9472, ax, -(ax < 0));
    flags = (int)(t10 >> 16) - W_9441;
    if (!CC("<", flags) && (CC(">", flags) || (unsigned int)(int)t10 > W_943F)) {
        return (long)MK_FP((int)(t10 >> 16), -3);
    }
    t11 = far_e0031(B_901B);
    return ((long)UNDEF << 16 | (unsigned)0);
}
