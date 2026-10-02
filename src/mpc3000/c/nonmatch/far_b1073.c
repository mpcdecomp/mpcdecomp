/* differs: 308 at +5, 686 bytes; 311 at +5, 685 bytes; 312 at +5, 686 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8B;
extern char B_7B8C;
extern char B_D4B4;
extern char far *FP_7B55;
extern char far *FP_7B8F;
extern unsigned char TBL_b11f2[];
extern int W_7B91;
extern int W_9563;
extern long far far_b2739();
extern long far far_b2acb();
extern long far far_b2da1();
extern long far far_b32ec();
extern long far far_b342e();
extern long far far_e201c();
extern long far fn_b0605();
extern long far fn_b07b6();
long far fn_b0605(int p0) { return 0; }
long far fn_b07b6(void) { return 0; }

long far far_b1073(char arg_0)
{
    char loc_26[38];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    unsigned int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    int si;
    long t1;
    long t10;
    long t11;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = fn_b0605(arg_0);
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    if (*(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) != 0) {
        ax2 = W_7B91;
        dx2 = *(int *)((char *)&FP_7B8F + 0);
        *(int *)((char *)&loc_26 + 36) = ax2;
        *(int *)((char *)&loc_26 + 34) = dx2;
        *(int *)((char *)&loc_26 + 32) = ax2;
        *(int *)((char *)&loc_26 + 30) = dx2;
        dx = (int)(fn_b07b6() >> 16);
        ax = B_7B8C & 15;
        bx = ax;
        if (bx <= 9) {
            switch ((unsigned int)(unsigned)(TBL_b11f2 + (bx << 1))) {
            case 0:
                t11 = far_b32ec((int)far_b342e());
                ax = (int)t11;
                dx = (int)(t11 >> 16);
                break;
            case 1:
                t10 = far_b2739(*(long *)((char *)&FP_7B55 + 0));
                ax = (int)t10;
                dx = (int)(t10 >> 16);
                break;
            case 2:
                es7 = (int)(*(long *)((char *)&loc_26 + 30) >> 16);
                bx7 = (int)*(long far *)MK_FP(es7, (int)*(long *)((char *)&loc_26 + 30) + 5);
                es8 = (int)(*(long *)((char *)&loc_26 + 30) >> 16);
                bx8 = (int)*(long far *)MK_FP(es8, (int)*(long *)((char *)&loc_26 + 30) + 9);
                es9 = (int)(*(long far *)MK_FP(es8, bx8 + 9) >> 16);
                bx9 = bx8 + ((unsigned char)*(char far *)MK_FP((int)(*(long far *)MK_FP(es7, bx7 + 5) >> 16), bx7) << 2);
                t9 = far_b2739(*(long far *)MK_FP(es9, bx9));
                ax = (int)t9;
                dx = (int)(t9 >> 16);
                break;
            case 3:
                B_7B8B = (char)9;
                t7 = far_b2da1((unsigned char)*(char far *)((char far *)*(long *)((char *)&FP_7B55 + 0)));
                t8 = far_b2739(t7);
                ax = (int)t8;
                dx = (int)(t8 >> 16);
                break;
            case 4:
            case 7:
                break;
            case 5:
                bx6 = (int)*(long *)((char *)&FP_7B55 + 0);
                es6 = (int)(*(long *)((char *)&FP_7B55 + 0) >> 16);
                dx3 = *(int far *)MK_FP(es6, bx6);
                ax4 = *(int far *)MK_FP(es6, bx6 + 2) + W_9563;
                *(int *)((char *)&loc_26 + 28) = ax4;
                *(int *)((char *)&loc_26 + 26) = dx3;
                t6 = far_b2acb(((long)ax4 << 16 | (unsigned)dx3));
                ax = (int)t6;
                dx = (int)(t6 >> 16);
                break;
            case 6:
                if ((1 << (unsigned char)*(char far *)((char far *)*(long *)((char *)&loc_26 + 34) + 13) & (unsigned char)*(char far *)((char far *)*(long *)((char *)&FP_7B55 + 0))) != 0) {
                    ax3 = 1;
                } else {
                    ax3 = 0;
                }
                *(int *)((char *)&loc_26 + 24) = ax3;
                es4 = (int)(*(long *)((char *)&loc_26 + 34) >> 16);
                bx4 = (int)*(long far *)MK_FP(es4, (int)*(long *)((char *)&loc_26 + 34) + 9);
                es5 = (int)(*(long far *)MK_FP(es4, bx4 + 9) >> 16);
                bx5 = bx4 + (ax3 << 2);
                t5 = far_b2739(*(long far *)MK_FP(es5, bx5));
                ax = (int)t5;
                dx = (int)(t5 >> 16);
                break;
            case 8:
                B_7B8B = (char)21;
                t3 = far_e201c((unsigned char)*(char far *)((char far *)*(long *)((char *)&FP_7B55 + 0)), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_26));
                t4 = far_b2739((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_26));
                ax = (int)t4;
                dx = (int)(t4 >> 16);
                break;
            case 9:
                es = (int)(*(long *)((char *)&loc_26 + 30) >> 16);
                bx2 = (int)*(long far *)MK_FP(es, (int)*(long *)((char *)&loc_26 + 30) + 9);
                es2 = (int)(*(long far *)MK_FP(es, bx2 + 9) >> 16);
                es3 = (int)(*(long *)((char *)&loc_26 + 30) >> 16);
                si = (int)*(long far *)MK_FP(es3, (int)*(long *)((char *)&loc_26 + 30) + 11);
                bx3 = bx2 + (*(int far *)MK_FP((int)(*(long far *)MK_FP(es3, si + 11) >> 16), si) << 2);
                t2 = far_b2739(*(long far *)MK_FP(es2, bx3));
                ax = (int)t2;
                dx = (int)(t2 >> 16);
                break;
            }
        }
        B_D4B4 = (char)1;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
