/* differs: 308 at +5, 689 bytes; 311 at +5, 690 bytes; 312 at +5, 689 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[1];
    int f_2;
};
struct g_TBL_F6C2 {
    int f_0;
};
extern char B_D4BD;
extern char B_F5FE;
extern char B_F5FF;
extern char B_F742;
extern char B_F743;
extern char TBL_F2BA[];
extern char TBL_F2FA[];
extern char TBL_F37A[];
extern char TBL_F3FA[];
extern char TBL_F47A[];
extern char TBL_F4FE[];
extern char TBL_F57E[];
extern char TBL_F602[];
extern char TBL_F642[];
extern char TBL_F682[];
extern struct g_TBL_F6C2 TBL_F6C2;
extern unsigned char TBL_dc021[];
extern int W_9053;
extern int W_D4A6;
extern int W_D4A8;
extern int W_F2B4;
extern int W_F4FA;
extern int W_F4FC;
extern int W_F600;
extern int far far_de4c2(struct s1 far *);

long far far_dbe67(struct s1 far *arg_0, int arg_2, int arg_4, int arg_6)
{
    int loc_2;
    int loc_4;
    char far *loc_6;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    int ax17;
    int ax18;
    int ax19;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    int bx10;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int di;
    int dx;
    int dx10;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int dx7;
    int dx8;
    int dx9;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;

    if (arg_0->f_0 == -1) {
        B_F743 = (char)0;
        return;
    }
    if (W_9053 > 0x3e7) {
        return;
    }
    ax2 = far_de4c2(arg_0);
    loc_2 = ax2;
    bx = loc_2;
    if (bx > 12) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(TBL_dc021 + (bx << 1))) {
    case 0:
        bx10 = FP_OFF(arg_0);
        es9 = FP_SEG(arg_0);
        ax19 = *(int far *)MK_FP(es9, bx10 + 2);
        dx10 = *(int far *)MK_FP(es9, bx10);
        W_F4FC = ax19;
        W_F4FA = dx10;
        return ((long)dx10 << 16 | (unsigned)ax19);
    case 1:
        bx8 = FP_OFF(arg_0);
        es7 = FP_SEG(arg_0);
        ax2 = (unsigned char)*(char far *)MK_FP(es7, bx8 + 2) & 127;
        di = ax2;
        if (arg_6 != 0) {
            ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es7, bx8 + 3));
            if ((char)ax2 <= TBL_F47A[di]) {
                goto L1;
            }
L2:
            bx9 = FP_OFF(arg_0);
            es8 = FP_SEG(arg_0);
            ax13 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es8, bx9));
            ax14 = ((char)(ax13 >> 8) << 8 | (unsigned char)((char)ax13 & 3));
            TBL_F2BA[di] = (char)ax14;
            ax15 = ((char)(ax14 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es8, bx9 + 3));
            TBL_F47A[di] = (char)ax15;
            ax16 = ((char)(ax15 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es8, bx9 + 4));
            TBL_F3FA[di] = (char)ax16;
            ax17 = ((char)(ax16 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es8, bx9 + 5));
            TBL_F37A[di] = (char)ax17;
            ax18 = ((char)(ax17 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es8, bx9 + 6));
            TBL_F2FA[di] = (char)ax18;
            B_D4BD = (char)1;
            return ((long)UNDEF << 16 | (unsigned)ax18);
        }
        goto L2;
    case 2:
        bx7 = FP_OFF(arg_0);
        es6 = FP_SEG(arg_0);
        ax12 = (unsigned char)*(char far *)MK_FP(es6, bx7 + 2) & 127;
        dx9 = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es6, bx7 + 3));
        TBL_F4FE[ax12] = (char)dx9;
        return ((long)dx9 << 16 | (unsigned)ax12);
    case 3:
        bx6 = FP_OFF(arg_0);
        es5 = FP_SEG(arg_0);
        ax11 = (unsigned char)*(char far *)MK_FP(es5, bx6 + 2) & 127;
        dx8 = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es5, bx6 + 3));
        TBL_F57E[ax11] = (char)dx8;
        return ((long)dx8 << 16 | (unsigned)ax11);
    case 4:
        ax10 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)((char far *)arg_0 + 2));
        B_F5FE = (char)ax10;
        return ((long)UNDEF << 16 | (unsigned)ax10);
    case 5:
        ax9 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)((char far *)arg_0 + 2));
        B_F5FF = (char)ax9;
        return ((long)UNDEF << 16 | (unsigned)ax9);
    case 6:
        ax8 = arg_0->f_2;
        W_F600 = ax8;
        return ((long)UNDEF << 16 | (unsigned)ax8);
    case 7:
        ax7 = W_D4A8;
        dx6 = W_D4A6;
        loc_4 = ax7;
        *(int *)((char *)&loc_6 + 0) = dx6;
        dx7 = 0;
        if (dx7 < arg_4) {
            do {
                ax7 = ((char)(ax7 >> 8) << 8 | (unsigned char)arg_0->f_0);
                *loc_6 = (char)ax7;
                *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
                *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + 1;
                dx7 = dx7 + 1;
            } while (dx7 < arg_4);
        }
        W_F2B4 = arg_4;
        return ((long)dx7 << 16 | (unsigned)ax7);
    case 8:
        bx5 = FP_OFF(arg_0);
        es4 = FP_SEG(arg_0);
        ax6 = (unsigned char)*(char far *)MK_FP(es4, bx5 + 7) & 63;
        dx5 = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es4, bx5 + 8));
        TBL_F602[ax6] = (char)dx5;
        return ((long)dx5 << 16 | (unsigned)ax6);
    case 9:
        bx4 = FP_OFF(arg_0);
        es3 = FP_SEG(arg_0);
        ax5 = (unsigned char)*(char far *)MK_FP(es3, bx4 + 7) & 63;
        dx4 = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es3, bx4 + 8));
        TBL_F642[ax5] = (char)dx4;
        return ((long)dx4 << 16 | (unsigned)ax5);
    case 10:
        bx3 = FP_OFF(arg_0);
        es2 = FP_SEG(arg_0);
        ax4 = (unsigned char)*(char far *)MK_FP(es2, bx3 + 7) & 63;
        dx3 = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx3 + 8));
        TBL_F682[ax4] = (char)dx3;
        return ((long)dx3 << 16 | (unsigned)ax4);
    case 11:
        bx2 = FP_OFF(arg_0);
        es = FP_SEG(arg_0);
        ax3 = ((unsigned char)*(char far *)MK_FP(es, bx2 + 7) & 63) << 1;
        dx2 = *(int far *)MK_FP(es, bx2 + 8);
        *(int *)((char *)&TBL_F6C2 + 0 + ax3) = dx2;
        return ((long)dx2 << 16 | (unsigned)ax3);
    case 12:
        B_F742 = (char)0;
L1:
        return ((long)UNDEF << 16 | (unsigned)ax2);
    }
}
