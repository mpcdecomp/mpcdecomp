/* differs: 308 at +1, 175 bytes; 311 at +1, 175 bytes; 312 at +1, 175 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long interrupt far isr_fa062(void)
{
    int ax;
    int ax2;

    *(int far *)MK_FP(0x6dd, 0x0) = *(int far *)MK_FP(0x6dd, 0x0) - 1;
    if (*(char far *)MK_FP(0x6dd, 0x6) == 0 && *(char far *)MK_FP(0x6dd, 0x5) != 0 && inp(232) != 0) {
        *(char far *)MK_FP(0x6dd, 0x5) = (char)(*(char far *)MK_FP(0x6dd, 0x5) - 1);
        if (*(char far *)MK_FP(0x6dd, 0x5) == 1) {
            ax = 0x60e;
            outp(232, (char)ax);
            do {
                ax = ((char)(ax >> 8) << 8 | (unsigned char)(inp(232) & -64));
            } while ((char)ax != -64);
            ax2 = ((char)(ax >> 8) << 8 | (unsigned char)inp(234));
        }
    }
    return 0L;
}
