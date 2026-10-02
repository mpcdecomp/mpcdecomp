/* differs: 308 at +3, 107 bytes; 311 at +3, 107 bytes; 312 at +3, 107 bytes */
#define UNDEF 0
extern int W_7464;
extern void near fn_e7f00(void);
extern void near fn_e7f07(void);
extern int near fn_e7f28(void);
extern int near fn_e7fde(void);
void near fn_e7f00(void) { }
void near fn_e7f07(void) { }
int near fn_e7f28(void) { return 0; }
int near fn_e7fde(void) { return 0; }

long far far_e8278(void)
{
    int ax;
    int dx;
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;

    ax = -3;
    if (W_7464 != 0) {
        fn_e7f00();
        t2 = fn_e7f28();
        dx = UNDEF;
        ax = -1;
        if (!CC("<u", UNDEF)) {
            t3 = fn_e7fde();
            dx = UNDEF;
            ax = 2;
            if (!CC(">=u", UNDEF)) {
                fn_e7f07();
                t5 = fn_e7f28();
                dx = UNDEF;
                ax = 0;
                if (!CC("<u", UNDEF)) {
                    t6 = fn_e7fde();
                    dx = UNDEF;
                    ax = 1;
                    if (!CC(">=u", UNDEF)) {
                        ax = -2;
                    }
                }
            }
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
