/* differs: 308 at +5, 1222 bytes; 311 at +5, 1222 bytes; 312 at +5, 1220 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_F01A[];
extern int far far_cb566();
extern long far far_cd68a();
extern long far fn_c3408();
extern long far fn_c3485();
extern long far fn_c352d();
extern int far fn_c35f3();
long far fn_c3408(int p0, int p1, long p2) { return 0; }
long far fn_c3485(int p0, int p1, long far *p2) { return 0; }
long far fn_c352d(long p0, long p1) { return 0; }
int far fn_c35f3(int p0, int p1, int p2, int p3, int p4, int p5, int p6, int p7, long p8, long p9, int p10, int p11) { return 0; }

long far fn_c3690(int arg_0, int arg_2, int arg_4, int arg_6, long arg_8, int arg_10, int arg_12, int arg_14, int arg_16, int arg_18, int arg_20)
{
    char loc_4[4];
    char loc_c[8];
    char loc_10[4];
    char loc_14[4];
    long loc_40;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int cx;
    int cx2;
    int cx3;
    int dx10;
    int dx11;
    int dx12;
    int dx13;
    int dx14;
    unsigned int dx15;
    unsigned int dx16;
    int dx17;
    int dx18;
    int dx19;
    int dx2;
    int dx20;
    int dx21;
    int dx22;
    int dx3;
    unsigned int dx4;
    unsigned int dx5;
    int dx6;
    int dx7;
    unsigned int dx8;
    unsigned int dx9;
    int es;
    int flags;
    int flags2;
    int p100;
    int p72;
    int p74;
    int p76;
    int p78;
    int p80;
    int p82;
    int p84;
    int p86;
    int p88;
    int p90;
    int p92;
    int p94;
    int p96;
    int p98;
    int si;
    long t1;
    int t10;
    long t11;
    long t12;
    int t13;
    int t14;
    long t2;
    long t3;
    int t4;
    long t5;
    int t6;
    int t7;
    long t8;
    long t9;

    *(int *)((char *)&loc_40 + 22) = arg_14;
    *(int *)((char *)&loc_40 + 20) = arg_12;
    dx2 = arg_4;
    *(int *)((char *)&loc_40 + 18) = arg_6;
    *(int *)((char *)&loc_40 + 16) = dx2;
    dx3 = arg_16;
    *(int *)((char *)&loc_40 + 26) = arg_18;
    *(int *)((char *)&loc_40 + 24) = dx3;
    ax = arg_2;
    dx4 = arg_0;
    *(int *)((char *)&loc_40 + 14) = ax;
    *(int *)((char *)&loc_40 + 12) = dx4;
    dx5 = dx4 + arg_4;
    *(int *)((char *)&loc_40 + 2) = ax + arg_6 + (dx5 < dx4);
    *(int *)((char *)&loc_40 + 0) = dx5;
    dx6 = *(int *)((char *)&arg_8 + 0);
    *(int *)((char *)&loc_40 + 6) = arg_10;
    *(int *)((char *)&loc_40 + 4) = dx6;
    dx7 = *(int *)((char *)&loc_40 + 0);
    ax2 = (int)(((long)*(int *)((char *)&loc_40 + 2) << 16 | (unsigned)dx7) - arg_8 >> 16);
    flags = ax2 - arg_14;
    if (!CC("<", flags) && (CC("!=", flags) || (unsigned int)(dx7 - *(int *)((char *)&arg_8 + 0)) >= (unsigned int)arg_12)) {
        return arg_8;
    }
    dx8 = *(int *)((char *)&loc_40 + 12);
    dx9 = dx8 + *(int *)((char *)&loc_40 + 20);
    cx = *(int *)((char *)&loc_40 + 0);
    cx2 = cx - *(int *)((char *)&loc_40 + 4);
    *(int *)((char *)&loc_40 + 10) = (int)(((long)(*(int *)((char *)&loc_40 + 14) + *(int *)((char *)&loc_40 + 22) + (dx9 < dx8)) << 16 | (unsigned)dx9) - (long)MK_FP((int)(((long)*(int *)((char *)&loc_40 + 2) << 16 | (unsigned)cx) - *(long *)((char *)&loc_40 + 4) >> 16), cx2) >> 16);
    *(int *)((char *)&loc_40 + 8) = dx9 - cx2;
    *(int *)((char *)&loc_40 + 34) = 0xa28f /* SEG_A28F */;
    *(int *)((char *)&loc_40 + 32) = 0;
    *(int *)((char *)&loc_40 + 30) = 0xa28f /* SEG_A28F */;
    *(int *)((char *)&loc_40 + 28) = 0x2000;
    dx10 = *(int *)((char *)&loc_40 + 0);
    dx11 = dx10 - *(int *)((char *)&loc_40 + 4);
    *(int *)((char *)&loc_40 + 42) = (int)(((long)*(int *)((char *)&loc_40 + 2) << 16 | (unsigned)dx10) - *(long *)((char *)&loc_40 + 4) >> 16);
    *(int *)((char *)&loc_40 + 40) = dx11;
    dx12 = *(int *)((char *)&loc_40 + 8);
    dx13 = dx12 - *(int *)((char *)&loc_40 + 12);
    *(int *)((char *)&loc_40 + 38) = (int)(((long)*(int *)((char *)&loc_40 + 10) << 16 | (unsigned)dx12) - *(long *)((char *)&loc_40 + 12) >> 16);
    *(int *)((char *)&loc_40 + 36) = dx13;
    dx14 = *(int *)((char *)&loc_40 + 4);
    ax3 = (int)(((long)*(int *)((char *)&loc_40 + 6) << 16 | (unsigned)dx14) - *(long *)((char *)&loc_40 + 8) >> 16);
    flags2 = ax3 - *(int *)((char *)&loc_40 + 22);
    if (!CC("<", flags2) && (CC("!=", flags2) || (unsigned int)(dx14 - *(int *)((char *)&loc_40 + 8)) >= (unsigned int)*(int *)((char *)&loc_40 + 20))) {
        t1 = far_cd68a(*(long *)((char *)&loc_40 + 4), *(long *)((char *)&loc_40 + 8), *(long *)((char *)&loc_40 + 40));
        dx15 = *(int *)((char *)&loc_40 + 8);
        dx16 = dx15 + *(int *)((char *)&loc_40 + 40);
        t2 = far_cd68a(*(long *)((char *)&loc_40 + 12), ((long)(*(int *)((char *)&loc_40 + 10) + *(int *)((char *)&loc_40 + 42) + (dx16 < dx15)) << 16 | (unsigned)dx16), *(long *)((char *)&loc_40 + 36));
        return *(long *)((char *)&loc_40 + 8);
    }
    if (arg_20 != 0) {
        dx17 = *(int *)((char *)&loc_40 + 0);
        t3 = (long)MK_FP((int)(((long)*(int *)((char *)&loc_40 + 2) << 16 | (unsigned)dx17) - *(long *)((char *)&loc_40 + 4) >> 16), dx17 - *(int *)((char *)&loc_40 + 4)) % *(long *)((char *)&loc_40 + 24);
        *(int *)((char *)&loc_4 + 2) = (int)(t3 >> 16);
        *(int *)((char *)&loc_4 + 0) = (int)t3;
        if (((int)t3 | (int)(t3 >> 16)) != 0) {
            ax4 = *(int *)((char *)&loc_4 + 2);
            dx18 = *(int *)((char *)&loc_4 + 0);
            *(int *)((char *)&loc_40 + 12) = *(int *)((char *)&loc_40 + 12) - dx18;
            *(int *)((char *)&loc_40 + 14) = (int)(*(long *)((char *)&loc_40 + 12) - ((long)ax4 << 16 | (unsigned)dx18) >> 16);
            *(int *)((char *)&loc_40 + 0) = *(int *)((char *)&loc_40 + 0) - dx18;
            *(int *)((char *)&loc_40 + 2) = (int)(loc_40 - ((long)ax4 << 16 | (unsigned)dx18) >> 16);
            t4 = far_cb566(*(int *)((char *)&loc_40 + 32), *(int *)((char *)&loc_40 + 34), loc_40, ((long)ax4 << 16 | (unsigned)dx18), 1);
            p80 = *(int *)((char *)&loc_40 + 12);
            p82 = *(int *)((char *)&loc_40 + 34);
            p84 = *(int *)((char *)&loc_40 + 32);
            ax5 = far_cb566(p84, p82, ((long)*(int *)((char *)&loc_40 + 14) << 16 | (unsigned)p80), *(long *)((char *)&loc_4 + 0), 0);
        }
    } else {
        dx19 = *(int *)((char *)&loc_40 + 4);
        t5 = (long)MK_FP((int)(((long)*(int *)((char *)&loc_40 + 6) << 16 | (unsigned)dx19) - *(long *)((char *)&loc_40 + 12) >> 16), dx19 - *(int *)((char *)&loc_40 + 12)) % *(long *)((char *)&loc_40 + 24);
        *(int *)((char *)&loc_4 + 2) = (int)(t5 >> 16);
        *(int *)((char *)&loc_4 + 0) = (int)t5;
        if (((int)t5 | (int)(t5 >> 16)) != 0) {
            t6 = far_cb566(*(int *)((char *)&loc_40 + 32), *(int *)((char *)&loc_40 + 34), *(long *)((char *)&loc_40 + 12), MK_FP((int)(t5 >> 16), *(int *)((char *)&loc_4 + 0)), 1);
            p80 = *(int *)((char *)&loc_40 + 0);
            p82 = *(int *)((char *)&loc_40 + 34);
            p84 = *(int *)((char *)&loc_40 + 32);
            t7 = far_cb566(p84, p82, ((long)*(int *)((char *)&loc_40 + 2) << 16 | (unsigned)p80), *(long *)((char *)&loc_4 + 0), 0);
            ax6 = *(int *)((char *)&loc_4 + 2);
            dx20 = *(int *)((char *)&loc_4 + 0);
            *(int *)((char *)&loc_40 + 12) = *(int *)((char *)&loc_40 + 12) + dx20;
            *(int *)((char *)&loc_40 + 14) = (int)(*(long *)((char *)&loc_40 + 12) + ((long)ax6 << 16 | (unsigned)dx20) >> 16);
            *(int *)((char *)&loc_40 + 0) = *(int *)((char *)&loc_40 + 0) + dx20;
            *(int *)((char *)&loc_40 + 2) = (int)(loc_40 + ((long)ax6 << 16 | (unsigned)dx20) >> 16);
        }
    }
    __stos2((unsigned char far *)TBL_F01A, 0, 0x200);
    si = (int)(*(long *)((char *)&loc_40 + 20) / *(long *)((char *)&loc_40 + 24));
    p72 = *(int *)((char *)&loc_40 + 26);
    p74 = *(int *)((char *)&loc_40 + 24);
    p76 = *(int *)((char *)&loc_40 + 22);
    p78 = *(int *)((char *)&loc_40 + 20);
    t8 = ((long)p76 << 16 | (unsigned)p78) % ((long)p72 << 16 | (unsigned)p74);
    bx = UNDEF;
    cx3 = UNDEF;
    es = UNDEF;
    if (((int)t8 | (int)(t8 >> 16)) != 0) {
        si = si + 1;
    }
    *(int *)((char *)&loc_10 + 2) = 0;
    *(int *)((char *)&loc_10 + 0) = 0;
    *(int *)((char *)&loc_4 + 2) = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    *(int *)((char *)&loc_14 + 2) = 0;
    *(int *)((char *)&loc_14 + 0) = 0;
    *(int *)((char *)&loc_c + 2) = 0;
    *(int *)((char *)&loc_c + 0) = 0;
    dx21 = *(int *)((char *)&loc_40 + 4);
    *(int *)((char *)&loc_c + 6) = *(int *)((char *)&loc_40 + 6);
    *(int *)((char *)&loc_c + 4) = dx21;
    for (;;) {
        if (si != 0) {
            if ((*(int *)((char *)&loc_4 + 0) | *(int *)((char *)&loc_4 + 2)) == 0 && (*(int *)((char *)&loc_10 + 0) | *(int *)((char *)&loc_10 + 2)) == 0) {
                p72 = SEG_STACK;
                p74 = (int)(unsigned)&loc_40;
                p76 = *(int *)((char *)&loc_c + 6);
                p78 = *(int *)((char *)&loc_c + 4);
                p80 = 0xc2e5;
                t9 = fn_c352d(((long)p76 << 16 | (unsigned)p78), ((long)p72 << 16 | (unsigned)p74));
                bx = UNDEF;
                cx3 = UNDEF;
                es = UNDEF;
                dx22 = (int)(t9 >> 16);
                *(int *)((char *)&loc_4 + 2) = dx22;
                *(int *)((char *)&loc_4 + 0) = (int)t9;
                if (((int)t9 | *(int *)((char *)&loc_4 + 2)) != 0) {
                    p82 = *(int *)((char *)&loc_40 + 34);
                    p84 = *(int *)((char *)&loc_40 + 32);
                    t10 = far_cb566(p84, p82, *(long *)((char *)&loc_c + 4), ((long)dx22 << 16 | (unsigned)*(int *)((char *)&loc_4 + 0)), 1);
                    t11 = fn_c3485(*(int *)((char *)&loc_c + 4), *(int *)((char *)&loc_c + 6), (long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_40));
                    *(int *)((char *)&loc_c + 2) = (int)(t11 >> 16);
                    *(int *)((char *)&loc_c + 0) = (int)t11;
                    p72 = SEG_STACK;
                    p74 = (int)(unsigned)&loc_40;
                    p76 = *(int *)((char *)&loc_c + 6);
                    p78 = *(int *)((char *)&loc_c + 4);
                    p80 = 0xc2e5;
                    t12 = fn_c3408(p78, p76, ((long)p72 << 16 | (unsigned)p74));
                    bx = UNDEF;
                    cx3 = UNDEF;
                    es = UNDEF;
                }
                ax7 = *(int *)((char *)&loc_40 + 26);
                dx21 = *(int *)((char *)&loc_40 + 24);
                *(int *)((char *)&loc_c + 4) = *(int *)((char *)&loc_c + 4) + dx21;
                *(int *)((char *)&loc_c + 6) = (int)(*(long *)((char *)&loc_c + 4) + ((long)ax7 << 16 | (unsigned)dx21) >> 16);
            }
            if ((*(int *)((char *)&loc_4 + 0) | *(int *)((char *)&loc_4 + 2)) != 0) {
                p72 = SEG_STACK;
                p74 = (int)(unsigned)&loc_40;
                p76 = SEG_STACK;
                p78 = (int)(unsigned)loc_10;
                p80 = SEG_STACK;
                p82 = (int)(unsigned)loc_14;
                p84 = *(int *)((char *)&loc_40 + 30);
                p86 = *(int *)((char *)&loc_40 + 28);
                p88 = *(int *)((char *)&loc_4 + 2);
                p90 = *(int *)((char *)&loc_4 + 0);
                p92 = *(int *)((char *)&loc_c + 2);
                p94 = *(int *)((char *)&loc_c + 0);
                p96 = *(int *)((char *)&loc_40 + 34);
                p98 = *(int *)((char *)&loc_40 + 32);
                p100 = 0xc2e5;
                t13 = fn_c35f3(p98, p96, p94, p92, p90, p88, p86, p84, ((long)p80 << 16 | (unsigned)p82), ((long)p76 << 16 | (unsigned)p78), p74, p72);
                bx = UNDEF;
                cx3 = UNDEF;
                es = UNDEF;
                dx21 = UNDEF;
                *(int *)((char *)&loc_4 + 2) = 0;
                *(int *)((char *)&loc_4 + 0) = 0;
                si = si - 1;
            }
            if ((*(int *)((char *)&loc_10 + 0) | *(int *)((char *)&loc_10 + 2)) != 0) {
                p72 = SEG_STACK;
                p74 = (int)(unsigned)&loc_40;
                p76 = SEG_STACK;
                p78 = (int)(unsigned)loc_4;
                p80 = SEG_STACK;
                p82 = (int)(unsigned)loc_c;
                p84 = *(int *)((char *)&loc_40 + 34);
                p86 = *(int *)((char *)&loc_40 + 32);
                p88 = *(int *)((char *)&loc_10 + 2);
                p90 = *(int *)((char *)&loc_10 + 0);
                p92 = *(int *)((char *)&loc_14 + 2);
                p94 = *(int *)((char *)&loc_14 + 0);
                p96 = *(int *)((char *)&loc_40 + 30);
                p98 = *(int *)((char *)&loc_40 + 28);
                p100 = 0xc2e5;
                t14 = fn_c35f3(p98, p96, p94, p92, p90, p88, p86, p84, ((long)p80 << 16 | (unsigned)p82), ((long)p76 << 16 | (unsigned)p78), p74, p72);
                bx = UNDEF;
                cx3 = UNDEF;
                es = UNDEF;
                dx21 = UNDEF;
                *(int *)((char *)&loc_10 + 2) = 0;
                *(int *)((char *)&loc_10 + 0) = 0;
                si = si - 1;
                continue;
            }
            continue;
        }
        break;
    }
    return *(long *)((char *)&loc_40 + 12);
}
