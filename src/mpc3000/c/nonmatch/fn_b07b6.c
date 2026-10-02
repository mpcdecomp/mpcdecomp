/* differs: 308 at +6, 202 bytes; 311 at +6, 205 bytes; 312 at +6, 205 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_7B54;
extern char B_7B5D;
extern char B_7B87;
extern char B_7B88;
extern char B_7B89;
extern char B_7B8A;
extern char B_7B8B;
extern char B_7B8C;
extern int FP_7B55;
extern int FP_7B8F;
extern char TBL_7B5E;
extern int W_7B57;
extern int W_7B91;
extern int far far_b1ad0(int, int);

long far fn_b07b6(void)
{
    long loc_4;
    int loc_2;
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
    int es;
    int es2;

    ax = W_7B91;
    dx = FP_7B8F;
    loc_2 = ax;
    *(int *)((char *)&loc_4 + 0) = dx;
    bx = (int)loc_4;
    es = (int)(loc_4 >> 16);
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 4));
    B_7B8B = (char)ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 2));
    B_7B89 = (char)ax3;
    ax4 = ((char)-((char)ax3 < 0) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 1));
    B_7B8A = (char)ax4;
    far_b1ad0((char)ax4, (char)ax3);
    bx2 = (int)loc_4;
    es2 = (int)(loc_4 >> 16);
    dx2 = *(int far *)MK_FP(es2, bx2 + 5);
    W_7B57 = *(int far *)MK_FP(es2, bx2 + 7);
    FP_7B55 = dx2;
    B_7B87 = (char)0;
    TBL_7B5E = (char)0;
    B_7B5D = (char)0;
    B_7B88 = (char)1;
    bx3 = *(int *)((char *)&loc_4 + 0);
    ax6 = (unsigned char)*(char far *)MK_FP(es2, bx3 + 13);
    B_7B54 = (char)ax6;
    ax7 = ((char)(ax6 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx3 + 3));
    B_7B8C = (char)ax7;
    return ((long)dx2 << 16 | (unsigned)ax7);
}
