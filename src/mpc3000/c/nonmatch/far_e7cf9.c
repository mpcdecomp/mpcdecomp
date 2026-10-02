/* differs: 308 at +5, 122 bytes; 311 at +5, 121 bytes; 312 at +5, 122 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_W_8C35 {
    long f_0;
    char pad_4[332];
    char f_150;
};
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern long far far_e259f(char);

long far far_e7cf9(int arg_0, int arg_2)
{
    long loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int bx;
    int dx;
    int dx2;
    int es;
    long t1;

    t1 = far_e259f(*(char *)((char *)&arg_0 + 0));
    loc_2 = (int)t1;
    if ((int)t1 == 0) {
        goto L1;
    }
    return t1;
L1:
    dx = *(int *)((char *)&W_8C35 + 0);
    loc_4 = (int)(((long)W_8C37 << 16 | (unsigned)dx) + 0x151L >> 16);
    *(int *)((char *)&loc_6 + 0) = dx + 0x151;
    dx2 = *(char far *)((char far *)W_8C35.f_0 + 336);
    goto L2;
L3:
    bx = (int)loc_6;
    es = (int)(loc_6 >> 16);
    if ((unsigned char)*(char far *)MK_FP(es, bx) != arg_2) {
        goto L4;
    }
    return ((long)dx2 << 16 | (unsigned)(unsigned char)*(char far *)MK_FP(es, bx + 1));
L4:
    *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + 24;
L2:
    ax = dx2;
    dx2 = dx2 - 1;
    if (ax != 0) {
        goto L3;
    }
    return ((long)dx2 << 16 | (unsigned)-5);
}
