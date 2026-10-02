/* differs: 308 at +0, 276 bytes; 311 at +0, 276 bytes; 312 at +0, 276 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long near fn_f9db5(void);
extern int near fn_f9f2c(void);
extern long far fn_f9fb3(void);
extern void far fn_f9fe6(void);
extern int near fn_f9fe9(void);

int near fn_f9d30(void)
{
    int ax;
    int bp;
    int flags;
    int si;
    int t1;
    int t2;
    int t3;
    int t4;

    si = *(int *)0x2;
    ax = (int)fn_f9fb3();
    flags = UNDEF;
    if (!CC("<u", flags)) {
        fn_f9fe6();
        fn_f9fe6();
        fn_f9fe6();
        fn_f9fe6();
        if (*(char *)0x5 == 0) {
            ax = fn_f9fe9();
            flags = UNDEF;
            *(char *)0x5 = (char)1;
L1:
            if (!CC("<u", flags)) {
                while ((*(int *)0x0 & -0x8000) == 0) {
                }
L2:
                *(char *)0x5 = *(char far *)MK_FP(0xf800, si + 2);
                ax = fn_f9f2c();
                if (!CC("<u", UNDEF)) {
                    if (((char)ax & 32) == 0) {
                        *(char *)0x7 = (char)-128;
                        goto L3;
                    }
                    ax = ((char)(ax >> 8) << 8 | (unsigned char)(1 << *(char far *)MK_FP(SEG_STACK, bp + 2) | (unsigned int)1 >> 8 - *(char far *)MK_FP(SEG_STACK, bp + 2)));
                    if ((*(char *)0x4 & (char)ax) == 0) {
                        *(char *)0x4 = (char)(*(char *)0x4 | (char)ax);
                        ax = (int)fn_f9db5();
                        if (!CC(">=u", UNDEF)) {
                            *(char *)0x4 = (char)0;
L3:
                        }
                    }
                }
            }
        } else {
            goto L2;
        }
    } else {
        goto L1;
    }
    return ax;
}
long near fn_f9db5(void) { return 0; }
int near fn_f9f2c(void) { return 0; }
long far fn_f9fb3(void) { return 0; }
void far fn_f9fe6(void) { }
int near fn_f9fe9(void) { return 0; }
