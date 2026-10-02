/* differs: 308 at +5, 931 bytes; 311 at +5, 931 bytes; 312 at +5, 931 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
struct g_TBL_D65D {
    int f_0;
};
struct g_TBL_D65F {
    int f_0;
};
struct g_TBL_D663 {
    int f_0;
};
struct g_TBL_D661 {
    int f_0;
};
extern char TBL_D65B[];
extern char TBL_D65C[];
extern struct g_TBL_D65D TBL_D65D;
extern struct g_TBL_D65F TBL_D65F;
extern struct g_TBL_D661 TBL_D661;
extern struct g_TBL_D663 TBL_D663;
extern unsigned char W_D651[];
extern long far far_cd68a(long, long, long);
extern long far fn_cd909(void);

long far far_ccbdd(int arg_0, unsigned long arg_2, int arg_4)
{
    int loc_2;
    int loc_4;
    int loc_6;
    long loc_8;
    int loc_a;
    int loc_c;
    int loc_e;
    int loc_10;
    int loc_12;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    struct s1 near *bx;
    struct s1 near *bx2;
    int bx3;
    int bx4;
    int cx;
    int cx2;
    int cx3;
    int di;
    unsigned int dx;
    int dx10;
    int dx11;
    int dx12;
    int dx13;
    unsigned int dx14;
    unsigned int dx15;
    int dx2;
    int dx3;
    unsigned int dx4;
    unsigned int dx5;
    int dx6;
    int dx7;
    unsigned int dx8;
    unsigned int dx9;
    int es;
    int flags;
    int p26;
    int p28;
    int p30;
    int p32;
    int p34;
    int p36;
    int p38;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    p26 = 0xd5c0;
    t1 = fn_cd909();
    cx = UNDEF;
    es = UNDEF;
    loc_e = 0;
    for (;;) {
        t9 = (long)(int)loc_e * 10L;
        dx = (int)(t9 >> 16);
        if (TBL_D65B[(int)t9] == 0) {
            break;
        }
        if (TBL_D65B[(int)t9] != -1) {
            goto L1;
        }
        ax = loc_e;
        loc_10 = ax + 1;
        t2 = (long)(int)(ax + 1) * 10L;
        dx = (int)(t2 >> 16);
        di = (int)t2;
        if (TBL_D65B[(int)t2] != -1) {
            if (TBL_D65B[di] == 1) {
                dx2 = *(int *)((char *)&TBL_D661 + 0 + (int)t9);
                loc_6 = *(int *)((char *)&TBL_D663 + 0 + (int)t9);
                *(int *)((char *)&loc_8 + 0) = dx2;
                dx3 = *(int *)((char *)&TBL_D661 + 0 + di);
                loc_2 = *(int *)((char *)&TBL_D663 + 0 + di);
                loc_4 = dx3;
                t3 = (long)(int)(loc_10 + 1) * 10L;
                cx2 = (int)t3;
                while (TBL_D65B[cx2] == 1) {
                    dx8 = loc_4;
                    dx9 = dx8 + *(int *)((char *)&TBL_D661 + 0 + cx2);
                    loc_2 = loc_2 + *(int *)((char *)&TBL_D663 + 0 + cx2) + (dx9 < dx8);
                    loc_4 = dx9;
                    cx2 = cx2 + 10;
                }
                p26 = loc_2;
                p28 = loc_4;
                p30 = *(int *)((char *)&TBL_D65F + 0 + (int)t9);
                p32 = *(int *)((char *)&TBL_D65D + 0 + (int)t9);
                p34 = *(int *)((char *)&TBL_D65F + 0 + di);
                p36 = *(int *)((char *)&TBL_D65D + 0 + di);
                p38 = 0xd5c0;
                t4 = far_cd68a(((long)p34 << 16 | (unsigned)p36), ((long)p30 << 16 | (unsigned)p32), ((long)p26 << 16 | (unsigned)p28));
                es = UNDEF;
                t5 = (long)(int)loc_10 * 10L;
                loc_12 = (int)t5;
                t6 = (long)(int)loc_e * 10L;
                ax2 = (int)t6;
                di = ax2;
                while (TBL_D65B[loc_12] == 1) {
                    TBL_D65B[di] = (char)1;
                    bx3 = loc_12;
                    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)TBL_D65C[bx3]);
                    TBL_D65C[di] = (char)ax3;
                    dx6 = *(int *)((char *)&TBL_D65D + 0 + bx3);
                    *(int *)((char *)&TBL_D65F + 0 + di) = (int)(((long)*(int *)((char *)&TBL_D65F + 0 + bx3) << 16 | (unsigned)dx6) - loc_8 >> 16);
                    *(int *)((char *)&TBL_D65D + 0 + di) = dx6 - *(int *)((char *)&loc_8 + 0);
                    t8 = (long)(signed char)(char)ax3 * 36L;
                    cx3 = *(int *)((char *)&loc_8 + 0);
                    es = 0xa853 /* SEG_A28F */;
                    *(int far *)MK_FP(es, (int)t8 + 0x4820) = *(int far *)MK_FP(es, (int)t8 + 0x4820) - cx3;
                    *(int far *)MK_FP(es, (int)t8 + 0x4822) = (int)(*(long far *)MK_FP(es, (int)t8 + 0x4820) - ((long)loc_6 << 16 | (unsigned)cx3) >> 16);
                    bx4 = loc_12;
                    ax2 = *(int *)((char *)&TBL_D663 + 0 + bx4);
                    dx7 = *(int *)((char *)&TBL_D661 + 0 + bx4);
                    *(int *)((char *)&TBL_D663 + 0 + di) = ax2;
                    *(int *)((char *)&TBL_D661 + 0 + di) = dx7;
                    loc_12 = loc_12 + 10;
                    di = di + 10;
                    loc_e = loc_e + 1;
                }
                t7 = (long)(int)loc_e * 10L;
                TBL_D65B[(int)t7] = (char)-1;
                TBL_D65C[(int)t7] = (char)-1;
                bx = (struct s1 near *)(W_D651 + 2 + (int)t7);
                dx4 = bx->f_0;
                cx = (int)(unsigned)(W_D651 + 6);
                bx2 = (struct s1 near *)((int)t7 + cx);
                dx5 = dx4 + bx2->f_0;
                *(int *)((char *)&TBL_D65F + 0 + (int)t7) = bx->f_2 + bx2->f_2 + (dx5 < dx4);
                *(int *)((char *)&TBL_D65D + 0 + (int)t7) = dx5;
                dx = *(int *)((char *)&loc_8 + 0);
                *(int *)((char *)&TBL_D663 + 0 + (int)t7) = loc_6;
                *(int *)((char *)&TBL_D661 + 0 + (int)t7) = dx;
                loc_e = loc_e - 1;
            }
            goto L1;
        }
        dx10 = *(int *)((char *)&TBL_D65D + 0 + (int)t9);
        *(int *)((char *)&TBL_D65F + 0 + di) = *(int *)((char *)&TBL_D65F + 0 + (int)t9);
        *(int *)((char *)&TBL_D65D + 0 + di) = dx10;
        ax4 = *(int *)((char *)&TBL_D663 + 0 + (int)t9);
        dx11 = *(int *)((char *)&TBL_D661 + 0 + (int)t9);
        *(int *)((char *)&TBL_D661 + 0 + di) = *(int *)((char *)&TBL_D661 + 0 + di) + dx11;
        *(int *)((char *)&TBL_D663 + 0 + di) = (int)(((long)*(int *)((char *)&TBL_D663 + 0 + di) << 16 | (unsigned)*(int *)((char *)&TBL_D661 + 0 + di)) + ((long)ax4 << 16 | (unsigned)dx11) >> 16);
        dx12 = *(int *)((char *)&TBL_D661 + 0 + di);
        loc_a = (int)(((long)*(int *)((char *)&TBL_D663 + 0 + di) << 16 | (unsigned)dx12) - arg_2 >> 16);
        loc_c = dx12 - *(int *)((char *)&arg_2 + 0);
        TBL_D65B[(int)t9] = (char)0;
        *(int *)((char *)&TBL_D65F + 0 + (int)t9) = -1;
        *(int *)((char *)&TBL_D65D + 0 + (int)t9) = -1;
        *(int *)((char *)&TBL_D663 + 0 + (int)t9) = 0;
        *(int *)((char *)&TBL_D661 + 0 + (int)t9) = 0;
        ax5 = *(int *)((char *)&TBL_D663 + 0 + di);
        dx = *(int *)((char *)&TBL_D661 + 0 + di);
        flags = ax5 - arg_4;
        if (!CC(">=u", flags)) {
            goto L1;
        }
        if (!CC("!=", flags) && dx < (unsigned int)*(int *)((char *)&arg_2 + 0)) {
L1:
            loc_e = loc_e + 1;
            if (loc_e < 0x12c) {
                continue;
            }
            goto L2;
        }
        goto L3;
    }
    return ((long)dx << 16 | (unsigned)-2);
