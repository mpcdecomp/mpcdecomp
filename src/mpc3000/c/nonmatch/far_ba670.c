/* differs: 308 at +5, 1093 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_977E;
extern char B_977F;
extern char B_E421;
extern char FP_E40C[];
extern unsigned char TBL_baa33[];
extern unsigned char TBL_baa3b[];
extern unsigned char TBL_baa45[];
extern void far far_b05a7(void);
extern int far far_b08f7(void);
extern long far far_b1073(void);
extern long far far_b1259(int, int);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b362e(void far *, char far *, void far *);
extern long far far_b3723(void far *, int far *, int, long, int, int);
extern long far far_b3819(void far *, char far *, int, int, int);
extern long far far_b6cd3(int);
extern long far far_b9045(int, int, int);
extern long far far_b90dd(void);
extern int far far_c6547(void);

long far far_ba670(void)
{
    int loc_e;
    char loc_c[3];
    char loc_9;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    unsigned int ax10;
    int ax11;
    int ax12;
    unsigned int ax13;
    int ax14;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    unsigned int ax9;
    int bx;
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
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    int si;
    long t1;
    int t10;
    int t11;
    long t12;
    int t13;
    long t14;
    int t15;
    long t16;
    int t17;
    long t18;
    int t19;
    long t2;
    long t3;
    long t4;
    int t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_b6cd3(0x38a1);
    far_b1ad0(1);
    far_b1b05(0x3868);
    far_b1ad0(2);
    far_b1b05(0x386e);
    far_b1ad0(3);
    far_b1b05(0x38c1);
    far_b1ad0(3);
    far_b1b05(0x38cc);
    dx = (int)(far_b90dd() >> 16);
    si = 1;
    for (;;) {
L1:
        if (si != 1) {
            break;
        }
        far_b05a7();
        loc_9 = (char)(B_E421 + 1);
        t12 = far_b3819(MK_FP(SEG_DATA, 0x3820), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_9), 2, 1, 24);
        t13 = far_b1ad0(1);
        B_977F = *(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + 17);
        t14 = far_b9045(B_977F, 1, 7);
        t15 = far_b1ad0(2);
        B_977E = (char)0;
        if (B_977F >= 35) {
            t2 = (long)(signed char)B_977F * 24L;
            B_977E = *(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + -755 + (int)t2);
        }
        t16 = far_b362e(MK_FP(SEG_DATA, 0x3820), (char far *)&B_977E, MK_FP(SEG_DATA, 0x234));
        ax9 = B_977E;
        if (ax9 <= 3) {
            switch ((unsigned int)(unsigned)(TBL_baa45 + (ax9 << 1))) {
            case 0:
                bx4 = (int)*(long *)((char *)&FP_E40C + 0);
                es4 = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
                loc_4 = *(char far *)MK_FP(es4, bx4 + 18);
                loc_6 = *(char far *)MK_FP(es4, bx4 + 19);
                di = -120;
                loc_8 = 120;
                *(int *)((char *)&loc_c + 0) = 0;
                loc_e = 0;
                break;
            case 1:
                bx3 = (int)*(long *)((char *)&FP_E40C + 0);
                es3 = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
                loc_4 = *(char far *)MK_FP(es3, bx3 + 20);
                loc_6 = *(char far *)MK_FP(es3, bx3 + 21);
                di = 0;
                loc_8 = 100;
                *(int *)((char *)&loc_c + 0) = 0xe31f /* SEG_DA7E */;
                loc_e = 207;
                break;
            case 2:
                bx2 = (int)*(long *)((char *)&FP_E40C + 0);
                es2 = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
                loc_4 = *(char far *)MK_FP(es2, bx2 + 22);
                loc_6 = *(char far *)MK_FP(es2, bx2 + 23);
                di = 0;
                loc_8 = 100;
                *(int *)((char *)&loc_c + 0) = 0xe31f /* SEG_DA7E */;
                loc_e = 207;
                break;
            case 3:
                bx = (int)*(long *)((char *)&FP_E40C + 0);
                es = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
                loc_4 = *(char far *)MK_FP(es, bx + 24);
                loc_6 = *(char far *)MK_FP(es, bx + 25);
                di = -50;
                loc_8 = 50;
                *(int *)((char *)&loc_c + 0) = 0;
                loc_e = 0;
                break;
            }
        }
        t17 = far_b1ad0(3);
        t18 = far_b3723(MK_FP(SEG_DATA, 0x3820), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 4, ((long)loc_8 << 16 | (unsigned)di), 0, loc_e);
        t19 = far_b1ad0(3);
        dx = (int)(far_b3723(MK_FP(SEG_DATA, 0x3820), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 4, ((long)loc_8 << 16 | (unsigned)di), 0, loc_e) >> 16);
        if (B_977E == 2 || B_977E == 1) {
            t3 = far_b1259(3, 207);
            t4 = far_b1259(4, 207);
            dx = (int)(t4 >> 16);
        }
        si = 0;
        loc_2 = 0;
        for (;;) {
            if (si != 0) {
                goto L1;
            }
            t5 = far_b08f7();
            dx = UNDEF;
            loc_2 = t5;
            if (t5 != 0) {
                goto L1;
            }
            ax10 = B_7B8D;
            if (ax10 > 4) {
                continue;
            }
            switch ((unsigned int)(unsigned)(TBL_baa3b + (ax10 << 1))) {
            case 0:
                t10 = far_c6547();
                dx = UNDEF;
                si = 1;
                continue;
            case 1:
                bx9 = (int)*(long *)((char *)&FP_E40C + 0);
                es9 = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
                ax14 = ((char)(ax10 >> 8) << 8 | (unsigned char)B_977F);
                *(char far *)MK_FP(es9, bx9 + 17) = (char)ax14;
                if (B_977F >= 35) {
                    t9 = (long)(signed char)(char)ax14 * 24L;
                    dx = (int)(t9 >> 16);
                    B_977E = *(char far *)MK_FP(es9, bx9 + (int)t9 - 0x2f3);
                }
                si = 1;
                continue;
            case 2:
                if (B_977F >= 35) {
                    t8 = (long)(signed char)B_977F * 24L;
                    dx = (int)(t8 >> 16);
                    *(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + -755 + (int)t8) = B_977E;
                }
                si = 1;
                continue;
            case 3:
                ax11 = loc_4;
                if (ax11 > loc_6) {
                    loc_6 = ax11;
                }
                t6 = far_b1073();
L2:
                ax12 = loc_6;
                if (ax12 < loc_4) {
                    loc_4 = ax12;
                }
                t7 = far_b1073();
                dx = (int)(t7 >> 16);
                ax13 = B_977E;
                if (ax13 > 3) {
                    continue;
                }
                switch ((unsigned int)(unsigned)(TBL_baa33 + (ax13 << 1))) {
                case 0:
                    bx8 = (int)*(long *)((char *)&FP_E40C + 0);
                    es8 = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
                    *(char far *)MK_FP(es8, bx8 + 18) = *(char *)((char *)&loc_4 + 0);
                    *(char far *)MK_FP(es8, bx8 + 19) = *(char *)((char *)&loc_6 + 0);
                    continue;
                case 1:
                    bx7 = (int)*(long *)((char *)&FP_E40C + 0);
                    es7 = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
                    *(char far *)MK_FP(es7, bx7 + 20) = *(char *)((char *)&loc_4 + 0);
                    *(char far *)MK_FP(es7, bx7 + 21) = *(char *)((char *)&loc_6 + 0);
                    continue;
                case 2:
                    bx6 = (int)*(long *)((char *)&FP_E40C + 0);
                    es6 = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
                    *(char far *)MK_FP(es6, bx6 + 22) = *(char *)((char *)&loc_4 + 0);
                    *(char far *)MK_FP(es6, bx6 + 23) = *(char *)((char *)&loc_6 + 0);
                    continue;
                case 3:
                    bx5 = (int)*(long *)((char *)&FP_E40C + 0);
                    es5 = (int)(*(long *)((char *)&FP_E40C + 0) >> 16);
                    *(char far *)MK_FP(es5, bx5 + 24) = *(char *)((char *)&loc_4 + 0);
                    *(char far *)MK_FP(es5, bx5 + 25) = *(char *)((char *)&loc_6 + 0);
                    continue;
                }
            case 4:
                goto L2;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)loc_2);
}
