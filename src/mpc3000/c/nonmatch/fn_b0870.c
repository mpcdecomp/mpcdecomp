/* differs: 308 at +5, 146 bytes; 311 at +5, 146 bytes; 312 at +5, 146 bytes */
extern char B_7B54;
extern char B_7B8C;
extern char B_7B8D;
extern char B_D4C0;
extern char B_D4C1;
extern long far far_b32ec(int);
extern long far fn_b05de(void);
extern long far fn_b0605(int);
extern long far fn_b07b6(void);
long far fn_b05de(void) { return 0; }
long far fn_b0605(int p0) { return 0; }
long far fn_b07b6(void) { return 0; }

long far fn_b0870(int arg_0, int arg_2)
{
    int loc_2;
    int dx;
    int dx2;
    long t1;
    long t2;
    long t3;

    if (arg_0 == 68) {
        goto L1;
    }
    if (arg_0 == 78) {
        goto L1;
    }
    return ((long)dx << 16 | (unsigned)arg_0);
L1:
    if ((arg_2 & 128) != 0) {
        goto L2;
    }
    return ((long)dx << 16 | (unsigned)arg_0);
L2:
    loc_2 = B_7B8D;
    t1 = fn_b0605(0);
L3:
    t2 = fn_b07b6();
    if (B_7B8C != 0) {
        goto L4;
    }
    if ((B_7B54 & 16) == 0) {
        goto L4;
    }
    if (arg_0 != 68) {
        goto L5;
    }
    dx2 = (int)(far_b32ec(B_D4C0) >> 16);
    goto L6;
L5:
    dx2 = (int)(far_b32ec(B_D4C1) >> 16);
L6:
    loc_2 = B_7B8D;
    arg_0 = -0x8000;
    goto L7;
L4:
    t3 = fn_b05de();
    dx2 = (int)(t3 >> 16);
    if ((int)t3 != 0) {
        goto L3;
    }
L7:
    B_7B8D = *(char *)((char *)&loc_2 + 0);
    return ((long)dx2 << 16 | (unsigned)arg_0);
}
