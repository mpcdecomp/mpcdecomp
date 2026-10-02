/* differs: 308 absent; 311 at +0, 215 bytes; 312 at +0, 215 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_7AC4;
extern char B_7ACA;
extern char B_8434;
extern char B_8435;
extern long far far_b0570(int, int);
extern long far far_b0580(int);
extern long far far_b058d(int);
extern long far far_d5801(void);
extern int far far_d79ee(void);
extern int far far_d7b2c(void);
long far far_d5801(void) { return 0; }

long far far_d5be8(void)
{
    int di;
    long t1;
    int t2;
    long t3;
    long t4;
    long t5;

    B_7AC4 = (char)2;
    t1 = far_b0570(0, B_8434 * 10);
    di = (int)far_b0580(0) + 5;
    for (;;) {
        t4 = far_b0580(0);
        if ((int)t4 == 0) {
            break;
        }
        if (far_d7b2c() == 0) {
            goto L1;
        }
        t2 = far_d79ee();
        if (t2 == 117) {
            goto L2;
        }
L1:
        if (di - (int)t4 < 5) {
            continue;
        }
        di = (int)t4;
        t3 = far_d5801();
        B_7AC4 = (char)(int)t3;
        if (B_7AC4 == 0 || B_7ACA != 0) {
            goto L3;
        }
        if (B_8435 == 0 || B_7AC4 != 4 && B_7AC4 != 5) {
            continue;
        }
        break;
    }
    goto L4;
L3:
    return (long)MK_FP((int)(far_b058d(0) >> 16), 1);
L2:
    B_7AC4 = (char)2;
L4:
    t5 = far_b058d(0);
    if (B_7AC4 == 6) {
        B_7AC4 = (char)2;
    }
    return (long)MK_FP((int)(t5 >> 16), 0 - (B_7AC4 != 0) + 1);
}
