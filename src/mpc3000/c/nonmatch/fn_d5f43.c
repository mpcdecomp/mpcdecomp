/* differs: 308 at +0, 86 bytes; 311 at +0, 86 bytes; 312 at +0, 86 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_d5fb5[];
extern long near fn_d5f63(void);

int near fn_d5f43(void)
{
    int ax;
    int ax2;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(0xdef1, (unsigned int)(unsigned)(TBL_d5fb5 + (unsigned char)(char)ax2)));
    if ((char)ax != 0) {
        if (((char)ax & -128) == 0) {
            ax = (int)fn_d5f63();
        } else {
            ax = (int)(*(long (*)())*(int far *)MK_FP(0xdef1, (unsigned char)(char)ax2 * 2 + 0x17e))();
        }
    }
    return ax;
}
long near fn_d5f63(void) { return 0; }
