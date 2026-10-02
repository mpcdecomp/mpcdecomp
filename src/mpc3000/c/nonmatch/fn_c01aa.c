/* differs: 308 at +3, 124 bytes; 311 at +3, 124 bytes; 312 at +3, 123 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9C;
extern char TBL_90C1[];

long far fn_c01aa(int arg_0, char arg_2)
{
    int ax;
    int ax2;
    int ax3;
    int dx;
    int dx2;

    if (arg_0 != 0) {
        ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_8A9C);
        TBL_90C1[(char)ax] = (char)(TBL_90C1[(char)ax] | arg_2);
        return ((long)dx << 16 | (unsigned)(char)ax);
    }
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_8A9C);
    dx2 = ((char)(dx >> 8) << 8 | (unsigned char)~arg_2);
    TBL_90C1[(char)ax3] = (char)(TBL_90C1[(char)ax3] & (char)dx2);
    return ((long)dx2 << 16 | (unsigned)(char)ax3);
}
