/* differs: 308 at +5, 65 bytes; 311 at +5, 65 bytes; 312 at +5, 65 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_cad00(int);
extern int far far_cad50(char far *, char far *, int far *);
extern long far far_fa0c8(int, int, int);

long far far_c80dc(void)
{
    char loc_4[4];
    char loc_6[2];
    int loc_8;
    int ax;
    long t1;
    int t2;
    long t3;

    t1 = far_cad00(0);
    t2 = far_cad50((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8));
    *(int *)((char *)&loc_4 + 2) = t2;
    if (t2 != 0) {
        return ((long)UNDEF << 16 | (unsigned)t2);
    }
    ax = *(int *)((char *)&loc_4 + 0);
    t3 = far_fa0c8(loc_8, ax, -(ax < 0));
    return t3 / 0x400L;
}
