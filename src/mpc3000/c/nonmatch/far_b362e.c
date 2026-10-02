/* differs: 308 at +5, 329 bytes; 311 at +5, 329 bytes; 312 at +5, 329 bytes */
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

long far far_b362e(int arg_0, int arg_2, char far *arg_4, int arg_6, long arg_8, int arg_10, char arg_12)
{
    char loc_a[10];
    char loc_b;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    int bx3;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    int es2;
    int es3;
    int t1;
    int t2;

    far_b1b05(*(long *)((char *)&arg_0 + 0));
    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_b));
    dx = *(int *)((char *)&FP_7B8F + 0);
    *(int *)((char *)&loc_a + 8) = W_7B91;
    *(int *)((char *)&loc_a + 6) = dx;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)14;
    bx = (int)*(long *)((char *)&loc_a + 6);
    es = (int)(*(long *)((char *)&loc_a + 6) >> 16);
    *(char far *)MK_FP(es, bx + 1) = loc_a[0];
    *(char far *)MK_FP(es, bx + 2) = loc_b;
    *(char far *)MK_FP(es, bx + 3) = (char)2;
    *(char far *)MK_FP(es, bx + 4) = arg_12;
    dx2 = *(int *)((char *)&arg_4 + 0);
    *(int far *)MK_FP(es, bx + 7) = arg_6;
    *(int far *)MK_FP(es, bx + 5) = dx2;
    ax3 = arg_10;
    dx3 = *(int *)((char *)&arg_8 + 0);
    *(int far *)MK_FP(es, bx + 11) = ax3;
    *(int far *)MK_FP(es, bx + 9) = dx3;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, *(int *)((char *)&loc_a + 6)));
    *(char far *)MK_FP(es, bx + 13) = (char)ax4;
    *(int *)((char *)&FP_7B8F + 0) = *(int *)((char *)&FP_7B8F + 0) + (char)ax4;
    *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) = (char)0;
    es2 = (int)(arg_8 >> 16);
    bx2 = (int)arg_8 + ((unsigned char)*arg_4 << 2);
    ax5 = *(int far *)MK_FP(es2, bx2 + 2);
    dx4 = *(int far *)MK_FP(es2, bx2);
    *(int *)((char *)&loc_a + 4) = ax5;
    *(int *)((char *)&loc_a + 2) = dx4;
    loc_a[1] = (char)0;
    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)loc_a[1]);
    if ((char)ax6 < arg_12) {
        do {
            es3 = (int)(*(long *)((char *)&loc_a + 2) >> 16);
            if (*(char far *)MK_FP(es3, (int)*(long *)((char *)&loc_a + 2)) != 0) {
                bx3 = *(int *)((char *)&loc_a + 2);
                *(int *)((char *)&loc_a + 2) = *(int *)((char *)&loc_a + 2) + 1;
                t1 = far_b1ae0(*(char far *)MK_FP(es3, bx3));
                ax7 = t1;
                dx4 = UNDEF;
            } else {
                t2 = far_b1ae0(32);
                ax7 = t2;
                dx4 = UNDEF;
            }
            loc_a[1] = (char)(loc_a[1] + 1);
            ax6 = ((char)(ax7 >> 8) << 8 | (unsigned char)loc_a[1]);
        } while ((char)ax6 < arg_12);
    }
    B_7B8E = (char)0;
    return ((long)dx4 << 16 | (unsigned)ax6);
}
