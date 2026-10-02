/* differs: 308 at +5, 253 bytes; 311 at +5, 253 bytes; 312 at +5, 253 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8E;
extern char far *FP_7B8F;
extern int W_7B91;
extern int far far_b1ae0(int);
extern int far far_b1b2b(char far *, char far *);
extern long far far_e201c(int, char far *);

long far far_b38d8(char far *arg_0, int arg_2)
{
    char loc_5[5];
    char loc_6;
    char loc_22[28];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    int es2;
    int si;
    int t1;
    int t2;

    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_5), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6));
    dx = *(int *)((char *)&FP_7B8F + 0);
    *(int *)((char *)&loc_5 + 3) = W_7B91;
    *(int *)((char *)&loc_5 + 1) = dx;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)10;
    bx = (int)*(long *)((char *)&loc_5 + 1);
    es = (int)(*(long *)((char *)&loc_5 + 1) >> 16);
    *(char far *)MK_FP(es, bx + 1) = loc_5[0];
    *(char far *)MK_FP(es, bx + 2) = loc_6;
    *(char far *)MK_FP(es, bx + 3) = (char)8;
    *(char far *)MK_FP(es, bx + 4) = (char)21;
    ax2 = arg_2;
    dx2 = *(int *)((char *)&arg_0 + 0);
    *(int far *)MK_FP(es, bx + 7) = ax2;
    *(int far *)MK_FP(es, bx + 5) = dx2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, *(int *)((char *)&loc_5 + 1)));
    *(char far *)MK_FP(es, bx + 9) = (char)ax3;
    *(int *)((char *)&FP_7B8F + 0) = *(int *)((char *)&FP_7B8F + 0) + (char)ax3;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)0;
    dx3 = (int)(far_e201c((unsigned char)*arg_0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22)) >> 16);
    *(int *)((char *)&loc_22 + 26) = SEG_STACK;
    *(int *)((char *)&loc_22 + 24) = (int)(unsigned)loc_22;
    si = 0;
    do {
        es2 = (int)(*(long *)((char *)&loc_22 + 24) >> 16);
        if (*(char far *)MK_FP(es2, (int)*(long *)((char *)&loc_22 + 24)) != 0) {
            bx2 = *(int *)((char *)&loc_22 + 24);
            *(int *)((char *)&loc_22 + 24) = *(int *)((char *)&loc_22 + 24) + 1;
            t1 = far_b1ae0(*(char far *)MK_FP(es2, bx2));
            ax4 = t1;
            dx4 = UNDEF;
        } else {
            t2 = far_b1ae0(32);
            ax4 = t2;
            dx4 = UNDEF;
        }
        si = si + 1;
    } while (si < 21);
    B_7B8E = (char)0;
    return ((long)dx4 << 16 | (unsigned)ax4);
}
