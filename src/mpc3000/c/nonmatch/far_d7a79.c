/* differs: 308 at +0, 52 bytes; 311 at +0, 51 bytes; 312 at +0, 51 bytes */
#define UNDEF 0
extern int far far_fb6af(void);
extern long far far_fb71b(void);

long far far_d7a79(void)
{
    int ax;
    int dx;
    long t1;

    for (;;) {
        t1 = far_fb71b();
        ax = (int)t1;
        dx = (int)(t1 >> 16);
        if (CC("s", UNDEF)) {
            break;
        }
        if ((char)UNDEF == 120 || (char)UNDEF == 121 || ((char)UNDEF == 122 || (char)UNDEF == 117)) {
            continue;
        }
        goto L1;
    }
    goto L2;
L1:
    ax = far_fb6af();
    dx = UNDEF;
L2:
    return ((long)dx << 16 | (unsigned)ax);
}
