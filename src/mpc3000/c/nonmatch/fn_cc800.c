/* differs: 308 at +24, 64 bytes; 311 at +24, 64 bytes; 312 at +24, 64 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_dab06(int);

int far fn_cc800(char far *arg_0, int arg_4, char arg_6)
{
    int ax;
    int ax2;

    ax = far_dab06(*(char *)((char *)&arg_4 + 0));
    *(char *)((char *)&arg_4 + 0) = (char)0;
    do {
        ax2 = far_dab06(*(char *)((char *)&arg_4 + 0));
        if (ax2 == ax) {
            ax2 = ((char)-(*(char *)((char *)&arg_4 + 0) < 0) << 8 | (unsigned char)arg_6);
            arg_0[*(char *)((char *)&arg_4 + 0)] = (char)ax2;
        }
        *(char *)((char *)&arg_4 + 0) = (char)(*(char *)((char *)&arg_4 + 0) + 1);
    } while (*(char *)((char *)&arg_4 + 0) < 64);
    return ax2;
}
