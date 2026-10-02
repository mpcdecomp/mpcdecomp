/* differs: 308 at +5, 216 bytes; 311 at +5, 216 bytes; 312 at +5, 216 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
extern char B_EFDA;
extern long far far_b133a(long, int, char, int, int);
extern long far fn_c1e8f(char);

int far fn_c1860(int arg_0)
{
    int loc_2;
    int loc_4;
    int loc_6;
    long loc_8;
    int loc_a;
    long loc_c;
    int loc_e;
    int loc_10;
    int loc_12;
    int ax;
    int ax2;
    struct s1 near *bx;
    int bx2;
    int bx3;
    int di;
    int dx;
    int es;
    int es2;
    int si;
    long t1;

    loc_2 = 0;
    di = 0;
    ax = (arg_0 << 2) + 0x274;
    loc_12 = ax;
    while (loc_2 < 16) {
        loc_e = SEG_DATA;
        loc_10 = 0x177b;
        bx = (struct s1 near *)loc_12;
        dx = bx->f_0;
        loc_a = bx->f_2;
        *(int *)((char *)&loc_c + 0) = dx;
        loc_4 = 0;
        do {
            bx2 = (int)loc_c;
            es = (int)(loc_c >> 16);
            *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) + 1;
            t1 = fn_c1e8f(*(char far *)MK_FP(es, bx2));
            ax = (int)t1;
            loc_6 = (int)(t1 >> 16);
            *(int *)((char *)&loc_8 + 0) = ax;
            si = 0;
            do {
                ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_EFDA);
                bx3 = (int)loc_8;
                es2 = (int)(loc_8 >> 16);
                *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 1;
                ax = (int)far_b133a(*(long *)((char *)&loc_10 + 0), di, *(char far *)MK_FP(es2, bx3), 5, ax2);
                loc_10 = loc_10 + 30;
                si = si + 1;
            } while (si < 9);
            loc_10 = loc_10 + 120;
            loc_4 = loc_4 + 1;
        } while (loc_4 < 3);
        loc_12 = loc_12 + 4;
        loc_2 = loc_2 + 1;
        di = di + 15;
    }
    return ax;
}
long far fn_c1e8f(char p0) { return 0; }
