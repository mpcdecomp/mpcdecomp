/* differs: 308 absent; 311 at +0, 177 bytes; 312 at +0, 177 bytes */
#define UNDEF 0
extern char B_A5BE;
extern char B_A5C3;
extern int W_E54E;
extern long far far_b059a(int);
extern int far far_d7b8f(int, int);
extern int far far_e931c(void);

long far fn_b144c(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int dx;
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;
    int t7;

    ax = far_e931c();
    dx = UNDEF;
    W_E54E = 1;
    goto L1;
L2:
    ax2 = B_A5C3 & 63;
    if (ax2 == 8) {
        goto L3;
    }
    if (ax2 == 10) {
        goto L4;
    }
    goto L5;
L3:
    t4 = far_d7b8f(7, 0);
    t5 = far_d7b8f(6, W_E54E);
    t6 = far_d7b8f(6, W_E54E);
    goto L6;
L4:
    t1 = far_d7b8f(6, 0);
    t2 = far_d7b8f(6, 0);
    t3 = far_d7b8f(7, W_E54E);
    goto L6;
L5:
    far_d7b8f(6, 0);
    far_d7b8f(6, 0);
    t7 = far_d7b8f(7, 0);
    B_A5BE = (char)0;
    return ((long)UNDEF << 16 | (unsigned)t7);
L6:
    dx = (int)(far_b059a(4) >> 16);
    ax = 1 - W_E54E;
    W_E54E = ax;
L1:
    if (B_A5BE == 0) {
        goto L7;
    }
    goto L2;
L7:
    return ((long)dx << 16 | (unsigned)ax);
}
