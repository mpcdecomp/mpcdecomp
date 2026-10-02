/* differs: 308 at +5, 380 bytes; 311 at +5, 380 bytes; 312 at +5, 380 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_STACK _SS
struct s1 {
    char f_0;
    char pad_1[1];
    char f_2;
    char f_3;
};
extern char B_7FE4;
extern char B_817F;
extern unsigned char B_8180;
extern unsigned char B_8809;
extern char B_96EE;
extern char B_D4BD;
extern char TBL_966E[];
extern int TBL_A3E7[];
extern char TBL_F2FA[];
extern char TBL_F37A[];
extern char TBL_F3FA[];
extern char TBL_F47A[];
extern int W_8820;
extern int far far_daabc(int);
extern long far far_dbe67(char far *, int, int);
long far far_dbe67(char far *p0, int p1, int p2) { return 0; }

int far far_dc15f(struct s1 far *arg_0, int arg_2, int arg_4)
{
    int loc_c;
    char loc_a;
    char loc_9;
    unsigned char loc_8;
    unsigned char loc_7;
    char loc_6;
    char loc_5;
    char loc_4[4];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int es;
    int es2;
    int si;
    int t1;

    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    loc_c = (unsigned char)*(char far *)MK_FP(es, bx);
    *(char far *)MK_FP(es, bx) = (char)(*(char far *)MK_FP(es, bx) & -16);
    ax = (unsigned char)*(char far *)MK_FP(es, bx);
    if ((unsigned char)(char)ax == 128) {
        ax2 = (unsigned char)arg_0->f_2 & 127;
        si = ax2;
        if (B_96EE == 0) {
            ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_0->f_3);
            TBL_F3FA[si] = (char)ax2;
        } else {
            TBL_966E[si] = (char)0;
        }
        if (B_7FE4 != 0) {
            dx2 = W_8820 - TBL_A3E7[si];
            if (dx2 < 1) {
                dx2 = 1;
            }
            t1 = far_daabc(dx2);
            TBL_F37A[si] = (char)t1;
            ax2 = t1 >> 8;
            TBL_F2FA[si] = (char)ax2;
            B_D4BD = (char)1;
        }
        if (TBL_F47A[si] != -1) {
            B_D4BD = (char)1;
        }
    } else if ((unsigned char)(char)ax == 144) {
        loc_a = (char)(*(char *)((char *)&loc_c + 0) | -104);
        bx2 = FP_OFF(arg_0);
        es2 = FP_SEG(arg_0);
        loc_9 = *(char far *)MK_FP(es2, bx2 + 1);
        loc_8 = *(char far *)MK_FP(es2, bx2 + 2);
        loc_7 = *(char far *)MK_FP(es2, bx2 + 3);
        loc_6 = *(char far *)MK_FP(es2, bx2 + 4);
        TBL_A3E7[loc_8 & 127] = W_8820;
        ax3 = B_8809 - 4;
        dx = ax3;
        if (dx <= 0) {
            dx = 20;
        }
        loc_5 = (char)dx;
        loc_4[0] = (char)0;
        if (B_96EE != 0) {
            ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)arg_0->f_2);
            if (B_817F == 0) {
                ax5 = loc_7;
            } else {
                ax5 = B_8180;
            }
            TBL_966E[(unsigned char)(char)ax4] = (char)ax5;
        }
        ax2 = (int)far_dbe67((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), 7, 0);
    } else {
        ax2 = (int)far_dbe67(arg_0, arg_4, 0);
    }
    ax6 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_c + 0));
    arg_0->f_0 = (char)ax6;
    return ax6;
}
