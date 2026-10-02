/* differs: 308 at +0, 239 bytes; 311 at +0, 241 bytes; 312 at +0, 241 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_880A;
extern char B_901B;
extern char B_A570;
extern char B_A574;
extern char TBL_F779;
extern int TBL_F77A;
extern int W_8812;
extern int W_8814;
extern long far far_d97ca(int, char far *, int);
extern long far far_d9b6e(int, char far *, int);
extern long far far_dad54(int);
extern int far far_db034(void);
extern long far far_dca3e(void);

int far far_de95a(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int di;
    int p4;
    long t1;
    long t2;
    long t3;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_901B);
    ax3 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax | B_A570));
    if ((char)ax3 != 0) {
        goto L1;
    }
    if ((B_880A & 1) != 0) {
        goto L2;
    }
    if (B_A574 == 0) {
        goto L3;
    }
    ax3 = far_db034();
L3:
    goto L1;
L2:
    di = W_8814;
    W_8814 = W_8812;
    t1 = far_dca3e();
L4:
    ax3 = (int)far_d97ca(4, (char far *)&TBL_F779, 0x640);
    if (ax3 == 0) {
        goto L5;
    }
    p4 = ax3;
    if (TBL_F779 != -120) {
        goto L6;
    }
    ax4 = TBL_F77A;
    ax5 = ((unsigned int)((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 << 1)) >> 1) + W_8814;
    W_8814 = 0;
    ax6 = ax5 << 1;
    TBL_F77A = ((char)(ax6 >> 8) << 8 | (unsigned char)((unsigned int)(char)ax6 >> 1));
    goto L7;
L6:
    t2 = far_dad54(1);
L7:
    t3 = far_d9b6e(1, (char far *)&TBL_F779, p4);
    goto L4;
L5:
    W_8814 = W_8814 + di;
L1:
    B_A574 = (char)0;
    B_880A = (char)0;
    return ax3;
}
