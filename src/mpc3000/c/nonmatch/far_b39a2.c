/* differs: 308 at +5, 227 bytes; 311 at +5, 227 bytes; 312 at +5, 227 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8E;
extern char far *FP_7B8F;
extern int W_7B91;
extern int W_9563;
extern int far far_b1b05();
extern int far far_b1b2b();
extern void far far_b2b15();

long far far_b39a2(int arg_0, int arg_2, long arg_4, int arg_6)
{
    char loc_5[5];
    char loc_6;
    char loc_10[10];
    int loc_12;
    int loc_14;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int t1;
    int t2;

    far_b1b05(*(long *)((char *)&arg_0 + 0));
    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_5), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6));
    dx = *(int *)((char *)&FP_7B8F + 0);
    *(int *)((char *)&loc_5 + 3) = W_7B91;
    *(int *)((char *)&loc_5 + 1) = dx;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)10;
    bx = (int)*(long *)((char *)&loc_5 + 1);
    es = (int)(*(long *)((char *)&loc_5 + 1) >> 16);
    *(char far *)MK_FP(es, bx + 1) = loc_5[0];
    *(char far *)MK_FP(es, bx + 2) = loc_6;
    *(char far *)MK_FP(es, bx + 3) = (char)5;
    *(char far *)MK_FP(es, bx + 4) = (char)9;
    ax3 = arg_6;
    dx2 = *(int *)((char *)&arg_4 + 0);
    *(int far *)MK_FP(es, bx + 7) = ax3;
    *(int far *)MK_FP(es, bx + 5) = dx2;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, *(int *)((char *)&loc_5 + 1)));
    *(char far *)MK_FP(es, bx + 9) = (char)ax4;
    *(int *)((char *)&FP_7B8F + 0) = *(int *)((char *)&FP_7B8F + 0) + (char)ax4;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)0;
    bx2 = (int)arg_4;
    es2 = (int)(arg_4 >> 16);
    dx3 = *(int far *)MK_FP(es2, bx2);
    loc_12 = *(int far *)MK_FP(es2, bx2 + 2) + W_9563;
    loc_14 = dx3;
    far_b2b15(((long)loc_12 << 16 | (unsigned)dx3), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_10));
    t2 = far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_10));
    B_7B8E = (char)0;
    return ((long)UNDEF << 16 | (unsigned)t2);
}
