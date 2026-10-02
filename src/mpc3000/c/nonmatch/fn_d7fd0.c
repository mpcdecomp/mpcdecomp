/* differs: 308 at +1D, 33 bytes; 311 at +1D, 33 bytes; 312 at +1D, 33 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_cad6d(char far *, int, int);
extern long far fn_d8063(int);

int far fn_d7fd0(int arg_0)
{
    int loc_2;
    char loc_4[2];
    int ax;
    int t1;

    t1 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), arg_0, 2);
    if (t1 != 0) {
        return t1;
    }
    if (loc_4[0] != 8) {
        return -9;
    }
    if (loc_4[1] == 0) {
        return (int)fn_d8063(arg_0);
    }
    if (loc_4[1] != 1) {
        return -32;
    }
    ax = far_cad6d((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), arg_0, 2);
    if (ax != 0) {
        return ax;
    }
    if (loc_2 != 0x6c2 && loc_2 != 0x6ad) {
        return -9;
    }
    return far_cad6d(MK_FP(SEG_DATA, 0x715d), arg_0, loc_2);
}
long far fn_d8063(int p0) { return 0; }
