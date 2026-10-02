/* differs: 308 at +5, 279 bytes; 311 at +5, 279 bytes; 312 at +5, 279 bytes */
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
extern int far far_b1b05(long);
extern int far far_b1b2b(char far *, char far *);

long far far_b3471(int arg_0, int arg_2, long arg_4, int arg_6, char arg_8)
{
    char loc_6[6];
    char loc_7;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int es;
    int es2;
    int t1;
    int t2;

    far_b1b05(*(long *)((char *)&arg_0 + 0));
    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_7));
    dx = *(int *)((char *)&FP_7B8F + 0);
    *(int *)((char *)&loc_6 + 4) = W_7B91;
    *(int *)((char *)&loc_6 + 2) = dx;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)10;
    bx = (int)*(long *)((char *)&loc_6 + 2);
    es = (int)(*(long *)((char *)&loc_6 + 2) >> 16);
    *(char far *)MK_FP(es, bx + 1) = loc_6[0];
    *(char far *)MK_FP(es, bx + 2) = loc_7;
    *(char far *)MK_FP(es, bx + 3) = (char)1;
    *(char far *)MK_FP(es, bx + 4) = arg_8;
    ax3 = arg_6;
    dx2 = *(int *)((char *)&arg_4 + 0);
    *(int far *)MK_FP(es, bx + 7) = ax3;
    *(int far *)MK_FP(es, bx + 5) = dx2;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, *(int *)((char *)&loc_6 + 2)));
    *(char far *)MK_FP(es, bx + 9) = (char)ax4;
    *(int *)((char *)&FP_7B8F + 0) = *(int *)((char *)&FP_7B8F + 0) + (char)ax4;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)0;
    loc_6[1] = (char)0;
    ax5 = ((char)-((char)ax4 < 0) << 8 | (unsigned char)loc_6[1]);
    if ((char)ax5 < arg_8) {
        do {
            es2 = (int)(arg_4 >> 16);
            if (*(char far *)MK_FP(es2, (int)arg_4) != 0) {
                bx2 = *(int *)((char *)&arg_4 + 0);
                *(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) + 1;
                t1 = far_b1ae0(*(char far *)MK_FP(es2, bx2));
                ax6 = t1;
                dx2 = UNDEF;
            } else {
                t2 = far_b1ae0(32);
                ax6 = t2;
                dx2 = UNDEF;
            }
            loc_6[1] = (char)(loc_6[1] + 1);
            ax5 = ((char)(ax6 >> 8) << 8 | (unsigned char)loc_6[1]);
        } while ((char)ax5 < arg_8);
    }
    B_7B8E = (char)0;
    return ((long)dx2 << 16 | (unsigned)ax5);
}