L2:
    return ((long)dx << 16 | (unsigned)0);
L3:
    TBL_D65B[di] = (char)1;
    TBL_D65C[di] = *(char *)((char *)&arg_0 + 0);
    if ((loc_c | loc_a) != 0) {
        dx13 = loc_c;
        *(int *)((char *)&TBL_D661 + 0 + di) = *(int *)((char *)&TBL_D661 + 0 + di) - dx13;
        *(int *)((char *)&TBL_D663 + 0 + di) = (int)(((long)*(int *)((char *)&TBL_D663 + 0 + di) << 16 | (unsigned)*(int *)((char *)&TBL_D661 + 0 + di)) - ((long)loc_a << 16 | (unsigned)dx13) >> 16);
        TBL_D65B[(int)t9] = (char)-1;
        TBL_D65C[(int)t9] = (char)-1;
        dx14 = *(int *)((char *)&TBL_D65D + 0 + di);
        dx15 = dx14 + *(int *)((char *)&TBL_D661 + 0 + di);
        *(int *)((char *)&TBL_D65F + 0 + (int)t9) = *(int *)((char *)&TBL_D65F + 0 + di) + *(int *)((char *)&TBL_D663 + 0 + di) + (dx15 < dx14);
        *(int *)((char *)&TBL_D65D + 0 + (int)t9) = dx15;
        dx = loc_c;
        *(int *)((char *)&TBL_D663 + 0 + (int)t9) = loc_a;
        *(int *)((char *)&TBL_D661 + 0 + (int)t9) = dx;
    }
    return ((long)dx << 16 | (unsigned)loc_10);
}
long far far_cd68a(long p0, long p1, long p2) { return 0; }
long far fn_cd909(void) { return 0; }
