/* differs: 308 at +5, 182 bytes; 311 at +5, 182 bytes; 312 at +5, 181 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern int W_8C35;
extern int W_8C37;
extern long far far_caa9c(long);
extern long far far_cab20(int);
extern long far far_cad00(int);
extern int far far_cad90(int far *, int, int);
extern long far far_cadb4(int, int, int, int, long);
extern long far far_e6cb9(int);

long far far_e8f64(int arg_0, int arg_2, int arg_4)
{
    int loc_6;
    int loc_4;
    int loc_2;
    long t1;
    long t2;
    long t3;
    int t4;
    long t5;

    t1 = far_e6cb9(arg_4);
    loc_2 = (int)(t1 >> 16);
    loc_4 = (int)t1;
    t2 = far_cad00(0);
    t3 = far_caa9c(*(long *)((char *)&arg_0 + 0));
    if ((int)t3 < 0) {
        return t3;
    }
    loc_6 = 0x303;
    t4 = far_cad90((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), (int)t3, 2);
    if (t4 != 0) {
        return (long)MK_FP((int)(far_cab20((int)t3) >> 16), t4);
    }
    t5 = far_cadb4(5, W_8C35, W_8C37, (int)t3, *(long *)((char *)&loc_4 + 0));
    if ((int)t5 == 0) {
        return far_cab20((int)t3);
    }
    return (long)MK_FP((int)(far_cab20((int)t3) >> 16), (int)t5);
}
