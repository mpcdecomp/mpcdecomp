/* differs: 308 at +5, 216 bytes; 311 at +5, 212 bytes; 312 at +5, 213 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[16];
    char f_10;
};
extern int W_3C82;
extern int W_3C84;
extern long far fn_babfb(long);
long far fn_babfb(long p0) { return 0; }

long far fn_bac31(int arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    char loc_5;
    char loc_8[3];
    struct s1 far *loc_a;
    int loc_c;
    int loc_e;
    int ax;
    int ax2;
    int bx;
    int bx2;
    int cx;
    int di;
    int dx;
    int dx2;
    int es;
    int p22;
    int p24;
    int p26;
    int si;
    long t1;

    loc_2 = 150;
    loc_4 = 64;
    loc_5 = (char)115;
    ax = W_3C84;
    dx = W_3C82;
    *(int *)((char *)&loc_8 + 0) = ax;
    *(int *)((char *)&loc_a + 0) = dx;
    if (loc_a->f_10 == -1) {
        *(int *)((char *)&loc_8 + 0) = ax;
        *(int *)((char *)&loc_a + 0) = dx + 0x1400;
        loc_4 = 0x1fe;
        loc_5 = (char)-13;
        loc_2 = 192;
    }
    di = 0;
    si = di;
    p22 = *(int *)((char *)&loc_a + 0);
    dx2 = p22 + si * 24;
    loc_c = dx2;
    ax2 = arg_0;
    loc_e = ax2;
    if (si < loc_4) {
        do {
            bx = loc_c;
            ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(*(int *)((char *)&loc_8 + 0), bx + 16));
            if ((char)ax2 == loc_5) {
                p22 = *(int *)((char *)&loc_8 + 0);
                p24 = bx;
                p26 = 0xc4a9;
                t1 = fn_babfb(((long)p22 << 16 | (unsigned)p24));
                cx = UNDEF;
                *(int far *)MK_FP(*(int *)((char *)&loc_8 + 0), loc_c + 14) = loc_2;
                ax2 = *(int *)((char *)&loc_8 + 0);
                dx2 = loc_c;
                es = arg_2;
                bx2 = loc_e;
                *(int far *)MK_FP(es, bx2 + 2) = ax2;
                *(int far *)MK_FP(es, bx2) = dx2;
                loc_e = loc_e + 4;
                di = di + 1;
            }
            loc_c = loc_c + 24;
            si = si + 1;
        } while (si < loc_4);
    }
    return ((long)dx2 << 16 | (unsigned)di);
}
