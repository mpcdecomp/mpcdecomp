/* differs: 308 at +B, 136 bytes; 311 at +B, 134 bytes; 312 at +B, 135 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8805;
extern char B_8806;
extern char B_8A9F;
extern char B_8C41;
extern char B_8C42;
extern char B_901B;
extern int W_8C71;
extern int W_8C73;
extern int W_8C79;
extern int W_9045;
extern int W_9047;
extern int far far_deee8(char far *, int);
extern long far far_e3d12(char far *, long);
extern int far far_eadf4(char far *, int, int, char far *);

long far far_e562e(void)
{
    char loc_4[4];
    int ax;
    int dx;
    int t1;

    if (B_8805 != 0 && B_8C41 >= 0) {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)B_8806);
        if ((char)ax != B_8A9F || B_901B == 1) {
            t1 = far_eadf4((char far *)&B_8C41, W_9045, W_9047, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4));
            dx = (int)(far_e3d12((char far *)&B_8C41, *(long *)((char *)&loc_4 + 0)) >> 16);
            ax = W_8C79;
            if (ax > W_8C71 && (B_8C42 & 1) != 0) {
                ax = far_deee8((char far *)&B_8C41, W_8C73);
                dx = UNDEF;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
