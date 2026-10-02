/* differs: 308 at +0, 107 bytes; 311 at +0, 107 bytes; 312 at +0, 107 bytes */
extern int W_7384;

int near fn_e8097(void)
{
    int ax;
    int cx;
    int cx2;

    cx = 100;
L1:
    cx = cx - 1;
    if (cx != 0) {
        goto L1;
    }
    outp(232, (char)ax);
    cx2 = 100;
L2:
    cx2 = cx2 - 1;
    if (cx2 != 0) {
        goto L2;
    }
L3:
    if ((W_7384 & -0x8000) == 0) {
        goto L4;
    }
    return 208;
L4:
    ax = ((char)(ax >> 8) << 8 | (unsigned char)(inp(232) & -64));
    if ((char)ax != -64) {
        goto L3;
    }
    return ((char)(ax >> 8) << 8 | (unsigned char)inp(234));
}
