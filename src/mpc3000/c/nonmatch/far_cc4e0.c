/* differs: matches beside its same-file callees (the stubs) */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_cb8a1(char far *);
long far far_cb8a1(char far *p0) { return 0; }

long far far_cc4e0(char arg_0)
{
    char loc_6[6];

    loc_6[0] = (char)-112;
    loc_6[1] = (char)0;
    loc_6[2] = arg_0;
    loc_6[3] = (char)127;
    loc_6[4] = (char)64;
    return far_cb8a1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6));
}
