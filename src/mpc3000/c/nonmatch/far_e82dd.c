/* differs: 308 at +3, 47 bytes; 311 at +3, 47 bytes; 312 at +3, 47 bytes */
#define UNDEF 0
extern int W_7464;
extern int near fn_e7fde(void);
int near fn_e7fde(void) { return 0; }

long far far_e82dd(void)
{
    int ax;
    int dx;
    int t1;

    ax = 2;
    if (W_7464 != 0) {
        t1 = fn_e7fde();
        dx = UNDEF;
        ax = 0;
        if (!CC(">=u", UNDEF)) {
            ax = 1;
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
