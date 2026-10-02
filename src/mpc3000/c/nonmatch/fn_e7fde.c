/* differs: 308 at +0, 184 bytes; 311 at +0, 182 bytes; 312 at +0, 182 bytes */
#define UNDEF 0
struct g_W_744E {
    long f_0;
};
struct g_W_7452 {
    long f_0;
};
extern char B_7447;
extern char B_7459;
extern struct g_W_744E W_744E;
extern int W_7450;
extern struct g_W_7452 W_7452;
extern int W_7454;
extern int W_7456;
extern int W_7458;
extern int W_745A;
extern long near fn_e806a(void);
extern long near fn_e8172(void);
extern void near fn_e81e8(void);

void near fn_e7fde(void)
{
    int ax;
    unsigned int ax2;
    unsigned int ax3;
    unsigned int ax4;
    int ax5;
    int ax6;
    int bx;
    int cx;
    int di;
    int dx;
    int t1;
    long t2;
    long t3;

    ax = ax2 << 4 | ax2 >> 12;
    ax3 = ax & -16;
    ax4 = ax3 + bx;
    *(int *)((char *)&W_744E + 0) = ax4;
    W_7450 = ax + (ax4 < ax3) & 15;
    *(int *)((char *)&W_7452 + 0) = dx;
    W_7454 = cx;
    W_7456 = di;
    for (;;) {
        fn_e81e8();
        W_7458 = UNDEF;
        t2 = fn_e806a();
        if (CC("<u", UNDEF)) {
            break;
        }
        W_7456 = W_7456 + B_7459;
        ax5 = W_7458;
        *(int *)((char *)&W_744E + 0) = *(int *)((char *)&W_744E + 0) + ax5;
        W_7450 = (int)(W_744E.f_0 + ((long)W_745A << 16 | (unsigned)ax5) >> 16);
        ax6 = W_7458;
        *(int *)((char *)&W_7452 + 0) = *(int *)((char *)&W_7452 + 0) - ax6;
        W_7454 = (int)(W_7452.f_0 - ((long)W_745A << 16 | (unsigned)ax6) >> 16);
        if ((*(int *)((char *)&W_7452 + 0) | W_7454) != 0) {
            continue;
        }
        goto L1;
    }
    goto L2;
L1:
    if ((B_7447 & 1) == 0) {
        t3 = fn_e8172();
    }
L2:
    return;
}
long near fn_e806a(void) { return 0; }
long near fn_e8172(void) { return 0; }
void near fn_e81e8(void) { }
