/* differs: 308 at +5, 231 bytes; 311 at +5, 231 bytes; 312 at +5, 231 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern char B_F2AB;
extern char B_F2AC;
extern int W_F2A9;
extern long far far_caade(long);
extern long far far_cab20(int);
extern long far far_cad00(int);
extern int far far_cad6d(char far *, int, int);

int far far_d8388(int arg_0, int arg_2, int arg_4, int far *arg_6)
{
    char loc_2;
    char loc_1;
    int ax;
    int ax2;
    long t1;
    long t2;
    int t3;
    long t4;
    long t5;

    t1 = far_cad00(0);
    B_F2AC = (char)0;
    t2 = far_caade(*(long *)((char *)&arg_0 + 0));
    if ((int)t2 < 0) {
        return (int)t2;
    }
    W_F2A9 = (int)t2;
    t3 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), (int)t2, 2);
    if (t3 != 0) {
        return t3;
    }
    ax = ((char)(t3 >> 8) << 8 | (unsigned char)loc_2);
    if ((char)ax == arg_4) {
        goto L1;
    }
    if (arg_4 != 4 || loc_2 != 3) {
        t4 = far_cab20((int)t2);
        return -32;
    }
    loc_2 = (char)4;
L1:
    ax2 = ((char)-((char)ax < 0) << 8 | (unsigned char)loc_1);
    B_F2AB = (char)ax2;
    *arg_6 = (char)ax2;
    if (loc_2 == 3 && B_F2AB >= 3) {
        B_F2AC = loc_2;
        return 0;
    }
    t5 = far_cab20((int)t2);
    if ((int)t5 != 0) {
        return (int)t5;
    }
    B_F2AC = loc_2;
    return 0;
}
