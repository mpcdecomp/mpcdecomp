/* differs: 308 at +0, 284 bytes; 311 at +0, 292 bytes; 312 at +0, 289 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_A570;
extern char B_A5C9;
extern char B_D5EB;
extern char B_D5EC;
extern char B_D5ED;
extern char B_D608;
extern unsigned char B_D60A;
extern char TBL_A5CA;
extern unsigned char TBL_dd5e6[];
extern unsigned int W_9041;
extern int W_9043;
extern int W_D4AF;
extern int W_D5E7;
extern int W_D5E9;
extern int W_D635;
extern int W_D637;
extern long far far_d7adf(int);
extern int far far_dac6a(void);
extern long far far_dd212(void);
extern void far fn_dd6f4(void);

void far far_dd6e7(void)
{
    int ax;
    int ax2;
    unsigned int bx;
    int cx;
    int cx2;
    unsigned int dx;
    unsigned int dx2;
    int dx3;
    int p6;
    int t1;
    long t2;
    int t3;

    fn_dd6f4();
    if ((char)UNDEF == 77) {
        t2 = far_d7adf(136);
        goto L1;
    }
    if ((char)UNDEF == 36) {
        goto L1;
    }
    if ((unsigned char)(char)UNDEF >= 85 && (unsigned char)((char)UNDEF - 85) < 6) {
        cx = 0;
        switch ((unsigned int)(unsigned)(TBL_dd5e6 + ((unsigned char)((char)UNDEF - 85) << 1))) {
        case 0:
            break;
        case 1:
        case 2:
            if (B_A570 != 0) {
                ax = (unsigned char)(char)UNDEF;
            } else {
                ax = (77 << 8 | (unsigned char)(char)UNDEF);
            }
            goto L2;
        case 3:
            B_D5EB = (char)0;
            bx = W_9041 & -4;
            cx2 = W_9043 + (bx + 4 < bx);
            W_D5E7 = bx + 4;
            W_D5E9 = cx2;
            B_D5ED = (char)0;
            cx = 252;
            ax = (unsigned char)(char)UNDEF;
            goto L2;
        case 4:
            B_D5ED = (char)1;
            B_D5EC = -B_D5EC;
            cx = 251;
            if (B_D60A >= 16) {
                if (TBL_A5CA == 0 && B_A5C9 == 0) {
                    dx = W_9043;
                    dx2 = dx >> 1;
                    W_D635 = (W_9041 >> 1 | (dx & 1) << 15) >> 1 | (dx2 & 1) << 15;
                    W_D637 = dx2 >> 1;
L3:
                } else {
                    B_D608 = (char)1;
                }
            } else {
                goto L3;
            }
            goto L4;
        case 5:
            B_D5ED = (char)1;
            B_D5EC = (char)0;
            cx = 250;
            if (B_D60A >= 16) {
                if (TBL_A5CA == 0 && B_A5C9 == 0) {
                    W_D635 = 0;
                    W_D637 = 0;
                } else {
                    B_D608 = (char)1;
                }
            }
L4:
            W_D4AF = -1;
            ax = (81 << 8 | (unsigned char)(char)UNDEF);
L2:
            p6 = ax;
            if (cx != 0) {
                dx3 = (int)(far_dd212() >> 16);
            }
            if ((char)(p6 >> 8) != 0) {
                t3 = far_dac6a();
            }
            break;
        }
L1:
        ax2 = far_dac6a();
    }
    return;
}
void far fn_dd6f4(void) { }
