/* differs: 308 at +5, 180 bytes; 311 at +5, 179 bytes; 312 at +5, 179 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern unsigned char B_8C41[];
extern char B_901B;
extern char B_956A;
extern char TBL_90C1[];
extern int W_947E;
extern int W_9480;
extern long far far_deeab(void);
extern int far far_e0031(unsigned char far *);
extern long far far_e51be(long, int, int);
extern long far far_e7644(void);
extern int far fn_e4af3(int, int, int, int, int, int, int);

long far far_e4a4b(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int ax2;
    int bx;
    int cx;
    int dx;
    int es;
    int p10;
    int p12;
    int p14;
    int p16;
    int p18;
    int p20;
    int p22;
    int p24;
    int si2;
    long t1;
    long t2;
    int t3;

    far_e0031((unsigned char far *)B_8C41);
    t1 = far_e7644();
    B_956A = (char)(B_956A + 1);
    p10 = 0;
    p12 = B_8A9F;
    p14 = SEG_DATA;
    p16 = (int)(unsigned)&B_901B;
    t2 = far_e51be(((long)p14 << 16 | (unsigned)p16), p12, p10);
    bx = UNDEF;
    cx = UNDEF;
    es = UNDEF;
    dx = (int)(t2 >> 16);
    if (B_901B < 0) {
        B_956A = (char)(B_956A - 1);
        return ((long)dx << 16 | (unsigned)(int)t2);
    }
    if (arg_0 != 0) {
        ax2 = fn_e4af3(arg_0, W_947E, W_9480, (int)t1, (int)(t1 >> 16), arg_2, arg_4);
    } else {
        si2 = 1;
        while (si2 <= 99) {
            if ((TBL_90C1[si2] & 2) == 2) {
                p10 = 0;
                p12 = 0;
                p14 = (int)(t1 >> 16);
                p16 = (int)t1;
                p18 = W_9480;
                p20 = W_947E;
                p22 = si2;
                p24 = 0xe4dd;
                t3 = fn_e4af3(p22, p20, p18, p16, p14, p12, p10);
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                dx = UNDEF;
            }
            si2 = si2 + 1;
        }
    }
    B_956A = (char)(B_956A - 1);
    return far_deeab();
}
int far fn_e4af3(int p0, int p1, int p2, int p3, int p4, int p5, int p6) { return 0; }
