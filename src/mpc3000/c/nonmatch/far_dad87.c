/* differs: 308 at +0, 121 bytes; 311 at +0, 122 bytes; 312 at +0, 122 bytes */
extern char B_8A9B;
extern char B_956D;
extern unsigned char B_F77B;
extern unsigned char TBL_F779;
extern char TBL_F77A;
extern long far far_d97ca(int, char far *, int);
extern int far far_dcead(unsigned char far *, int, int);

long far far_dad87(void)
{
    int ax;
    int t1;
    long t2;

    goto L1;
L2:
    TBL_F779 = TBL_F77A;
    TBL_F77A = B_8A9B;
    ax = TBL_F779;
    if (ax == 128) {
        goto L3;
    }
    if (ax != 144) {
        goto L4;
    }
    B_956D = (char)(B_956D + 1);
    goto L4;
L3:
    if (B_956D == 0) {
        goto L4;
    }
    B_956D = (char)(B_956D - 1);
L4:
    if (B_F77B < 35) {
        goto L1;
    }
    t1 = far_dcead((unsigned char far *)&TBL_F779, (int)t2 + 1, 1);
L1:
    t2 = far_d97ca(5, (char far *)&TBL_F77A, 0x63f);
    if ((int)t2 != 0) {
        goto L2;
    }
    return ((long)(int)t2 << 16 | (unsigned)(int)t2);
}
