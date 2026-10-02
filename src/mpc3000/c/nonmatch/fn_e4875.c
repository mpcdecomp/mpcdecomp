/* differs: 308 at +5, 196 bytes; 311 at +5, 196 bytes; 312 at +5, 196 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_W_903D {
    long f_0;
};
extern char B_956A;
extern unsigned char B_F77C;
extern unsigned char B_F77D;
extern unsigned char TBL_F779;
extern unsigned char TBL_F77A[];
extern struct g_W_903D W_903D;
extern int W_903F;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daabc(int);

void far fn_e4875(int arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    int far *loc_6;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int t1;
    long t2;
    long t3;
    long t4;

    loc_4 = SEG_DATA;
    *(int *)((char *)&loc_6 + 0) = (int)(unsigned)TBL_F77A;
    B_956A = (char)(B_956A + 1);
    while (arg_0 >= 0) {
        loc_2 = (int)far_d97ca(3, (unsigned char far *)&TBL_F779, 0x640);
        ax = TBL_F779 & 248;
        if (ax != 168) {
            if (ax != 248) {
                goto L1;
            }
            arg_0 = arg_0 - 1;
            continue;
        }
        ax2 = arg_2;
        arg_2 = arg_2 + 1;
        t1 = far_daabc(ax2);
        *loc_6 = t1;
        t2 = (long)(int)B_F77C * 0x180L;
        t3 = (long)(int)(int)t2;
        ax3 = (int)(t3 / (long)(int)B_F77D);
        *(int *)((char *)&W_903D + 0) = *(int *)((char *)&W_903D + 0) + ax3;
        W_903F = (int)(W_903D.f_0 + (long)(int)ax3 >> 16);
        ax4 = arg_0;
        arg_0 = arg_0 - 1;
        if (ax4 == 0) {
            continue;
        }
L1:
        t4 = far_d9b6e(1, (unsigned char far *)&TBL_F779, loc_2);
    }
    B_956A = (char)(B_956A - 1);
    return;
}
