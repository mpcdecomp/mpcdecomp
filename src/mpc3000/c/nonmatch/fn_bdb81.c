/* differs: 308 at +5, 971 bytes; 311 at +5, 970 bytes; 312 at +5, 970 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern unsigned char TBL_F779[];
extern unsigned char TBL_F77A[];
extern long far far_caade(long);
extern long far far_cace7(int, int, int);
extern long far far_cad00(int);
extern int far far_cad6d(char far *, int, int);
extern long far far_fa0c8(int, int, int);

int far fn_bdb81(int arg_0, int arg_2, char far *arg_4, int arg_6, int far *arg_8)
{
    int loc_24;
    long loc_22;
    int loc_20;
    long loc_1e;
    int loc_1c;
    int loc_1a;
    int loc_18;
    int loc_16;
    long loc_14;
    int loc_12;
    int loc_10;
    int loc_e;
    long loc_c;
    int loc_a;
    int loc_8;
    char loc_6[1];
    char loc_5[5];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    unsigned int ax5;
    int ax6;
    unsigned int ax7;
    int bx;
    int bx2;
    int bx3;
    unsigned int cx;
    int cx2;
    unsigned int cx3;
    int cx4;
    unsigned int cx5;
    unsigned int cx6;
    unsigned int cx7;
    unsigned int cx8;
    int ds;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int si;
    int si2;
    long t1;
    long t10;
    int t11;
    int t12;
    long t13;
    long t14;
    long t15;
    long t16;
    long t2;
    int t3;
    long t4;
    int t5;
    long t6;
    int t7;
    long t8;
    long t9;

    t1 = far_cad00(0);
    t2 = far_caade(*(long *)((char *)&arg_0 + 0));
    loc_8 = (int)t2;
    if ((int)t2 < 0) {
        return (int)t2;
    }
    t3 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), loc_8, 6);
    if (t3 != 0) {
        return t3;
    }
    *arg_8 = loc_5[0];
    if (loc_5[0] != 3) {
        loc_1a = 202;
    } else {
        loc_1a = 0x151;
    }
    loc_12 = 0;
    *(int *)((char *)&loc_14 + 0) = 6;
    ds = SEG_DATA;
    for (;;) {
        t11 = far_cad6d((unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_F779), loc_8, 1);
        if (t11 != 0) {
            break;
        }
        if (*(char far *)MK_FP(ds, (unsigned)&TBL_F779) == -1) {
            goto L1;
        }
        t12 = far_cad6d((unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_F77A), loc_8, loc_1a - 1);
        if (t12 != 0) {
            goto L2;
        }
        if (loc_5[0] != 3) {
            loc_1c = ds;
            *(int *)((char *)&loc_1e + 0) = (int)(unsigned)TBL_F779;
            bx2 = (int)loc_1e;
            es3 = (int)(loc_1e >> 16);
            dx3 = *(int far *)MK_FP(es3, bx2 + 1);
            loc_e = *(int far *)MK_FP(es3, bx2 + 3) & 255;
            loc_10 = dx3;
            loc_16 = *(char far *)MK_FP(es3, bx2 + 201);
            loc_18 = *(char far *)MK_FP(es3, bx2 + 200);
            loc_24 = *(char far *)MK_FP(es3, bx2);
            if ((unsigned int)loc_24 >= 100) {
                loc_24 = 1;
            }
            t6 = (long)(int)loc_24 * 23L;
            dx4 = arg_6;
            si2 = *(int *)((char *)&arg_4 + 0) + (int)t6;
            es4 = (int)(loc_1e >> 16);
            t7 = __repne_scas1(MK_FP(es4, (int)loc_1e + 7), 0, -1);
            cx3 = ~t7;
            cx4 = cx3 >> 1;
            __movs2(((long)dx4 << 16 | (unsigned)si2), MK_FP(es4, si2), cx4 * 2);
            __movs1(((long)dx4 << 16 | (unsigned)(si2 + cx4 * 2)), MK_FP(es4, si2 + cx4 * 2), cx3 & 1);
            ds = ds;
            t8 = (long)(int)loc_24 * 23L;
            arg_4[(int)t8 + 16] = (char)0;
        } else {
            loc_20 = ds;
            *(int *)((char *)&loc_22 + 0) = (int)(unsigned)TBL_F779;
            bx = (int)loc_22;
            es = (int)(loc_22 >> 16);
            dx = *(int far *)MK_FP(es, bx + 1);
            loc_e = *(int far *)MK_FP(es, bx + 3);
            loc_10 = dx;
            loc_16 = *(char far *)MK_FP(es, bx + 0x150);
            loc_18 = *(char far *)MK_FP(es, bx + 0x14f);
            loc_24 = *(char far *)MK_FP(es, bx);
            if ((unsigned int)loc_24 >= 100) {
                loc_24 = 1;
            }
            t4 = (long)(int)loc_24 * 23L;
            dx2 = arg_6;
            si = *(int *)((char *)&arg_4 + 0) + (int)t4;
            es2 = (int)(loc_22 >> 16);
            t5 = __repne_scas1(MK_FP(es2, (int)loc_22 + 9), 0, -1);
            cx = ~t5;
            cx2 = cx >> 1;
            __movs2(((long)dx2 << 16 | (unsigned)si), MK_FP(es2, si), cx2 * 2);
            __movs1(((long)dx2 << 16 | (unsigned)(si + cx2 * 2)), MK_FP(es2, si + cx2 * 2), cx & 1);
            ds = ds;
        }
        if (loc_5[0] != 1) {
            ax2 = loc_16;
            t10 = far_fa0c8(24, ax2, -(ax2 < 0));
            cx7 = loc_10;
            cx8 = cx7 + (int)t10;
            loc_a = loc_e + (int)(t10 >> 16) + (cx8 < cx7);
            *(int *)((char *)&loc_c + 0) = cx8;
        } else {
            ax = loc_16;
            t9 = far_fa0c8(21, ax, -(ax < 0));
            cx5 = loc_10;
            cx6 = cx5 + (int)t9;
            loc_a = loc_e + (int)(t9 >> 16) + (cx6 < cx5);
            *(int *)((char *)&loc_c + 0) = cx6;
        }
        ax3 = loc_18;
        t13 = far_fa0c8(6, ax3, -(ax3 < 0));
        *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) + (int)t13;
        loc_a = (int)(loc_c + t13 >> 16);
        ax4 = loc_1a;
        ax5 = ax4 + *(int *)((char *)&loc_c + 0);
        t14 = (((long)(-(ax4 < 0) + loc_a + (ax5 < (unsigned int)ax4)) << 16 | (unsigned)ax5) + 0x3ffL) / 0x400L;
        t15 = (long)(int)loc_24 * 23L;
        es5 = FP_SEG(arg_4);
        *(int far *)MK_FP(es5, FP_OFF(arg_4) + (int)t15 + 17) = (int)t14;
        bx3 = *(int *)((char *)&arg_4 + 0) + (int)t15;
        *(int far *)MK_FP(es5, bx3 + 21) = loc_12;
        *(int far *)MK_FP(es5, bx3 + 19) = *(int *)((char *)&loc_14 + 0);
        ax6 = loc_1a;
        ax7 = ax6 + *(int *)((char *)&loc_c + 0);
        *(int *)((char *)&loc_14 + 0) = *(int *)((char *)&loc_14 + 0) + ax7;
        loc_12 = (int)(loc_14 + ((long)(-(ax6 < 0) + loc_a + (ax7 < (unsigned int)ax6)) << 16 | (unsigned)ax7) >> 16);
        t16 = far_cace7(loc_8, *(int *)((char *)&loc_14 + 0), loc_12);
        if ((int)t16 != 0) {
            goto L3;
        }
    }
    return t11;
L3:
    return (int)t16;
L2:
    return t12;
L1:
    return loc_8;
}
