/* differs: 308 at +0, 294 bytes; 311 at +0, 291 bytes; 312 at +0, 292 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_83D0;
extern char B_8804;
extern char B_8805;
extern unsigned char B_901B[];
extern char B_9482;
extern char B_955F;
extern char B_9560;
extern char B_9562;
extern char B_977C;
extern char B_977D;
extern char B_9781;
extern char B_A5C9;
extern char B_A5CE;
extern char B_CEC0;
extern char B_D4B5;
extern char B_D4C0;
extern char B_E54C;
extern unsigned char TBL_9483[];
extern unsigned char TBL_94C3[];
extern unsigned char TBL_9503[];
extern unsigned char TBL_9787[];
extern unsigned char TBL_981B[];
extern char TBL_A5CA;
extern unsigned char TBL_A787[];
extern unsigned char TBL_D5FF[];
extern int W_7FC8;
extern int W_8A98;
extern int W_982F;
extern int W_D610;
extern int far far_b1aac(void);
extern void far far_b20fd(void);
extern void far far_ba2a4(void);
extern void far far_c12b7(void);
extern void far far_cb18f(void);
extern void far far_cdd04(void);
extern int far far_d7b8f(int, int);
extern void far far_da72a(void far *, int);
extern int far far_dab06(int);
extern void far far_db0e8(void);
extern long far far_e723d(unsigned char far *, int, int);
extern void far fn_ba378(void);

void far far_ba179(void)
{
    int ax;
    int ax2;
    int t1;
    int t10;
    int t11;
    int t2;
    int t3;
    int t4;
    long t5;
    int t6;
    int t7;
    int t8;
    int t9;

    far_da72a(MK_FP(SEG_DATA, 0x7ccf), 0x6c2);
    if (UNDEF != 0) {
        far_b20fd();
    }
    fn_ba378();
    if (UNDEF != 0) {
        far_b20fd();
    }
    B_83D0 = (char)(B_83D0 & 1);
    B_CEC0 = (char)32;
    B_9781 = (char)35;
    B_977D = (char)12;
    B_977C = (char)12;
    B_E54C = (char)127;
    B_8805 = (char)0;
    B_955F = (char)0;
    __stos2((unsigned char far *)TBL_D5FF, 0, 4);
    B_8804 = (char)1;
    B_A5CE = (char)1;
    B_9560 = (char)0;
    B_9562 = (char)0;
    TBL_A5CA = (char)0;
    B_A5C9 = (char)0;
    W_D610 = 0x1000;
    B_9482 = (char)0;
    W_8A98 = W_7FC8;
    W_982F = 10;
    __stos2((unsigned char far *)TBL_981B, -1, 20);
    __stos2((unsigned char far *)TBL_9503, -1, 64);
    __stos2((unsigned char far *)TBL_94C3, -1, 64);
    __stos2((unsigned char far *)TBL_9483, -1, 64);
    __stos2((unsigned char far *)TBL_9787, -1, 128);
    t5 = far_e723d((unsigned char far *)B_901B, 4, 4);
    far_cb18f();
    B_D4C0 = (char)far_dab06(0);
    far_cdd04();
    __stos2((unsigned char far *)TBL_A787, 0x101, 20);
    far_db0e8();
    B_D4B5 = (char)0;
    far_d7b8f(9, 1);
    far_ba2a4();
    far_c12b7();
    t11 = far_b1aac();
    ((char)(t11 >> 8) << 8 | (unsigned char)inp(80));
    return;
}
void far far_ba2a4(void) { }
void far fn_ba378(void) { }
