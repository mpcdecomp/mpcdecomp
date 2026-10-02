/* differs: 308 at +5, 1103 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_7B8D;
extern char B_D4C0;
extern char B_D5DD;
extern char B_E421;
extern unsigned char TBL_c60cb[];
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3471();
extern long far far_b6cd3(void far *);
extern long far far_b9045(int, int, int, int);
extern long far far_b90dd(void);
extern int far far_c6547(int);
extern long far far_dac45(int);

long far fn_c5d1b(void)
{
    char loc_30[18];
    char loc_1e[18];
    long loc_c;
    int loc_a;
    long loc_8;
    int loc_6;
    char loc_4;
    char loc_3;
    char loc_2;
    char loc_1;
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
    int dx2;
    int es;
    int p58;
    int p60;
    int p62;
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
    long t13;
    int t14;
    long t15;
    long t16;
    int t17;
    long t18;
    long t19;
    int t2;
    int t20;
    long t21;
    long t22;
    int t23;
    long t3;
    long t4;
    long t5;
    int t6;
    long t7;
    long t8;
    long t9;

    B_D5DD = (char)41;
    far_b1aac();
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x56b1));
    t2 = far_b1ad0(1, 0);
    loc_1 = B_D4C0;
    t3 = far_b9045(loc_1, 1, 17, 16);
    loc_2 = (char)(B_E421 + 1);
    t4 = far_dac45(loc_2 - 1);
    loc_6 = (int)(t4 >> 16);
    *(int *)((char *)&loc_8 + 0) = (int)t4;
    cx = ~__repne_scas1((int)loc_8, 0, -1);
    cx2 = cx >> 1;
    ax2 = loc_6;
    si = *(int *)((char *)&loc_8 + 0);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e), ((long)ax2 << 16 | (unsigned)si), cx2 * 2);
    __movs1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_1e + cx2 * 2)), ((long)ax2 << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    t5 = far_b3471(MK_FP(SEG_DATA, 0x54ee), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e), 16);
    t6 = far_b1ad0(4, 0);
    loc_3 = B_D4C0;
    t7 = far_b9045(loc_3, 4, 17, 16);
    loc_4 = (char)(B_E421 + 1);
    t8 = far_dac45(loc_4 - 1);
    loc_a = (int)(t8 >> 16);
    *(int *)((char *)&loc_c + 0) = (int)t8;
    cx3 = ~__repne_scas1((int)loc_c, 0, -1);
    cx4 = cx3 >> 1;
    ax3 = loc_a;
    si2 = *(int *)((char *)&loc_c + 0);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_30), ((long)ax3 << 16 | (unsigned)si2), cx4 * 2);
    si3 = si2 + cx4 * 2;
    di = (int)(unsigned)(loc_30 + cx4 * 2);
    cx5 = cx3 & 1;
    __movs1(MK_FP(SEG_STACK, di), ((long)ax3 << 16 | (unsigned)si3), cx5);
    si4 = si3 + cx5;
    di2 = di + cx5;
    ds = SEG_DATA;
    p60 = (int)(unsigned)loc_30;
    p62 = ds;
    t9 = far_b3471(0x54ee, p62, MK_FP(SEG_STACK, p60), 16);
    far_b1ad0(6, 0);
    t10 = far_b90dd();
    far_b1ad0(7, 0);
    p58 = 0x56f9;
    ax6 = far_b1b05(MK_FP(ds, p58));
    for (;;) {
        t23 = far_b08f7(1);
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)t23);
        if ((char)t23 != 0) {
            break;
        }
        ax7 = *(char far *)MK_FP(ds, (unsigned)&B_7B8D);
        if (ax7 > 5) {
            continue;
        }
        switch ((unsigned int)(unsigned)(TBL_c60cb + (ax7 << 1))) {
        case 0:
            p58 = 17;
            p60 = 1;
            p62 = loc_1;
            t22 = far_b9045(p62, p60, p58, 16);
            continue;
        case 1:
            p60 = 1;
            p62 = loc_1;
            t18 = far_b9045(p62, p60, 17, 16);
            t19 = far_dac45(loc_2 - 1);
            loc_6 = (int)(t19 >> 16);
            *(int *)((char *)&loc_8 + 0) = (int)t19;
            p58 = (int)(unsigned)loc_1e;
            t20 = __repne_scas1((int)loc_8, 0, -1);
            cx15 = ~t20;
            cx16 = cx15 >> 1;
            ax11 = loc_6;
            si11 = *(int *)((char *)&loc_8 + 0);
            __movs2(MK_FP(SEG_STACK, p58), ((long)ax11 << 16 | (unsigned)si11), cx16 * 2);
            si12 = si11 + cx16 * 2;
            di6 = p58 + cx16 * 2;
            cx17 = cx15 & 1;
            __movs1(MK_FP(SEG_STACK, di6), ((long)ax11 << 16 | (unsigned)si12), cx17);
            si4 = si12 + cx17;
            di2 = di6 + cx17;
            ds = ds;
            t21 = far_b1073(2);
            continue;
        case 2:
            ax10 = loc_6;
            si9 = *(int *)((char *)&loc_8 + 0);
            t17 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e), 0, -1);
            cx12 = ~t17;
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
        case 3:
            p58 = 17;
            p60 = 4;
            p62 = loc_3;
            t16 = far_b9045(p62, p60, p58, 16);
            continue;
        case 4:
            p60 = 4;
            p62 = loc_3;
            t12 = far_b9045(p62, p60, 17, 16);
            t13 = far_dac45(loc_4 - 1);
            loc_a = (int)(t13 >> 16);
            *(int *)((char *)&loc_c + 0) = (int)t13;
            p58 = (int)(unsigned)loc_30;
            t14 = __repne_scas1((int)loc_c, 0, -1);
            cx9 = ~t14;
            cx10 = cx9 >> 1;
            ax9 = loc_a;
            si7 = *(int *)((char *)&loc_c + 0);
            __movs2(MK_FP(SEG_STACK, p58), ((long)ax9 << 16 | (unsigned)si7), cx10 * 2);
            si8 = si7 + cx10 * 2;
            di4 = p58 + cx10 * 2;
            cx11 = cx9 & 1;
            __movs1(MK_FP(SEG_STACK, di4), ((long)ax9 << 16 | (unsigned)si8), cx11);
            si4 = si8 + cx11;
            di2 = di4 + cx11;
            ds = ds;
            t15 = far_b1073(5);
            continue;
        case 5:
            ax8 = loc_a;
            si5 = *(int *)((char *)&loc_c + 0);
            t11 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_30), 0, -1);
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
    }
    if ((char)t23 == 120) {
        es = (int)(loc_c >> 16);
        dx2 = loc_6;
        __movs2(MK_FP(es, (int)loc_c + loc_3 * 24 - 0x30a), ((long)dx2 << 16 | (unsigned)(*(int *)((char *)&loc_8 + 0) + loc_1 * 24 - 0x30a)), 24);
        __movs2(MK_FP(es, *(int *)((char *)&loc_c + 0) + (loc_3 << 2) + 0x5b2), ((long)dx2 << 16 | (unsigned)(*(int *)((char *)&loc_8 + 0) + (loc_1 << 2) + 0x5b2)), 24);
        ax12 = far_c6547(loc_4 - 1);
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)76);
    }
    return ((long)dx << 16 | (unsigned)(char)dx);
}
int far far_c6547(int p0) { return 0; }
