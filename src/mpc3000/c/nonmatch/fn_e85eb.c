/* differs: 308 at +5, 125 bytes; 311 at +5, 125 bytes; 312 at +5, 125 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_F75E;
extern long far far_caa9c(long);
extern long far far_caade(long);
extern long far far_cab20(int);
extern long far far_cad00(int);
extern int far far_cad90(char far *, int, int);

int far fn_e85eb(int arg_0, int arg_2)
{
    char loc_2[2];
    int loc_4;
    long t1;
    long t2;
    int t3;
    int t4;
    int t5;

    t1 = far_cad00(0);
    if ((int)far_caade(*(long *)((char *)&arg_0 + 0)) >= 0) {
        return -0x800;
    }
    t2 = far_caa9c(*(long *)((char *)&arg_0 + 0));
    W_F75E = (int)t2;
    if ((int)t2 < 0) {
        return (int)t2;
    }
    loc_2[0] = (char)8;
    loc_2[1] = (char)1;
    t3 = far_cad90((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2), W_F75E, 2);
    if (t3 != 0) {
        return t3;
    }
    loc_4 = 0x6c2;
    t4 = far_cad90((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), W_F75E, 2);
    if (t4 != 0) {
        return t4;
    }
    t5 = far_cad90(MK_FP(SEG_DATA, 0x715d), W_F75E, 0x6c2);
    if (t5 != 0) {
        return t5;
    }
    return (int)far_cab20(W_F75E);
}
