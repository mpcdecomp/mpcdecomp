/* differs: 308 at +5, 277 bytes; 311 at +5, 277 bytes; 312 at +5, 277 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int TBL_7222[];
extern int TBL_722A[];
extern long far far_fa0c8();

long far far_de7ae(unsigned int arg_0, int arg_2, int arg_4)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int ax;
    int bx;
    int di;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;

    if (arg_2 == 0) {
        t1 = 0x7735940L / (unsigned long)(unsigned int)arg_0;
        return (t1 + 5L) / 10L;
    }
    di = arg_4 & 3;
    loc_2 = 0;
    loc_4 = arg_0 / 10;
    t2 = far_fa0c8(10, loc_4, 0, 0, arg_0);
    loc_6 = (int)((unsigned long)(unsigned int)arg_0 - t2 >> 16);
    loc_8 = arg_0 - (int)t2;
    t3 = far_fa0c8(0x3e8, loc_4, loc_2);
    t4 = far_fa0c8(0x3e8, loc_8, loc_6);
    t5 = t4 / 8L;
    bx = (int)(t3 >> 16) + (int)(t5 >> 16) + ((unsigned int)((int)t3 + (int)t5) < (unsigned int)(int)t3);
    t6 = far_fa0c8(TBL_7222[di], bx, bx);
    ax = TBL_722A[di];
    t7 = t6 / (long)(int)ax;
    return (t7 + 5L) / 10L;
}
