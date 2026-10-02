/* differs: 308 at +5, 242 bytes; 311 at +5, 242 bytes; 312 at +5, 242 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_W_8C35 {
    long f_0;
    char pad_4[332];
    char f_150;
};
extern char B_8A9F;
extern char B_901B;
extern char TBL_905D[];
extern char TBL_90C1[];
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern long far far_e259f(int);

long far far_e726e(int arg_0, int arg_2)
{
    long loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int dx2;
    int dx3;
    int es;
    long t1;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_8A9F);
    if ((char)ax == arg_0 && B_901B >= 0) {
        ax3 = ((char)-((char)ax < 0) << 8 | (unsigned char)TBL_905D[arg_2]);
        if ((TBL_90C1[(char)ax3] & 2) == 0) {
            return ((long)arg_0 << 16 | (unsigned)-5);
        }
        return ((long)arg_0 << 16 | (unsigned)(char)ax3);
    }
    t1 = far_e259f(arg_0);
    loc_2 = (int)t1;
    if ((int)t1 != 0) {
        return t1;
    }
    dx2 = *(int *)((char *)&W_8C35 + 0);
    loc_4 = (int)(((long)W_8C37 << 16 | (unsigned)dx2) + 0x151L >> 16);
    *(int *)((char *)&loc_6 + 0) = dx2 + 0x151;
    dx3 = *(char far *)((char far *)W_8C35.f_0 + 336);
    for (;;) {
        ax4 = dx3;
        dx3 = dx3 - 1;
        if (ax4 == 0) {
            break;
        }
        bx = (int)loc_6;
        es = (int)(loc_6 >> 16);
        if ((unsigned char)*(char far *)MK_FP(es, bx + 1) == arg_2) {
            goto L1;
        }
        *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + 24;
    }
    return ((long)dx3 << 16 | (unsigned)-5);
L1:
    if ((*(char far *)MK_FP(es, bx + 2) & 2) == 0) {
        return ((long)dx3 << 16 | (unsigned)-5);
    }
    return ((long)dx3 << 16 | (unsigned)(unsigned char)*(char far *)MK_FP(es, bx));
}
