#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void far far_d99a2(long, char far *, int);

int far far_dad20(int arg_0, int arg_2)
{
    char loc_4[4];
    int t1;

    far_d99a2(*(long *)((char *)&arg_0 + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 3);
    if (loc_4[0] != -88) {
        return 0;
    }
    if (*(int *)((char *)&loc_4 + 1) != 1) {
        return 0;
    }
    return 1;
}
