/* differs: 308 at +0, 134 bytes; 311 at +0, 135 bytes; 312 at +0, 135 bytes */
extern char B_955C;
extern char B_956A;
extern char B_956D;
extern char B_A5C2;
extern unsigned char TBL_956E[];
extern unsigned char TBL_966E[];
extern long far far_b059a(int);
extern long far far_db216(void);

int far far_e3b75(void)
{
    int ax;
    int di;
    int si;
    long t1;

    di = 1;
    si = 1;
    if ((B_A5C2 & 21) != 0) {
        si = 15;
    }
    B_956A = (char)(B_956A + 1);
    for (;;) {
        ax = (int)far_db216();
        if (ax == 0) {
            break;
        }
        si = si - 1;
        if (si > 0) {
            goto L1;
        }
        if (di != 1) {
            goto L2;
        }
        B_955C = (char)(B_955C | 64);
        si = 5;
        di = 2;
L1:
        B_956A = (char)(B_956A - 1);
        t1 = far_b059a(2);
        B_956A = (char)(B_956A + 1);
    }
    goto L3;
L2:
    __stos2((unsigned char far *)TBL_956E, 0, 128);
    ax = 0;
    __stos2((unsigned char far *)TBL_966E, ax, 128);
L3:
    B_956D = (char)0;
    return ax;
}
