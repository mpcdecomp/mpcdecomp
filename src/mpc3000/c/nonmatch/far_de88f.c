/* differs: 308 at +5, 232 bytes; 311 at +5, 232 bytes; 312 at +5, 232 bytes */
extern int TBL_7222[];
extern int TBL_722A[];
extern long far far_fa0c8(int, int, int);

int far far_de88f(int arg_0, int arg_2, int arg_4)
{
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int di;
    int dx;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;

    if (arg_2 != 0) {
        goto L1;
    }
    goto L2;
L1:
    di = arg_4 & 3;
    ax = TBL_7222[di];
    t2 = far_fa0c8(TBL_722A[di], arg_0, 0);
    t3 = t2 / (long)(int)ax;
    dx = (int)(t3 + 5L >> 16);
    loc_a = dx;
    loc_c = (int)t3 + 5;
    t4 = ((long)dx << 16 | (unsigned)((int)t3 + 5)) / 100L;
    loc_2 = (int)(t4 >> 16);
    loc_4 = (int)t4;
    t5 = far_fa0c8(100, loc_4, loc_2);
    ax2 = loc_c;
    t6 = ((long)loc_a << 16 | (unsigned)ax2) - t5 << 3;
    t7 = t6 / 100L;
    loc_6 = (int)(t7 >> 16);
    loc_8 = (int)t7;
    return (int)far_fa0c8(10, loc_4, loc_2) + loc_8;
L2:
    t1 = 0x7735940L / (unsigned long)(unsigned int)arg_0;
    return (int)((t1 + 5L) / 10L);
}
