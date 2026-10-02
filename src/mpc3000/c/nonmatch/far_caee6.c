/* differs: 308 at +0, 176 bytes; 311 at +0, 176 bytes; 312 at +0, 176 bytes */
#define SEG_DATA _DS
#define UNDEF 0
extern void near fn_caf10(void);
extern void near fn_caf18(void);

long far far_caee6(void)
{
    int ax;
    int ax2;
    int ax3;
    int bx;
    int cx;
    unsigned int di;
    int dx;
    int es;
    int p6;
    int t1;
    int t2;
    int t3;

    di = 8;
    do {
        ax = ax2;
        if ((char)(ax >> 8) == 3) {
            fn_caf18();
            bx = UNDEF;
            cx = UNDEF;
            es = UNDEF;
            ax = UNDEF;
            dx = UNDEF;
        }
        ax3 = __insn("int 0x40", ax, bx, cx, dx, ax2, di, es, SEG_DATA);
        bx = UNDEF;
        cx = UNDEF;
        dx = UNDEF;
        es = UNDEF;
        if (CC(">=u", UNDEF)) {
            goto L1;
        }
        if (di <= 4) {
            p6 = ax3;
            t2 = __insn("int 0x40", (unsigned char)(char)ax3, bx, cx, dx, ax2, di, es, SEG_DATA);
            fn_caf10();
            bx = UNDEF;
            cx = UNDEF;
            es = UNDEF;
            dx = UNDEF;
            ax3 = p6;
        }
        di = di - 1;
    } while (di != 0);
L1:
    return ((long)dx << 16 | (unsigned)ax3);
}
void near fn_caf10(void) { }
void near fn_caf18(void) { }
