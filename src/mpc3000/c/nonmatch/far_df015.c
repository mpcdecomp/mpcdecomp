/* differs: 308 at +0, 358 bytes; 311 at +0, 360 bytes; 312 at +0, 358 bytes */
extern char B_7FD1;
extern char B_7FD2;
extern char B_7FD3;
extern char B_8800;
extern char B_901B;
extern char B_9457;
extern char B_A5C3;
extern char B_D608;
extern char B_D60A;
extern int W_9053;
extern unsigned int W_96F6;
extern int W_96F8;
extern int far far_d9748(void);
extern void far far_dd970(void);
extern long far far_e2ce3(void);
extern long far far_e5612(int, int);
extern long far far_e6fef(void);

void far far_df015(void)
{
    int ax;
    int ax2;
    int ax3;
    int dx;
    int flags;
    long t1;
    long t10;
    long t11;
    int t12;
    long t2;
    long t3;
    long t4;
    int t5;
    long t6;
    long t7;
    int t8;
    int t9;

    if (B_901B < 0 && B_8800 == 0) {
        t1 = far_e6fef();
        return;
    }
    if (B_A5C3 != 0) {
L1:
        return;
    }
    t2 = far_e2ce3();
    W_96F8 = (int)(t2 >> 16);
    W_96F6 = (int)t2;
    flags = W_96F8;
    if (!CC(">", flags) && (CC("<", flags) || W_96F6 < 0x190)) {
        B_9457 = (char)(B_9457 | 4);
        t3 = far_e6fef();
        return;
    }
    dx = B_7FD1;
    if (B_7FD3 == 0) {
        dx = 0;
    }
    ax = dx;
    if (ax == 1 || ax == 2) {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_D60A);
        if ((char)ax2 == 0) {
            t11 = far_e5612(0x100, 1);
            far_dd970();
            return;
        }
        if ((char)ax2 == 4) {
            t10 = far_e5612(0x100, 1);
            far_d9748();
            B_D60A = (char)6;
            return;
        }
        if ((char)ax2 != 8) {
            return;
        }
        far_dd970();
        B_D60A = (char)12;
        return;
    }
    if (ax != 4) {
        t4 = far_e5612(0x100, 1);
        far_dd970();
        if (B_D60A == 10) {
            B_D60A = (char)12;
        }
        if (B_D60A == 18) {
            B_D60A = (char)20;
        }
        goto L1;
    }
    if (B_7FD2 == 0 || B_D60A == 0) {
        t7 = far_e5612(0x100, 1);
    } else {
        t6 = far_e5612(0x100, W_9053);
        B_D608 = (char)1;
    }
    far_dd970();
    if (B_D60A == 10) {
        B_D60A = (char)12;
    }
    if (B_D60A != 18) {
        goto L1;
    }
    B_D60A = (char)20;
    return;
}
