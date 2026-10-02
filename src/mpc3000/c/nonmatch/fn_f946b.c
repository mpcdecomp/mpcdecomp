/* differs: 308 at +0, 34 bytes; 311 at +0, 34 bytes; 312 at +0, 34 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
int near fn_f946b(void)
{
    int ax;
    int si;

    __movs1(MK_FP(SEG_DATA, si), MK_FP(SEG_DATA, (ax << 5) + 0x24d), 32);
    return (unsigned char)(char)ax;
}
