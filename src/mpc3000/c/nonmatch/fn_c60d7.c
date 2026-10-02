/* differs: 308 at +5, 902 bytes; 311 at +5, 908 bytes; 312 at +5, 908 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_7B8D;
extern char B_D5DD;
extern char B_E421;
extern unsigned char TBL_c6371[];
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3471(void far *, char far *, int);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern int far far_c6547(int);
extern long far far_dac45(int);

long far fn_c60d7(void)
{
    char loc_1;
    char loc_2;
    char loc_1c[26];
    char loc_2e[18];
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    unsigned int ax7;
    int ax8;
    int ax9;
    unsigned int cx;
    int cx10;
    int cx11;
    unsigned int cx12;
    int cx13;
    int cx14;
    unsigned int cx15;
    int cx16;
    int cx17;
    int cx2;
    unsigned int cx3;
    int cx4;
    int cx5;
    unsigned int cx6;
    int cx7;
    int cx8;
    unsigned int cx9;
    int di;
    int di2;
    int di3;
    int di4;
    int di5;
    int di6;
    int ds;
    int dx;
    int p56;
    int si;
    int si10;
    int si11;
    int si12;
    int si2;
    int si3;
    int si4;
    int si5;
    int si6;
    int si7;
    int si8;
    int si9;
    long t1;
    long t10;
    int t11;
    long t12;
    int t13;
    long t14;
    int t15;
    long t16;
    int t17;
    long t18;
    int t19;
    int t2;
    long t3;
    long t4;
    long t5;
    int t6;
    long t7;
    long t8;
    long t9;

    B_D5DD = (char)42;
    far_b1aac();
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x5701));
    t2 = far_b1ad0(1, 0);
    loc_1 = (char)(B_E421 + 1);
    t3 = far_b3819(MK_FP(SEG_DATA, 0x571b), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 2, 1, 24, 8);
    t4 = far_dac45(loc_1 - 1);
    *(int *)((char *)&loc_1c + 24) = (int)(t4 >> 16);
    *(int *)((char *)&loc_1c + 22) = (int)t4;
    cx = ~__repne_scas1((int)*(long *)((char *)&loc_1c + 22), 0, -1);
    cx2 = cx >> 1;
    ax2 = *(int *)((char *)&loc_1c + 24);
    si = *(int *)((char *)&loc_1c + 22);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), ((long)ax2 << 16 | (unsigned)si), cx2 * 2);
    __movs1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_1c + cx2 * 2)), ((long)ax2 << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    t5 = far_b3471(MK_FP(SEG_DATA, 0x54ee), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), 16);
    t6 = far_b1ad0(2, 0);
    loc_2 = (char)(B_E421 + 1);
    t7 = far_b3819(MK_FP(SEG_DATA, 0x572e), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 1, 24, 8);
    t8 = far_dac45(loc_2 - 1);
    *(int *)((char *)&loc_1c + 20) = (int)(t8 >> 16);
    *(int *)((char *)&loc_1c + 18) = (int)t8;
    cx3 = ~__repne_scas1((int)*(long *)((char *)&loc_1c + 18), 0, -1);
    cx4 = cx3 >> 1;
    ax3 = *(int *)((char *)&loc_1c + 20);
    si2 = *(int *)((char *)&loc_1c + 18);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2e), ((long)ax3 << 16 | (unsigned)si2), cx4 * 2);
    si3 = si2 + cx4 * 2;
    di = (int)(unsigned)(loc_2e + cx4 * 2);
    cx5 = cx3 & 1;
    __movs1(MK_FP(SEG_STACK, di), ((long)ax3 << 16 | (unsigned)si3), cx5);
    si4 = si3 + cx5;
    di2 = di + cx5;
    ds = SEG_DATA;
    t9 = far_b3471(MK_FP(ds, 0x54ee), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2e), 16);
    far_b1ad0(6, 0);
    t10 = far_b90dd();
    far_b1ad0(7, 0);
    p56 = 0x56f9;
    ax6 = far_b1b05(MK_FP(ds, p56));
    for (;;) {
        t19 = far_b08f7(1);
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)t19);
        if ((char)t19 == 0) {
            ax7 = *(char far *)MK_FP(ds, (unsigned)&B_7B8D);
            if (ax7 > 3) {
                continue;
            }
            switch ((unsigned int)(unsigned)(TBL_c6371 + (ax7 << 1))) {
            case 0:
                t16 = far_dac45(loc_1 - 1);
                *(int *)((char *)&loc_1c + 24) = (int)(t16 >> 16);
                *(int *)((char *)&loc_1c + 22) = (int)t16;
                p56 = (int)(unsigned)loc_1c;
                t17 = __repne_scas1((int)*(long *)((char *)&loc_1c + 22), 0, -1);
                cx15 = ~t17;
                cx16 = cx15 >> 1;
                ax11 = *(int *)((char *)&loc_1c + 24);
                si11 = *(int *)((char *)&loc_1c + 22);
                __movs2(MK_FP(SEG_STACK, p56), ((long)ax11 << 16 | (unsigned)si11), cx16 * 2);
                si12 = si11 + cx16 * 2;
                di6 = p56 + cx16 * 2;
                cx17 = cx15 & 1;
                __movs1(MK_FP(SEG_STACK, di6), ((long)ax11 << 16 | (unsigned)si12), cx17);
                si4 = si12 + cx17;
                di2 = di6 + cx17;
                ds = ds;
                t18 = far_b1073(1);
                continue;
            case 1:
                ax10 = *(int *)((char *)&loc_1c + 24);
                si9 = *(int *)((char *)&loc_1c + 22);
                t15 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), 0, -1);
                cx12 = ~t15;
                cx13 = cx12 >> 1;
                __movs2(((long)ax10 << 16 | (unsigned)si9), MK_FP(SEG_STACK, si9), cx13 * 2);
                si10 = si9 + cx13 * 2;
                di5 = si9 + cx13 * 2;
                cx14 = cx12 & 1;
                __movs1(((long)ax10 << 16 | (unsigned)di5), MK_FP(SEG_STACK, si10), cx14);
                si4 = si10 + cx14;
                di2 = di5 + cx14;
                ds = ds;
                continue;
            case 2:
                t12 = far_dac45(loc_2 - 1);
                *(int *)((char *)&loc_1c + 20) = (int)(t12 >> 16);
                *(int *)((char *)&loc_1c + 18) = (int)t12;
                p56 = (int)(unsigned)loc_2e;
                t13 = __repne_scas1((int)*(long *)((char *)&loc_1c + 18), 0, -1);
                cx9 = ~t13;
                cx10 = cx9 >> 1;
                ax9 = *(int *)((char *)&loc_1c + 20);
                si7 = *(int *)((char *)&loc_1c + 18);
                __movs2(MK_FP(SEG_STACK, p56), ((long)ax9 << 16 | (unsigned)si7), cx10 * 2);
                si8 = si7 + cx10 * 2;
                di4 = p56 + cx10 * 2;
                cx11 = cx9 & 1;
                __movs1(MK_FP(SEG_STACK, di4), ((long)ax9 << 16 | (unsigned)si8), cx11);
                si4 = si8 + cx11;
                di2 = di4 + cx11;
                ds = ds;
                t14 = far_b1073(3);
                continue;
            case 3:
                ax8 = *(int *)((char *)&loc_1c + 20);
                si5 = *(int *)((char *)&loc_1c + 18);
                t11 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2e), 0, -1);
                cx6 = ~t11;
                cx7 = cx6 >> 1;
                __movs2(((long)ax8 << 16 | (unsigned)si5), MK_FP(SEG_STACK, si5), cx7 * 2);
                si6 = si5 + cx7 * 2;
                di3 = si5 + cx7 * 2;
                cx8 = cx6 & 1;
                __movs1(((long)ax8 << 16 | (unsigned)di3), MK_FP(SEG_STACK, si6), cx8);
                si4 = si6 + cx8;
                di2 = di3 + cx8;
                ds = ds;
                continue;
            }
        } else {
            break;
        }
    }
    if ((char)t19 == 120) {
        __movs2(*(long *)((char *)&loc_1c + 18), *(long *)((char *)&loc_1c + 22), 0x77e);
        ax12 = far_c6547(loc_2 - 1);
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)76);
    }
    return ((long)dx << 16 | (unsigned)(char)dx);
}
int far far_c6547(int p0) { return 0; }
