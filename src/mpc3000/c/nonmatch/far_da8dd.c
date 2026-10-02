/* differs: 308 at +4, 163 bytes; 311 at +4, 163 bytes; 312 at +4, 163 bytes */
struct g_W_F2AE {
    long f_0;
};
extern unsigned char TBL_da960[];
extern unsigned char TBL_da968[];
extern struct g_W_F2AE W_F2AE;
extern int W_F2B0;
extern long far far_da8a5(int, int);
long far far_da8a5(int p0, int p1) { return 0; }

long far far_da8dd(int arg_0, int arg_2)
{
    unsigned int ax;
    unsigned int ax2;

    if ((*(int *)((char *)&W_F2AE + 0) | W_F2B0) != 0) {
        goto L1;
    }
    return ((long)arg_0 << 16 | (unsigned)0);
L1:
    if (arg_2 == 0) {
        goto L2;
    }
    ax = *(char far *)((char far *)W_F2AE.f_0);
    if (ax > 3) {
        goto L3;
    }
    switch ((unsigned int)(unsigned)(TBL_da968 + (ax << 1))) {
    case 0:
        goto L4;
    case 1:
    case 2:
        goto L5;
    case 3:
        goto L6;
    }
L4:
    arg_0 = (arg_0 - -(arg_0 < 0) >> 1) + 64;
    goto L3;
L5:
    arg_0 = (int)far_da8a5(arg_0, arg_2);
    goto L3;
L6:
    arg_0 = arg_0 + 50;
    goto L3;
L2:
    ax2 = *(char far *)((char far *)W_F2AE.f_0);
    if (ax2 > 3) {
        goto L3;
    }
    switch ((unsigned int)(unsigned)(TBL_da960 + (ax2 << 1))) {
    case 0:
        goto L7;
    case 1:
    case 2:
        goto L8;
    case 3:
        goto L9;
    }
L7:
    arg_0 = (arg_0 << 1) - 128;
    goto L3;
L8:
    arg_0 = (int)far_da8a5(arg_0, arg_2);
    goto L3;
L9:
    arg_0 = arg_0 - 50;
L3:
    return ((long)arg_0 << 16 | (unsigned)arg_0);
}
