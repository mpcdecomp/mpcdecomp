/* differs: 308 at +5, 309 bytes; 311 at +5, 310 bytes; 312 at +5, 310 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
};
extern char B_7B8E;
extern char far *FP_7B8F;
extern int W_7B91;
extern int W_9563;
extern int far far_b1b05();
extern int far far_b1b2b();
extern long far far_b3b12();

long far far_b3723(int arg_0, int arg_2, struct s1 far *arg_4, int arg_6, int arg_8, int arg_10, int arg_12, int arg_14, long arg_16, int arg_18)
{
    char loc_5[5];
    char loc_6;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    long t1;

    far_b1b05(*(long *)((char *)&arg_0 + 0));
    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_5), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6));
    dx = *(int *)((char *)&FP_7B8F + 0);
    *(int *)((char *)&loc_5 + 3) = W_7B91;
    *(int *)((char *)&loc_5 + 1) = dx;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)19;
    bx = (int)*(long *)((char *)&loc_5 + 1);
    es = (int)(*(long *)((char *)&loc_5 + 1) >> 16);
    *(char far *)MK_FP(es, bx + 1) = loc_5[0];
    *(char far *)MK_FP(es, bx + 2) = loc_6;
    *(char far *)MK_FP(es, bx + 3) = (char)0;
    *(char far *)MK_FP(es, bx + 4) = *(char *)((char *)&arg_8 + 0);
    dx2 = *(int *)((char *)&arg_4 + 0);
    *(int far *)MK_FP(es, bx + 7) = arg_6;
    *(int far *)MK_FP(es, bx + 5) = dx2;
    *(int far *)MK_FP(es, bx + 9) = arg_10;
    *(int far *)MK_FP(es, bx + 11) = arg_12;
    ax3 = arg_18;
    dx3 = *(int *)((char *)&arg_16 + 0);
    *(int far *)MK_FP(es, bx + 16) = ax3;
    *(int far *)MK_FP(es, bx + 14) = dx3;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_14 + 0));
    *(char far *)MK_FP(es, bx + 13) = (char)ax4;
    ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, *(int *)((char *)&loc_5 + 1)));
    *(char far *)MK_FP(es, bx + 18) = (char)ax5;
    *(int *)((char *)&FP_7B8F + 0) = *(int *)((char *)&FP_7B8F + 0) + (char)ax5;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)0;
    if ((*(char *)((char *)&arg_14 + 0) & 8) != 0) {
        dx4 = (unsigned char)*(char far *)((char far *)arg_4);
    } else {
        dx4 = arg_4->f_0;
    }
    ax6 = *(int *)((char *)&arg_16 + 0) | arg_18;
    if (ax6 != 0) {
        ax6 = (int)(*(long (far *)())arg_16)((unsigned long)(unsigned int)dx4);
        dx4 = ax6;
    }
    if ((*(char *)((char *)&arg_14 + 0) & 1) != 0) {
        dx4 = dx4 + W_9563;
    }
    ax7 = ((char)(ax6 >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_14 + 0));
    t1 = far_b3b12(dx4, *(char *)((char *)&arg_8 + 0), (char)((char)ax7 & -9));
    B_7B8E = (char)0;
    return t1;
}
long far far_b3b12(int p0, char p1, char p2) { return 0; }
