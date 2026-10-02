/* differs: 308 at +0, 156 bytes; 311 at +0, 156 bytes; 312 at +0, 156 bytes */
int near fn_f9fb6(void)
{
    int ax;
    int ax2;
    int bx;
    int cx;
    int di;
    int p2;

    *(int *)0x0 = cx;
    *(char *)0x9 = (char)0;
    while ((*(int *)0x0 & -0x8000) == 0) {
        p2 = ax;
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)(inp(232) & -64));
        ax = p2;
        if ((char)ax2 != -128) {
            continue;
        }
        outp(234, (char)ax);
        ax = ((char)bx << 8 | (unsigned char)(char)(ax >> 8));
        bx = ((char)(bx >> 8) << 8 | (unsigned char)(char)(bx >> 8));
        di = di - 1;
        if (di != 0) {
            continue;
        }
        goto L1;
    }
    *(char *)0x7 = (char)32;
    return 32;
L1:
    return ax;
}
