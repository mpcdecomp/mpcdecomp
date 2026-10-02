/* differs: 308 at +0, 131 bytes; 311 at +0, 131 bytes; 312 at +0, 131 bytes */
int near fn_f9fe9(void)
{
    int ax;
    int cx;
    int cx2;
    int cx3;

    *(int *)0x0 = cx;
    cx2 = 100;
    do {
        cx2 = cx2 - 1;
    } while (cx2 != 0);
    outp(232, (char)ax);
    cx3 = 100;
    do {
        cx3 = cx3 - 1;
    } while (cx3 != 0);
    while ((*(int *)0x0 & -0x8000) == 0) {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)(inp(232) & -64));
        if ((char)ax != -64) {
            continue;
        }
        goto L1;
    }
    *(char *)0x7 = (char)32;
    return 32;
L1:
    return ((char)(ax >> 8) << 8 | (unsigned char)inp(234));
}
