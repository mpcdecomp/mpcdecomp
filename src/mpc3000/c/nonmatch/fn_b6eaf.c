/* differs: 308 at +5, 136 bytes; 311 at +5, 137 bytes; 312 at +5, 137 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_F779[];
extern char TBL_F77A;
extern long far far_caade(long);
extern long far far_cab20(int);
extern long far far_cad00(int);
extern int far far_cad6d(unsigned char far *, int, int);

int far fn_b6eaf(int arg_0, int arg_2, int arg_4)
{
    int loc_2;
    int loc_4;
    int ax;
    int si;
    long t1;
    long t2;
    int t3;
    long t4;

    t1 = far_cad00(0);
    t2 = far_caade(*(long *)((char *)&arg_0 + 0));
    if ((int)t2 < 0) {
        return (int)t2;
    }
    t3 = far_cad6d((unsigned char far *)TBL_F779, (int)t2, 2);
    if (t3 != 0) {
        return t3;
    }
    ax = ((char)(t3 >> 8) << 8 | (unsigned char)TBL_F77A);
    loc_2 = (unsigned char)(char)ax;
    if ((int)(unsigned char)(char)ax <= arg_4) {
        si = 0;
    } else {
        si = -9;
    }
    t4 = far_cab20((int)t2);
    loc_4 = (int)t4;
    if ((int)t4 != 0) {
        return (int)t4;
    }
    return si;
}
