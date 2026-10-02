/* differs: 308 absent; 311 at +7, 77 bytes; 312 at +7, 77 bytes */
extern char B_7AC0;
extern char B_7AC3;
extern int W_7ACC;
extern int W_7AD1;
extern int W_7AD3;
extern long far far_d565e(int, int, int, int);
extern long far far_e82dd(int, int, int, int, int);

int far fn_baa4d(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8)
{
    int loc_4;
    int loc_2;
    int ax;
    unsigned int bx2;
    unsigned int bx3;

    if (B_7AC3 != 0) {
        goto L1;
    }
    return (int)far_e82dd(arg_0, arg_2, arg_4, arg_6, arg_8);
L1:
    if (B_7AC0 != 5) {
        goto L2;
    }
    ax = 4;
    goto L3;
L2:
    ax = 16;
L3:
    bx2 = W_7AD1;
    bx3 = bx2 + arg_8 * ax;
    loc_2 = W_7AD3 + (bx3 < bx2);
    loc_4 = bx3;
    if ((int)far_d565e(W_7ACC, loc_4, loc_2, (int)(*(long *)((char *)&arg_4 + 0) / 0x200L)) == 0) {
        goto L4;
    }
    return -3;
L4:
    return 0;
}
