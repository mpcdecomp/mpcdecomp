/* differs: 308 at +5, 976 bytes; 311 at +5, 978 bytes; 312 at +5, 978 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_D65D {
    int f_0;
};
struct g_TBL_D65F {
    int f_0;
};
struct g_TBL_D661 {
    int f_0;
};
struct g_TBL_D663 {
    int f_0;
};
struct g_TBL_D669 {
    int f_0;
};
struct g_TBL_D667 {
    int f_0;
};
struct g_TBL_D65B {
    char f_0;
};
extern struct g_TBL_D65B TBL_D65B;
extern char TBL_D65C[];
extern struct g_TBL_D65D TBL_D65D;
extern struct g_TBL_D65F TBL_D65F;
extern struct g_TBL_D661 TBL_D661;
extern struct g_TBL_D663 TBL_D663;
extern struct g_TBL_D667 TBL_D667;
extern struct g_TBL_D669 TBL_D669;
extern long far far_cb23d(void);
extern long far far_cca3a(void);
extern long far far_fa0c8(int, int, int);
extern long far fn_cd909(void);
long far far_cca3a(void) { return 0; }

int far far_cd0a9(void)
{
    int loc_2;
    unsigned int loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    int loc_c;
    int loc_e;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int cx;
    int cx2;
    int di;
    int di2;
    unsigned int dx;
    unsigned int dx10;
    int dx11;
    int dx12;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;
    int dx5;
    int dx6;
    unsigned int dx7;
    unsigned int dx8;
    unsigned int dx9;
    int flags;
    int flags2;
    int p24;
    int p26;
    int si;
    int si2;
    int si3;
    long t1;
    long t10;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    loc_2 = 0;
    loc_4 = 0;
    loc_6 = 0;
    si = 0;
    do {
        *(char *)((char *)&TBL_D65B + 0 + si) = (char)0;
        TBL_D65C[si] = (char)-1;
        *(int *)((char *)&TBL_D65F + 0 + si) = -1;
        *(int *)((char *)&TBL_D65D + 0 + si) = -1;
        *(int *)((char *)&TBL_D663 + 0 + si) = -1;
        *(int *)((char *)&TBL_D661 + 0 + si) = -1;
        si = si + 10;
        loc_6 = loc_6 + 1;
    } while (si != 0xbb8);
    loc_8 = 0;
    loc_6 = 0;
    if (loc_6 < 128) {
        dx = 0;
        loc_e = 0;
        si2 = 0;
        di = 0;
        loc_c = 0x4820;
        for (;;) {
            if (si2 != 0x1200) {
                if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, si2 + 0x4800) != 0) {
                    *(char *)((char *)&TBL_D65B + 0 + di) = (char)1;
                    TBL_D65C[di] = *(char *)((char *)&loc_6 + 0);
                    bx2 = loc_c;
                    dx2 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx2);
                    *(int *)((char *)&TBL_D65F + 0 + di) = *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx2 + 2);
                    *(int *)((char *)&TBL_D65D + 0 + di) = dx2;
                    ax = (unsigned char)*(char far *)MK_FP(0xa853 /* SEG_A28F */, si2 + 0x4813) + 1;
                    p24 = ax;
                    p26 = -(ax < 0);
                    t1 = far_fa0c8(*(int far *)MK_FP(0xa853 /* SEG_A28F */, si2 + 0x481c), p24, p26);
                    *(int *)((char *)&TBL_D663 + 0 + di) = (int)(t1 >> 16);
                    *(int *)((char *)&TBL_D661 + 0 + di) = (int)t1;
                    di = di + 10;
                    loc_8 = loc_8 + 1;
                    bx3 = loc_c;
                    ax2 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx3 + 2);
                    cx = ax2;
                    dx = *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx3);
                    bx = dx;
                    flags = ax2 - loc_2;
                    if (!CC("<", flags) && (CC("!=", flags) || dx >= loc_4)) {
                        loc_2 = cx;
                        loc_4 = bx;
                        loc_a = loc_6;
                    }
                }
                si2 = si2 + 36;
                loc_c = loc_c + 36;
                loc_6 = loc_6 + 1;
                continue;
            }
            break;
        }
    }
    if (loc_8 == 0) {
        return (int)far_cb23d();
    }
    *(char *)((char *)&TBL_D65B + 0 + loc_8 * 10) = (char)-1;
    t2 = (long)(int)loc_a * 36L;
    ax3 = (unsigned char)*(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t2 + 0x4813) + 1;
    t3 = far_fa0c8(*(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t2 + 0x481c), ax3, -(ax3 < 0));
    t4 = (long)(int)loc_a * 36L;
    dx3 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t4 + 0x4820);
    dx4 = dx3 + (int)t3;
    t5 = (long)(int)loc_8 * 10L;
    *(int *)((char *)&TBL_D65F + 0 + (int)t5) = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t4 + 0x4822) + (int)(t3 >> 16) + (dx4 < dx3);
    *(int *)((char *)&TBL_D65D + 0 + (int)t5) = dx4;
    t6 = far_cca3a();
    t7 = (long)(int)loc_8 * 10L;
    dx5 = (int)t6 + 0x7d0 - *(int *)((char *)&TBL_D65D + 0 + (int)t7);
    *(int *)((char *)&TBL_D663 + 0 + (int)t7) = (int)(t6 + 0x107d0L - ((long)*(int *)((char *)&TBL_D65F + 0 + (int)t7) << 16 | (unsigned)*(int *)((char *)&TBL_D65D + 0 + (int)t7)) >> 16);
    *(int *)((char *)&TBL_D661 + 0 + (int)t7) = dx5;
    t8 = fn_cd909();
    di2 = loc_8;
    loc_8 = loc_8 + 1;
    if (TBL_D65F.f_0 != 1 || TBL_D65D.f_0 != 0x7d0) {
        t9 = (long)(int)loc_8 * 10L;
        *(char *)((char *)&TBL_D65B + 0 + (int)t9) = (char)-1;
        *(int *)((char *)&TBL_D65F + 0 + (int)t9) = 1;
        *(int *)((char *)&TBL_D65D + 0 + (int)t9) = 0x7d0;
        dx6 = TBL_D65D.f_0;
        *(int *)((char *)&TBL_D663 + 0 + (int)t9) = (int)(((long)TBL_D65F.f_0 << 16 | (unsigned)dx6) - 0x107d0L >> 16);
        *(int *)((char *)&TBL_D661 + 0 + (int)t9) = dx6 - 0x7d0;
        loc_8 = loc_8 + 1;
        t10 = fn_cd909();
    }
    loc_6 = 0;
    cx2 = 0;
    si3 = loc_8 * 10;
    if (loc_6 < di2) {
        do {
            bx4 = cx2;
            dx7 = *(int *)((char *)&TBL_D65D + 0 + bx4);
            dx8 = dx7 + *(int *)((char *)&TBL_D661 + 0 + bx4);
            ax4 = *(int *)((char *)&TBL_D65F + 0 + bx4) + *(int *)((char *)&TBL_D663 + 0 + bx4) + (dx8 < dx7);
            flags2 = ax4 - *(int *)((char *)&TBL_D669 + 0 + bx4);
            if (!CC(">u", flags2) && (CC("<u", flags2) || dx8 < (unsigned int)*(int *)((char *)&TBL_D667 + 0 + bx4))) {
                *(char *)((char *)&TBL_D65B + 0 + si3) = (char)-1;
                TBL_D65C[si3] = (char)-1;
                dx9 = *(int *)((char *)&TBL_D65D + 0 + cx2);
                dx10 = dx9 + *(int *)((char *)&TBL_D661 + 0 + cx2);
                *(int *)((char *)&TBL_D65F + 0 + si3) = *(int *)((char *)&TBL_D65F + 0 + cx2) + *(int *)((char *)&TBL_D663 + 0 + cx2) + (dx10 < dx9);
                *(int *)((char *)&TBL_D65D + 0 + si3) = dx10;
                dx11 = *(int *)((char *)&TBL_D667 + 0 + cx2);
                dx12 = dx11 - *(int *)((char *)&TBL_D65D + 0 + si3);
                *(int *)((char *)&TBL_D663 + 0 + si3) = (int)(((long)*(int *)((char *)&TBL_D669 + 0 + cx2) << 16 | (unsigned)dx11) - ((long)*(int *)((char *)&TBL_D65F + 0 + si3) << 16 | (unsigned)*(int *)((char *)&TBL_D65D + 0 + si3)) >> 16);
                *(int *)((char *)&TBL_D661 + 0 + si3) = dx12;
                si3 = si3 + 10;
            }
            cx2 = cx2 + 10;
            loc_6 = loc_6 + 1;
        } while (loc_6 < di2);
    }
    return (int)fn_cd909();
}
long far fn_cd909(void) { return 0; }
