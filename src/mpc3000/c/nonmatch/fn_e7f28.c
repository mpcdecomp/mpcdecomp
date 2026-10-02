/* differs: 308 at +0, 185 bytes; 311 at +0, 185 bytes; 312 at +0, 184 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_744A;
extern char B_744C;
extern int W_7384;
extern long far fn_e8093(void);
extern int near fn_e8097(void);
extern int near fn_e80bc(void);
extern int near fn_e80f2(void);

void near fn_e7f28(void)
{
    int ax;
    int ax2;
    int ax3;
    int t1;
    int t2;
    int t3;
    long t4;
    int t5;
    int t6;

    outp(162, (char)(inp(162) & -2));
    outp(-0x3fef, (char)(inp(-0x3fef) & -9));
    ax = fn_e80bc();
    if (!CC(">=u", UNDEF)) {
        goto L1;
    }
    t1 = fn_e8097();
    t2 = fn_e8097();
    t3 = fn_e8097();
    ax2 = fn_e8097();
    if (B_744C != 1) {
        t4 = fn_e8093();
        B_744C = (char)1;
        while ((W_7384 & -0x8000) == 0) {
        }
    }
    ax3 = fn_e80bc();
    if (!CC("<u", UNDEF) && !CC("<u", UNDEF)) {
        if (((char)fn_e80f2() & 32) != 0) {
            t5 = fn_e80bc();
            while ((W_7384 & -0x8000) == 0) {
                B_744A = (unsigned char)((unsigned int)B_744A >> 1);
                if (B_744A & 1) {
                    goto L2;
                }
            }
            return;
        }
        goto L3;
    }
    goto L1;
    goto L1;
L2:
    t6 = fn_e80bc();
    if (!CC("<u", UNDEF) && !CC("<u", UNDEF) && ((char)fn_e80f2() & 32) == 0) {
L3:
    }
L1:
    return;
}
long far fn_e8093(void) { return 0; }
int near fn_e8097(void) { return 0; }
int near fn_e80bc(void) { return 0; }
int near fn_e80f2(void) { return 0; }
