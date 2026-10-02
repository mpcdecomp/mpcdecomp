/* differs: 308 at +0, 165 bytes; 311 at +0, 164 bytes; 312 at +0, 165 bytes */
extern char B_8188;
extern char B_A570;
extern char TBL_F779;
extern unsigned char TBL_F77A;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far fn_db2f3(char far *, int);
extern int far fn_db366(char far *, int);

long far far_db274(void)
{
    int ax;
    int bx;
    int dx;
    int si;
    long t1;
    int t2;
    long t3;

    si = 6;
    goto L1;
L2:
    if (TBL_F77A != -10) {
        goto L3;
    }
    if (B_A570 != 0) {
        goto L4;
    }
    TBL_F779 = (char)-24;
    t1 = fn_db2f3((char far *)&TBL_F779, bx + 1);
    goto L4;
L3:
    if (B_8188 == 0) {
        goto L5;
    }
    if (B_A570 != 0) {
        goto L5;
    }
    if ((TBL_F77A & 15) != B_8188 - 1) {
        goto L4;
    }
L5:
    TBL_F779 = (char)(TBL_F77A & -16);
    t2 = fn_db366((char far *)&TBL_F779, bx + 1);
L4:
    t3 = far_d97ca(si, (unsigned char far *)&TBL_F77A, 0x63f);
    ax = (int)t3;
    dx = (int)(t3 >> 16);
    bx = ax;
    if (ax != 0) {
        goto L2;
    }
    si = si + 1;
L1:
    if (si <= 7) {
        goto L4;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
long far fn_db2f3(char far *p0, int p1) { return 0; }
int far fn_db366(char far *p0, int p1) { return 0; }
