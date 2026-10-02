/* differs: 308 at +1, 139 bytes; 311 at +1, 137 bytes; 312 at +1, 138 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_E223 {
    char pad_0[192];
    char f_c0;
};
extern struct g_TBL_E223 TBL_E223;
extern unsigned char TBL_E3AC[];
extern int W_E21F;
extern int W_E221;
extern int W_E2E3;
extern int W_E3AA;
extern void far far_b1998(void);
extern int far far_b1aac(void);
extern int far far_b1b05(int);
extern long far far_c2b07(int);
extern long far far_c2c33(void);
extern long far far_c6547(void);
extern long far far_cb23d(void);
extern void far far_cb2af(void);
extern void far far_cb6d8(void);
extern void far far_cc93a(void);
extern long far far_cdc78(void);
extern void far far_cdcc2(void);
extern void far far_dac28(void);

void far far_cb18f(void)
{
    int ax;
    int ax2;
    int si;
    int t1;
    long t10;
    int t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;
    int t8;
    int t9;

    __stos2(MK_FP(SEG_DATA, -0x1cec), -1, 64);
    __stos2((unsigned char far *)TBL_E3AC, -1, 32);
    __stos2((struct g_TBL_E223 far *)&TBL_E223, 0, 192);
    TBL_E223.f_c0 = (char)0;
    W_E2E3 = -1;
    W_E221 = 0;
    W_E21F = 0;
    W_E3AA = 0;
    far_cdcc2();
    far_cc93a();
    t3 = far_cb23d();
    far_dac28();
    if (UNDEF < 24) {
        far_b1aac();
        far_b1b05(0x69ee);
        for (;;) {
        }
    } else {
        far_cb2af();
        t6 = far_c6547();
        si = 0;
        do {
            t7 = far_cdc78();
            si = si + 1;
        } while (si < 32);
        far_cb6d8();
        far_b1998();
        t10 = far_c2b07((int)far_c2c33());
        return;
    }
}
long far far_cb23d(void) { return 0; }
void far far_cb2af(void) { }
