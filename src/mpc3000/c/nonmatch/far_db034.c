/* differs: 308 at +8, 125 bytes; 311 at +8, 125 bytes; 312 at +8, 125 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_880B;
extern char B_901B;
extern unsigned char B_A567[];
extern char B_A570;
extern char TBL_9FE7[];
extern unsigned char TBL_A267[];
extern char TBL_A367[];
extern unsigned char TBL_A4E7[];
extern int W_8820;
extern long far far_dca3e(void);

int far far_db034(void)
{
    int ax;
    int near *bx;
    char near *di;
    int dx;
    int si;

    if (B_A570 != 0) {
        __stos2((unsigned char far *)TBL_A4E7, -1, 128);
        return -1;
    }
    if (B_901B == 0) {
        si = 0;
        di = (char near *)TBL_A4E7;
        dx = (int)(unsigned)TBL_A267;
        do {
            if (*di != -1) {
                if (*di == -2) {
                    if ((TBL_9FE7[si] & -128) != 0) {
                        TBL_A367[si] = (char)64;
                        bx = (int near *)dx;
                        ax = W_8820;
                        *bx = ax;
                        TBL_9FE7[si] = (char)(TBL_9FE7[si] & 127);
                    }
                } else {
                    ax = ((char)(ax >> 8) << 8 | (unsigned char)-1);
                    TBL_A367[si] = (char)ax;
                    *di = (char)ax;
                }
            }
            di = di + 1;
            dx = dx + 2;
            si = si + 1;
        } while (di != (char near *)B_A567);
        B_880B = (char)1;
        ax = (int)far_dca3e();
    }
    return ax;
}
