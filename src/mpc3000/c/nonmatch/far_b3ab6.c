/* differs: 308 at +5, 200 bytes; 311 at +5, 200 bytes; 312 at +5, 200 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
void far far_b3ab6(char far *arg_0, int arg_2)
{
    char far *loc_4;
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int cx;
    int cx2;
    int cx3;
    int es;

    loc_2 = arg_2;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&arg_0 + 0);
    cx = ((char)(cx2 >> 8) << 8 | (unsigned char)0);
    for (;;) {
        bx = FP_OFF(loc_4);
        es = FP_SEG(loc_4);
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
        if (*(char far *)MK_FP(es, bx) == 0) {
            break;
        }
        cx = ((char)(cx >> 8) << 8 | (unsigned char)((char)cx + 1));
    }
    if ((char)cx >= 2) {
        ax = arg_2;
        loc_2 = ax;
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&arg_0 + 0);
        cx3 = ((char)(cx >> 8) << 8 | (unsigned char)((char)cx - 1));
        for (;;) {
            cx3 = ((char)(cx3 >> 8) << 8 | (unsigned char)((char)cx3 - 1));
            ax2 = ((char)(ax >> 8) << 8 | (unsigned char)(char)cx3);
            if ((char)ax2 == 0) {
                break;
            }
            *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
            ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*arg_0);
            *loc_4 = (char)ax;
            *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
        }
        *arg_0 = (char)46;
    }
    return;
}
