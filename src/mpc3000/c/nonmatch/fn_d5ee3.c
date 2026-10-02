/* differs: 308 at +0, 92 bytes; 311 at +0, 92 bytes; 312 at +0, 92 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_d5f94[];
extern long near fn_d5f63(void);

long near fn_d5ee3(void)
{
    int ax;
    int ax2;
    int dx;
    long t1;
    long t2;

    if ((*(char far *)MK_FP(0xdef1, (unsigned int)(unsigned)(TBL_d5f94 + (unsigned char)(char)ax)) & -128) == 0) {
        t1 = fn_d5f63();
        ax2 = (int)t1;
        dx = (int)(t1 >> 16);
    } else {
        t2 = (*(long (*)())*(int far *)MK_FP(0xdef1, (unsigned char)(char)ax * 2 + 0x15d))();
        ax2 = (int)t2;
        dx = (int)(t2 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax2);
}
long near fn_d5f63(void) { return 0; }
