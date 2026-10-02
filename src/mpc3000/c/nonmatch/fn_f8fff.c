/* differs: 308 at +0, 124 bytes; 311 at +0, 124 bytes; 312 at +0, 124 bytes */
#define UNDEF 0
extern int far fn_f9325(int, int);

int near fn_f8fff(void)
{
    int ax;
    char near *bx;
    int bx2;
    int cx;
    int cx2;
    int flags;
    char near *si;

    bx = (char near *)UNDEF;
    ax = (int)fn_f9325(cx, bx2);
    if (!CC(">=u", UNDEF)) {
        return ax;
    }
    flags = (char)(ax >> 8) + 1;
    if (!CC("!=", flags)) {
        return (-1 << 8 | (unsigned char)(char)ax);
    }
    cx2 = 32;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)*bx);
        *si = (char)ax;
        bx = bx + 1;
        si = si + 1;
        flags = (int)(unsigned)si;
        cx2 = cx2 - 1;
    } while (cx2 != 0);
    return (unsigned char)(char)ax;
}
int far fn_f9325(int p0, int p1) { return 0; }
