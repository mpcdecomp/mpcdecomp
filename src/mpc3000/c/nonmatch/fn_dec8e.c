/* differs: 308 at +5, 654 bytes; 311 at +5, 653 bytes; 312 at +5, 654 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8807;
extern unsigned char B_8808;
extern unsigned char B_8809;
extern unsigned char B_901B[];
extern unsigned char B_F77C;
extern unsigned char B_F77D;
extern int TBL_882A;
extern int TBL_882C;
extern unsigned char TBL_F779;
extern int W_880C;
extern int W_880E;
extern int W_8810;
extern int W_8814;
extern int W_902D;
extern int W_902F;
extern unsigned char W_D5F5[];
extern unsigned char W_D5F9[];
extern int W_D631;
extern int W_D633;
extern int W_D657;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_e570d(int, int);
extern long far far_e723d(unsigned char far *, int, int);

void far fn_dec8e(long arg_0, int arg_2)
{
    int loc_2;
    long loc_4;
    int loc_6;
    long loc_8;
    int loc_a;
    int loc_c;
    int ax;
    int ax2;
    unsigned int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    long t1;
    long t2;
    long t3;

    ax = SEG_DATA;
    if (arg_2 == ax) {
        if (*(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
            W_880E = W_880E - 1;
            if (W_880E - 1 < 0) {
                W_880E = B_8809 - 1;
            }
            W_8810 = W_8810 - 1;
            if (W_8810 - 1 < 0) {
                W_8810 = B_8808 - 1;
            }
            if (W_8810 != 0 && W_8810 != W_880C) {
                ax2 = 0;
            } else {
                ax2 = 1;
            }
            B_8807 = (char)ax2;
            W_8814 = W_8814 - 1;
            loc_6 = SEG_DATA;
            *(int *)((char *)&loc_8 + 0) = (int)(unsigned)W_D5F5;
            loc_2 = SEG_DATA;
            *(int *)((char *)&loc_4 + 0) = (int)(unsigned)W_D5F9;
            ax3 = W_D657;
            bx = (int)loc_8;
            es = (int)(loc_8 >> 16);
            *(int far *)MK_FP(es, bx) = *(int far *)MK_FP(es, bx) - ax3;
            ax = *(int far *)MK_FP(es, bx);
            *(int far *)MK_FP(es, bx + 2) = (int)(*(long far *)MK_FP(es, bx) - (unsigned long)(unsigned int)ax3 >> 16);
            dx = *(int far *)MK_FP(es, bx + 2);
            if (dx <= 0 && (dx < 0 || 0)) {
                bx2 = (int)loc_4;
                es2 = (int)(loc_4 >> 16);
                *(int far *)MK_FP(es2, bx2) = *(int far *)MK_FP(es2, bx2) - 1;
                *(int far *)MK_FP(es2, bx2 + 2) = *(int far *)MK_FP(es2, bx2 + 2) - (*(int far *)MK_FP(es2, bx2) == 0);
                bx3 = (int)loc_8;
                es3 = (int)(loc_8 >> 16);
                ax = W_D633;
                dx2 = W_D631;
                *(int far *)MK_FP(es3, bx3) = *(int far *)MK_FP(es3, bx3) + dx2;
                *(int far *)MK_FP(es3, bx3 + 2) = (int)(*(long far *)MK_FP(es3, bx3) + ((long)ax << 16 | (unsigned)dx2) >> 16);
            }
            TBL_882C = 0;
            TBL_882A = 0;
        }
    }
    bx4 = (int)arg_0;
    es4 = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es4, bx4 + 38) = *(int far *)MK_FP(es4, bx4 + 38) - 1;
    *(int far *)MK_FP(es4, bx4 + 40) = *(int far *)MK_FP(es4, bx4 + 40) - (*(int far *)MK_FP(es4, bx4 + 38) == 0);
    *(int far *)MK_FP(es4, bx4 + 42) = *(int far *)MK_FP(es4, bx4 + 42) - 1;
    *(int far *)MK_FP(es4, bx4 + 44) = *(int far *)MK_FP(es4, bx4 + 44) - (*(int far *)MK_FP(es4, bx4 + 42) == 0);
    *(int far *)MK_FP(es4, bx4 + 58) = *(int far *)MK_FP(es4, bx4 + 58) + 1;
    *(int far *)MK_FP(es4, bx4 + 52) = *(int far *)MK_FP(es4, bx4 + 52) - 1;
    ax4 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es4, bx4 + 54));
    *(char far *)MK_FP(es4, bx4 + 54) = (char)(*(char far *)MK_FP(es4, bx4 + 54) - 1);
    if ((char)ax4 == 0) {
        if (*(char far *)MK_FP(es4, bx4 + 55) == 1 && (*(char far *)MK_FP(es4, bx4 + 1) & 2) != 0) {
            t1 = far_e570d(0, *(int far *)MK_FP(es4, bx4 + 56) - 1);
            dx3 = W_902D;
            loc_a = W_902F;
            loc_c = dx3;
            W_902F = (int)(t1 >> 16);
            W_902D = (int)t1;
            t2 = far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
            if ((TBL_F779 & 248) == 168) {
                t3 = far_e723d((unsigned char far *)B_901B, B_F77C, B_F77D);
            }
            ax4 = loc_a;
            W_902F = ax4;
            W_902D = loc_c;
        }
        bx5 = (int)arg_0;
        es5 = (int)(arg_0 >> 16);
        ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es5, bx5 + 64));
        ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)((char)ax5 - 1));
        *(char far *)MK_FP(es5, bx5 + 54) = (char)ax6;
        ax7 = ((char)(ax6 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es5, bx5 + 55));
        *(char far *)MK_FP(es5, bx5 + 55) = (char)((char)ax7 - 1);
        if ((char)ax7 == 1) {
            *(char far *)MK_FP(es5, bx5 + 55) = *(char far *)MK_FP(es5, bx5 + 60);
            *(int far *)MK_FP(es5, bx5 + 52) = *(int far *)MK_FP(es5, bx5 + 62) - 1;
            *(int far *)MK_FP(es5, bx5 + 56) = *(int far *)MK_FP(es5, bx5 + 56) - 1;
        }
    }
    return;
}
