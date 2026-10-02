/* differs: 308 at +0, 110 bytes; 311 at +0, 110 bytes; 312 at +0, 110 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_7FE2;
extern char B_7FE3;
extern char B_8808;
extern unsigned char B_8809;
extern char TBL_68C8[];
extern int W_880C;

long far far_ca806(void)
{
    int ax;
    int ax2;
    long t1;

    ax = ((char)-(B_7FE3 < 0) << 8 | (unsigned char)TBL_68C8[B_7FE3]);
    B_8809 = (char)ax;
    B_8808 = (char)((char)ax << 1);
    t1 = (long)(int)(B_8809 * B_7FE2 + 25);
    ax2 = (int)(t1 / 50L);
    W_880C = ax2;
    return ((long)(int)(t1 % 50L) << 16 | (unsigned)ax2);
}
