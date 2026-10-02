/* differs: 308 at +3, 76 bytes; 311 at +3, 76 bytes; 312 at +3, 76 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far fn_c1805(int, int);
extern long far fn_c1da7(int);

long far fn_c1326(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int bx;
    int cx;
    int dx;
    int es;
    int p10;
    int p8;
    int si;
    int si2;
    long t1;
    long t2;

    if (arg_0 != 0) {
        si = 0;
        do {
            t1 = fn_c1805(arg_2, si);
            si = si + 1;
        } while (si < 16);
    } else {
        si2 = 0;
        do {
            if (si2 != arg_4) {
                p8 = si2;
                p10 = 0xca37;
                t2 = fn_c1da7(p8);
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                ax = (int)t2;
                dx = (int)(t2 >> 16);
            }
            si2 = si2 + 1;
        } while (si2 < 16);
    }
    return fn_c1805(arg_2, arg_4);
}
long far fn_c1805(int p0, int p1) { return 0; }
long far fn_c1da7(int p0) { return 0; }
