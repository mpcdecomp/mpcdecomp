/* differs: 308 at +5, 444 bytes; 311 at +5, 446 bytes; 312 at +5, 445 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern char B_8807;
extern unsigned char B_8808;
extern char B_8809;
extern unsigned char B_901B[];
extern int TBL_882A;
extern int TBL_882C;
extern int W_880C;
extern int W_880E;
extern int W_8810;
extern int W_8814;
extern unsigned char W_D5F5[];
extern unsigned char W_D5F9[];
extern unsigned int W_D631;
extern int W_D633;
extern int W_D657;
extern int far far_db0a2(long);

void far far_e39e4(long arg_0, int arg_2)
{
    long loc_8;
    int loc_6;
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    unsigned int ax4;
    unsigned int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int dx;
    int dx2;
    int es;
    int es2;
    int es3;
    int es4;
    int flags;

    if (arg_2 == SEG_DATA) {
        if (*(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
            ax = ((char)(SEG_DATA >> 8) << 8 | (unsigned char)B_8809);
            W_880E = W_880E + 1;
            if ((int)(unsigned char)(char)ax <= W_880E) {
                W_880E = 0;
            }
            ax2 = B_8808;
            W_8810 = W_8810 + 1;
            if (ax2 <= W_8810) {
                W_8810 = 0;
            }
            if (W_8810 == 0 || W_8810 == W_880C) {
                ax3 = 1;
            } else {
                ax3 = 0;
            }
            B_8807 = (char)ax3;
            W_8814 = W_8814 + 1;
            loc_6 = SEG_DATA;
            *(int *)((char *)&loc_8 + 0) = (int)(unsigned)W_D5F5;
            loc_2 = SEG_DATA;
            *(int *)((char *)&loc_4 + 0) = (int)(unsigned)W_D5F9;
            ax4 = W_D657;
            bx = (int)loc_8;
            es = (int)(loc_8 >> 16);
            *(int far *)MK_FP(es, bx) = *(int far *)MK_FP(es, bx) + ax4;
            ax5 = *(int far *)MK_FP(es, bx);
            *(int far *)MK_FP(es, bx + 2) = (int)(*(long far *)MK_FP(es, bx) + (unsigned long)(unsigned int)ax4 >> 16);
            dx = *(int far *)MK_FP(es, bx + 2);
            flags = dx - W_D633;
            if (!CC("<", flags) && (CC("!=", flags) || ax5 >= W_D631)) {
                bx2 = (int)loc_4;
                es2 = (int)(loc_4 >> 16);
                *(int far *)MK_FP(es2, bx2) = *(int far *)MK_FP(es2, bx2) + 1;
                *(int far *)MK_FP(es2, bx2 + 2) = (int)(*(long far *)MK_FP(es2, bx2) + 1L >> 16);
                bx3 = (int)loc_8;
                es3 = (int)(loc_8 >> 16);
                ax6 = W_D633;
                dx2 = W_D631;
                *(int far *)MK_FP(es3, bx3) = *(int far *)MK_FP(es3, bx3) - dx2;
                *(int far *)MK_FP(es3, bx3 + 2) = (int)(*(long far *)MK_FP(es3, bx3) - ((long)ax6 << 16 | (unsigned)dx2) >> 16);
            }
            if ((TBL_882A | TBL_882C) != 0) {
                TBL_882A = TBL_882A - 1;
                TBL_882C = TBL_882C - (TBL_882A == 0);
            }
        }
    }
    bx4 = (int)arg_0;
    es4 = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es4, bx4 + 38) = *(int far *)MK_FP(es4, bx4 + 38) + 1;
    *(int far *)MK_FP(es4, bx4 + 40) = (int)(*(long far *)MK_FP(es4, bx4 + 38) + 1L >> 16);
    *(int far *)MK_FP(es4, bx4 + 42) = *(int far *)MK_FP(es4, bx4 + 42) + 1;
    *(int far *)MK_FP(es4, bx4 + 44) = (int)(*(long far *)MK_FP(es4, bx4 + 42) + 1L >> 16);
    far_db0a2(((long)arg_2 << 16 | (unsigned)bx4));
    return;
}
