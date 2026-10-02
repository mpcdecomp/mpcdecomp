/* differs: 308 at +26, 90 bytes; 311 at +26, 90 bytes; 312 at +26, 90 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_E421;
extern long FP_E40C;
extern int W_E40E;
extern long far far_c6547(int);

long far far_cd4d6(void)
{
    int loc_2;
    int loc_4;
    int ax;
    int bx;
    int cx;
    int di;

    loc_2 = B_E421;
    loc_4 = 0;
    do {
        ax = (int)far_c6547(loc_4);
        di = 35;
        cx = 0x348;
        do {
            bx = (int)FP_E40C + cx;
            if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, (unsigned char)*(char far *)MK_FP((int)(FP_E40C >> 16), bx - 0x30a) * 36 + 0x4800) == 0) {
                *(char far *)MK_FP(W_E40E, bx - 0x30a) = (char)-1;
            }
            cx = cx + 24;
            di = di + 1;
        } while (cx != 0x930);
        loc_4 = loc_4 + 1;
    } while (loc_4 < 24);
    B_E421 = *(char *)((char *)&loc_2 + 0);
    return far_c6547(loc_2);
}
