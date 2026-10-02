/* differs: 308 at +3, 31 bytes; 311 at +3, 31 bytes; 312 at +3, 31 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[2174];
    char f_87e;
};
extern char TBL_818A[];

int far far_b2121(void)
{
    int ax;
    struct s1 near *si;

    si = 0;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)si->f_87e);
        TBL_818A[(unsigned int)(unsigned)si] = (char)ax;
        si = (struct s1 near *)((char near *)si + 1);
    } while ((unsigned int)(unsigned)si < 64);
    return ax;
}
