/* differs: 308 at +0, 294 bytes; 311 at +0, 294 bytes; 312 at +0, 294 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long near fn_f9db5(void);
extern int near fn_f9e4f(void);
extern long far fn_f9fb3(void);
extern void near fn_fa042(void);
long near fn_f9db5(void) { return 0; }

long near fn_f9ddb(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bp;
    int dx;
    int flags;
    int t1;
    int t2;
    int t3;
    long t4;
    long t5;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)(1 << *(char far *)MK_FP(SEG_STACK, bp + 2) | (unsigned int)1 >> 8 - *(char far *)MK_FP(SEG_STACK, bp + 2)));
    if ((*(char *)0x4 & (char)ax) == 0) {
        *(char *)0x4 = (char)(*(char *)0x4 | (char)ax);
        dx = (int)(fn_f9db5() >> 16);
        if (!CC(">=u", UNDEF)) {
            flags = -1;
        } else {
            t1 = fn_f9e4f();
            dx = UNDEF;
            flags = UNDEF;
            if (!CC("<u", flags)) {
                dx = (int)(fn_f9db5() >> 16);
                flags = UNDEF;
                if (!CC("<u", flags)) {
                    if (*(char far *)MK_FP(0xf800, *(int *)0x2 + 9) != 0) {
                        do {
                            fn_fa042();
                        } while (UNDEF != 1);
                    }
L1:
                    ax3 = fn_f9e4f();
                    dx = UNDEF;
                    flags = UNDEF;
                    if (!CC("<u", flags)) {
                        if (*(char far *)MK_FP(0xf800, *(int *)0x2 + 9) != 0) {
                            do {
                                fn_fa042();
                                dx = UNDEF;
                            } while (UNDEF != 1);
                        }
                        flags = 0;
                    }
                }
            }
        }
    } else {
        goto L1;
    }
    ax4 = ax2;
    if (!CC("<u", flags)) {
        t4 = fn_f9fb3();
        ax4 = (int)t4;
        dx = (int)(t4 >> 16);
        if (!CC("<u", UNDEF)) {
            t5 = fn_f9fb3();
            ax4 = (int)t5;
            dx = (int)(t5 >> 16);
        }
    }
    return ((long)dx << 16 | (unsigned)ax4);
}
int near fn_f9e4f(void) { return 0; }
long far fn_f9fb3(void) { return 0; }
void near fn_fa042(void) { }
