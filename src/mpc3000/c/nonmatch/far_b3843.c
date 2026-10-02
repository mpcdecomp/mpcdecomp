/* differs: 308 at +5, 168 bytes; 311 at +5, 168 bytes; 312 at +5, 168 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
struct g_FP_7B8F {
    long f_0;
};
extern char B_7B8E;
extern struct g_FP_7B8F FP_7B8F;
extern int W_7B91;
extern int far far_b1b05(long);
extern int far far_b1b2b(char far *, char far *);
extern long far far_b2da1(int);

void far far_b3843(char far *arg_0, int arg_2)
{
    char loc_6;
    char loc_5;
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int dx;
    int dx2;
    int es;
    long t1;

    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6));
    dx = *(int *)((char *)&FP_7B8F + 0);
    loc_2 = W_7B91;
    *(int *)((char *)&loc_4 + 0) = dx;
    *(char far *)((char far *)FP_7B8F.f_0) = (char)10;
    bx = (int)loc_4;
    es = (int)(loc_4 >> 16);
    *(char far *)MK_FP(es, bx + 1) = loc_5;
    *(char far *)MK_FP(es, bx + 2) = loc_6;
    *(char far *)MK_FP(es, bx + 3) = (char)3;
    *(char far *)MK_FP(es, bx + 4) = (char)9;
    ax2 = arg_2;
    dx2 = *(int *)((char *)&arg_0 + 0);
    *(int far *)MK_FP(es, bx + 7) = ax2;
    *(int far *)MK_FP(es, bx + 5) = dx2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, *(int *)((char *)&loc_4 + 0)));
    *(char far *)MK_FP(es, bx + 9) = (char)ax3;
    *(int *)((char *)&FP_7B8F + 0) = *(int *)((char *)&FP_7B8F + 0) + (char)ax3;
    *(char far *)((char far *)FP_7B8F.f_0) = (char)0;
    t1 = far_b2da1(*arg_0);
    far_b1b05(t1);
    B_7B8E = (char)0;
    return;
}
