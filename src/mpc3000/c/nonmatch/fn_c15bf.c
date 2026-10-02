/* differs: 308 at +5, 181 bytes; 311 at +5, 206 bytes; 312 at +5, 206 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[2];
    char f_2;
};
extern char B_D4B5;
extern char B_EFDA;
extern long far far_b133a(long, int, int, int, char);
extern long far far_cbbd4(int);
extern int far far_dab06(int);

long far fn_c15bf(int arg_0)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    int ax;
    int ax2;
    int dx;
    int si2;
    int si3;
    struct s1 far *t1;
    long t2;

    ax = far_dab06(arg_0 + B_D4B5);
    dx = UNDEF;
    loc_6 = ax;
    if (ax >= 35) {
        t1 = (struct s1 far *)far_cbbd4(loc_6);
        loc_4 = (unsigned char)t1->f_2;
        loc_2 = arg_0 * 15 + 7;
        loc_8 = SEG_DATA;
        loc_a = 0x177b;
        t2 = (long)(int)loc_4 * 12L;
        ax2 = (int)t2 / 25;
        dx = (int)t2 % 25;
        si2 = 0;
        for (;;) {
            ax = 48 - ax2;
            if (ax <= si2) {
                break;
            }
            dx = (int)(far_b133a(*(long *)((char *)&loc_a + 0), loc_2, 0, 3, B_EFDA) >> 16);
            loc_a = loc_a + 30;
            si2 = si2 + 1;
        }
        si3 = 0;
        if (si3 < ax2) {
            for (;;) {
                ax = (int)far_b133a(*(long *)((char *)&loc_a + 0), loc_2, 7, 3, B_EFDA);
                dx = ax;
                if (dx != 0) {
                    loc_a = loc_a + 30;
                    si3 = si3 + 1;
                    if (si3 >= ax2) {
                        break;
                    }
                    continue;
                }
                break;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
