/* differs: 308 at +5, 315 bytes; 311 at +5, 401 bytes; 312 at +5, 401 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[3];
    char f_3;
};
extern char B_D4B5;
extern char B_EFDA;
extern char far *FP_E40C;
extern int TBL_1405[];
extern unsigned char TBL_159B[];
extern unsigned char TBL_c17f1[];
extern long far far_b133a(long, int, char, int, int);
extern long far far_cbbd4(int);
extern int far far_dab06(int);

long far fn_c1680(int arg_0)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    long loc_c;
    int ax;
    int ax10;
    int ax11;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    int bx2;
    int di;
    int es;
    int si;
    int si2;
    struct s1 far *t1;
    long t2;

    t1 = (struct s1 far *)far_cbbd4(far_dab06(arg_0 + B_D4B5));
    si = (unsigned char)t1->f_3 & 15;
    di = 0;
    ax = (unsigned char)*(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + -778 + far_dab06(arg_0 + B_D4B5) * 24);
    loc_4 = ax;
    if (ax != 255) {
        di = (unsigned char)*(char far *)MK_FP(0xa853 /* SEG_A28F */, ax * 36 + 0x4813);
    }
    loc_6 = SEG_DATA;
    loc_8 = (int)(unsigned)TBL_159B;
    loc_2 = arg_0 * 15;
    bx = si;
    if (bx <= 9) {
        switch ((unsigned int)(unsigned)(TBL_c17f1 + (bx << 1))) {
        case 0:
            si = 16;
            break;
        case 1:
            if (di != 0) {
                ax9 = 17;
            } else {
                ax9 = 2;
            }
            si = ax9;
            break;
        case 2:
            if (di != 0) {
                ax8 = 17;
            } else {
                ax8 = 3;
            }
            si = ax8;
            break;
        case 3:
            if (di != 0) {
                ax7 = 18;
            } else {
                ax7 = 4;
            }
            si = ax7;
            break;
        case 4:
            if (di != 0) {
                ax6 = 18;
            } else {
                ax6 = 5;
            }
            si = ax6;
            break;
        case 5:
            if (di != 0) {
                ax5 = 19;
            } else {
                ax5 = 6;
            }
            si = ax5;
            break;
        case 6:
            if (di != 0) {
                ax4 = 19;
            } else {
                ax4 = 7;
            }
            si = ax4;
            break;
        case 7:
            if (di != 0) {
                ax3 = 20;
            } else {
                ax3 = 8;
            }
            si = ax3;
            break;
        case 8:
            if (di != 0) {
                ax2 = 20;
            } else {
                ax2 = 9;
            }
            si = ax2;
            break;
        case 9:
            si = 15;
            break;
        }
    }
    ax10 = TBL_1405[si];
    loc_a = SEG_DATA;
    *(int *)((char *)&loc_c + 0) = ax10;
    si2 = 0;
    do {
        ax11 = ((char)(ax10 >> 8) << 8 | (unsigned char)B_EFDA);
        bx2 = (int)loc_c;
        es = (int)(loc_c >> 16);
        *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) + 1;
        t2 = far_b133a(*(long *)((char *)&loc_8 + 0), loc_2, *(char far *)MK_FP(es, bx2), 5, ax11);
        ax10 = (int)t2;
        loc_8 = loc_8 + 30;
        si2 = si2 + 1;
    } while (si2 < 9);
    return (long)MK_FP((int)(t2 >> 16), ax10);
}
