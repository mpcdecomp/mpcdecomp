/* differs: 308 at +3, 451 bytes; 311 at +3, 451 bytes; 312 at +3, 450 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[2];
    char f_2;
    char f_3;
    char f_4;
    char f_5;
    char f_6;
};
extern char TBL_828A[];
extern char TBL_82EE[];
extern char TBL_8352[];

long far fn_b98d8(int arg_0, struct s1 far *arg_2)
{
    int ax;
    int ax10;
    int ax11;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    int es2;
    int si;

    si = arg_0;
    bx = FP_OFF(arg_2);
    es = FP_SEG(arg_2);
    if (*(char far *)MK_FP(es, bx) != 0) {
        ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 2));
        ax3 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax << 4));
        dx = ((char)(dx2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
        dx3 = ((char)(dx >> 8) << 8 | (unsigned char)((char)dx + (char)ax3));
        dx2 = ((char)(dx3 >> 8) << 8 | (unsigned char)((char)dx3 - 1));
        TBL_82EE[si] = (char)dx2;
    } else {
        ax4 = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_2->f_2);
        ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 << 4));
        ax3 = ((char)(ax5 >> 8) << 8 | (unsigned char)((char)ax5 + 64));
        TBL_82EE[si] = (char)ax3;
    }
    bx2 = FP_OFF(arg_2);
    es2 = FP_SEG(arg_2);
    if (*(char far *)MK_FP(es2, bx2 + 1) != 0) {
        ax6 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx2 + 1));
        dx4 = ((char)(dx2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx2 + 3));
        dx2 = ((char)(dx4 >> 8) << 8 | (unsigned char)((char)dx4 << 4));
        ax7 = ((char)(ax6 >> 8) << 8 | (unsigned char)((char)ax6 + (char)dx2));
        ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)((char)ax7 - 1));
        TBL_8352[si] = (char)ax8;
    } else {
        ax9 = ((char)(ax3 >> 8) << 8 | (unsigned char)arg_2->f_3);
        ax10 = ((char)(ax9 >> 8) << 8 | (unsigned char)((char)ax9 << 4));
        ax8 = ((char)(ax10 >> 8) << 8 | (unsigned char)((char)ax10 + 64));
        TBL_8352[si] = (char)ax8;
    }
    if (arg_2->f_5 == 0) {
        TBL_82EE[si] = (char)(TBL_82EE[si] | -128);
    }
    if (arg_2->f_4 != 0) {
        TBL_8352[si] = (char)(TBL_8352[si] | -128);
    }
    ax11 = ((char)(ax8 >> 8) << 8 | (unsigned char)arg_2->f_6);
    TBL_828A[si] = (char)ax11;
    return ((long)dx2 << 16 | (unsigned)ax11);
}
