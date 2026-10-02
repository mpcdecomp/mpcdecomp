/* differs: 308 at +3, 93 bytes; 311 at +3, 91 bytes; 312 at +3, 93 bytes */
extern int W_9449;
extern int W_944B;
extern int W_944D;
extern int W_9451;
extern int W_9453;
extern int W_D5DF;
extern int W_D5E1;

int far fn_b18e5(void)
{
    int loc_2;
    int ax;

    if (W_944B != 0x7fff) {
        goto L1;
    }
    W_944D = 0x7fff;
    goto L2;
L1:
    if (W_9449 > -0x7fff) {
        goto L3;
    }
    W_944D = 0x7fff;
    goto L2;
L3:
    ax = -W_9449;
    loc_2 = ax;
    if (ax <= W_944B) {
        goto L4;
    }
    W_944B = ax;
L4:
    W_944D = W_944B + 1;
L2:
    W_9453 = 0;
    W_9451 = 0;
    W_D5E1 = 0;
    W_D5DF = 0;
    W_9449 = 0;
    W_944B = 0;
    return 0;
}
