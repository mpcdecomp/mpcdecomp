/* differs: 308 at +5, 1736 bytes; 311 at +5, 1738 bytes; 312 at +5, 1738 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char f_1;
};
struct g_W_F2B6 {
    int f_0;
};
extern char B_7FE9;
extern unsigned char B_7FEA;
extern char B_8A9C;
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
extern unsigned char TBL_dc845[];
extern int W_D4A6;
extern int W_D4A8;
extern int W_F2B4;
extern struct g_W_F2B6 W_F2B6;
extern int W_F2B8;
extern int W_F4FA;
extern int W_F4FC;
extern int W_F600;
extern int far fn_dc887(struct s1 far *);

long far far_dc2bf(struct s1 far *arg_0, int arg_2, int arg_4, char arg_6)
{
    int loc_2;
    int loc_4;
    int loc_6;
    char far *loc_8;
    int ax;
    int ax2;
    unsigned int bx;
    int bx10;
    int bx11;
    int bx12;
    int bx13;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int cx;
    int cx2;
    int di;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int es;
    int es10;
    int es11;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    int si;
    int t1;
    int t2;
    int t3;

    cx = ((char)(cx2 >> 8) << 8 | (unsigned char)arg_6);
    for (;;) {
        bx = W_F2B8;
        if (bx > 13) {
            break;
        }
        switch ((unsigned int)(unsigned)(TBL_dc845 + (bx << 1))) {
        case 0:
            W_F2B8 = W_F2B8 + 1;
            if (W_F4FC == -1 && W_F4FA == -1) {
                continue;
            }
            goto L1;
        case 1:
            ax = (char)cx;
            if (ax == 0 && (B_7FE9 == 1 && B_7FEA == 4 || B_7FE9 == 2 && B_7FEA != 4)) {
                W_F2B6.f_0 = 0;
                W_F2B8 = W_F2B8 + 1;
                continue;
            }
            while (W_F2B6.f_0 < 128) {
                if (TBL_F4FE[W_F2B6.f_0] != -1) {
                    goto L2;
                }
                W_F2B6.f_0 = W_F2B6.f_0 + 1;
            }
            W_F2B6.f_0 = 0;
            W_F2B8 = W_F2B8 + 1;
            continue;
        case 2:
            ax = B_7FEA;
            si = ax;
            while (W_F2B6.f_0 < 128) {
                if (TBL_F57E[W_F2B6.f_0] != -1) {
                    dx = W_F2B6.f_0 + 9;
                    if ((char)cx == 0 && (B_7FE9 == 1 && si == dx || B_7FE9 == 2 && si != dx)) {
L3:
                        W_F2B6.f_0 = W_F2B6.f_0 + 1;
                        continue;
                    }
                    goto L4;
                }
                goto L3;
            }
            W_F2B6.f_0 = 0;
            W_F2B8 = W_F2B8 + 1;
            continue;
        case 3:
            W_F2B8 = W_F2B8 + 1;
            ax = (char)cx;
            if (ax == 0) {
                if (B_7FE9 == 1 && B_7FEA == 1) {
                    continue;
                }
                if (B_7FE9 == 2 && B_7FEA != 1) {
                    continue;
                }
L5:
                if (B_F5FE == -1) {
                    continue;
                }
                goto L6;
            }
            goto L5;
        case 4:
            W_F2B8 = W_F2B8 + 1;
            ax = (char)cx;
            if (ax == 0) {
                if (B_7FE9 == 1 && B_7FEA == 3) {
                    continue;
                }
                if (B_7FE9 == 2 && B_7FEA != 3) {
                    continue;
                }
L7:
                if (B_F5FF == -1) {
                    continue;
                }
                goto L8;
            }
            goto L7;
        case 5:
            W_F2B8 = W_F2B8 + 1;
            ax = (char)cx;
            if (ax == 0) {
                if (B_7FE9 == 1 && B_7FEA == 2) {
                    continue;
                }
                if (B_7FE9 == 2 && B_7FEA != 2) {
                    continue;
                }
L9:
                if (W_F600 == -1) {
                    continue;
                }
                goto L10;
            }
            goto L9;
        case 6:
            W_F2B8 = W_F2B8 + 1;
            ax = (char)cx;
            if (ax == 0) {
                if (B_7FE9 == 1 && B_7FEA == 5) {
                    continue;
                }
                if (B_7FE9 == 2 && B_7FEA != 5) {
                    continue;
                }
L11:
                if (W_F2B4 == 0) {
                    continue;
                }
                goto L12;
            }
            goto L11;
        case 7:
            ax = (char)cx;
            if (ax == 0 && (B_7FE9 == 1 && B_7FEA == 6 || B_7FE9 == 2 && B_7FEA != 6)) {
                W_F2B6.f_0 = 0;
                W_F2B8 = W_F2B8 + 1;
                continue;
            }
            while (W_F2B6.f_0 < 64) {
                if (TBL_F602[W_F2B6.f_0] != -1) {
                    goto L13;
                }
                W_F2B6.f_0 = W_F2B6.f_0 + 1;
            }
            W_F2B6.f_0 = 0;
            W_F2B8 = W_F2B8 + 1;
            continue;
        case 8:
            ax = (char)cx;
            if (ax == 0 && (B_7FE9 == 1 && B_7FEA == 7 || B_7FE9 == 2 && B_7FEA != 7)) {
                W_F2B6.f_0 = 0;
                W_F2B8 = W_F2B8 + 1;
                continue;
            }
            while (W_F2B6.f_0 < 64) {
                if (TBL_F642[W_F2B6.f_0] != -1) {
                    goto L14;
                }
                W_F2B6.f_0 = W_F2B6.f_0 + 1;
            }
            W_F2B6.f_0 = 0;
            W_F2B8 = W_F2B8 + 1;
            continue;
        case 9:
            ax = (char)cx;
            if (ax == 0 && (B_7FE9 == 1 && B_7FEA == 8 || B_7FE9 == 2 && B_7FEA != 8)) {
                W_F2B6.f_0 = 0;
                W_F2B8 = W_F2B8 + 1;
                continue;
            }
            while (W_F2B6.f_0 < 64) {
                if (TBL_F682[W_F2B6.f_0] != -1) {
                    goto L15;
                }
                W_F2B6.f_0 = W_F2B6.f_0 + 1;
            }
            W_F2B6.f_0 = 0;
            W_F2B8 = W_F2B8 + 1;
            continue;
        case 10:
            W_F2B6.f_0 = 0;
            W_F2B8 = W_F2B8 + 1;
            continue;
        case 11:
            ax = (char)cx;
            if (ax != 0) {
                goto L16;
            }
            if (B_7FE9 == 1 && B_7FEA == 0) {
                goto L17;
            }
            if (B_7FE9 != 2) {
                goto L16;
            }
            if (B_7FEA != 0) {
L17:
                W_F2B6.f_0 = 0;
                W_F2B8 = W_F2B8 + 1;
                continue;
            }
            for (;;) {
L16:
                if (W_F2B6.f_0 >= 128) {
                    break;
                }
                bx3 = W_F2B6.f_0;
                if (TBL_F47A[bx3] != -1) {
                    goto L18;
                }
                W_F2B6.f_0 = W_F2B6.f_0 + 1;
            }
            W_F2B6.f_0 = 0;
            W_F2B8 = W_F2B8 + 1;
            continue;
        case 12:
            W_F2B8 = W_F2B8 + 1;
            if (B_F742 == -1) {
                continue;
            }
            goto L19;
        case 13:
            W_F2B8 = W_F2B8 + 1;
            if (B_F743 == -1) {
                continue;
            }
            goto L20;
        }
    }
    W_F2B6.f_0 = 0;
    W_F2B8 = 0;
    return ((long)dx << 16 | (unsigned)0);
L1:
    bx13 = FP_OFF(arg_0);
    es11 = FP_SEG(arg_0);
    dx5 = W_F4FA;
    *(int far *)MK_FP(es11, bx13 + 2) = W_F4FC;
    *(int far *)MK_FP(es11, bx13) = dx5;
    return ((long)dx5 << 16 | (unsigned)4);
L2:
    bx12 = FP_OFF(arg_0);
    es10 = FP_SEG(arg_0);
    *(char far *)MK_FP(es10, bx12) = (char)-96;
    *(char far *)MK_FP(es10, bx12 + 1) = B_8A9C;
    *(char far *)MK_FP(es10, bx12 + 2) = *(char *)((char *)&W_F2B6 + 0);
    *(char far *)MK_FP(es10, *(int *)((char *)&arg_0 + 0) + 3) = TBL_F4FE[W_F2B6.f_0];
    W_F2B6.f_0 = W_F2B6.f_0 + 1;
    return ((long)dx << 16 | (unsigned)4);
L4:
    bx11 = FP_OFF(arg_0);
    es9 = FP_SEG(arg_0);
    *(char far *)MK_FP(es9, bx11) = (char)-80;
    *(char far *)MK_FP(es9, bx11 + 1) = B_8A9C;
    *(char far *)MK_FP(es9, bx11 + 2) = *(char *)((char *)&W_F2B6 + 0);
    *(char far *)MK_FP(es9, *(int *)((char *)&arg_0 + 0) + 3) = TBL_F57E[W_F2B6.f_0];
    W_F2B6.f_0 = W_F2B6.f_0 + 1;
    return ((long)dx << 16 | (unsigned)4);
L6:
    bx10 = FP_OFF(arg_0);
    es8 = FP_SEG(arg_0);
    *(char far *)MK_FP(es8, bx10) = (char)-64;
    *(char far *)MK_FP(es8, bx10 + 1) = B_8A9C;
    *(char far *)MK_FP(es8, bx10 + 2) = B_F5FE;
    return ((long)dx << 16 | (unsigned)3);
L8:
    bx9 = FP_OFF(arg_0);
    es7 = FP_SEG(arg_0);
    *(char far *)MK_FP(es7, bx9) = (char)-48;
    *(char far *)MK_FP(es7, bx9 + 1) = B_8A9C;
    *(char far *)MK_FP(es7, bx9 + 2) = B_F5FF;
    return ((long)dx << 16 | (unsigned)3);
L10:
    bx8 = FP_OFF(arg_0);
    es6 = FP_SEG(arg_0);
    *(char far *)MK_FP(es6, bx8) = (char)-32;
    *(char far *)MK_FP(es6, bx8 + 1) = B_8A9C;
    dx4 = *(int *)((char *)&arg_0 + 0);
    loc_2 = arg_2;
    loc_4 = dx4 + 2;
    *(int far *)MK_FP(es6, loc_4) = W_F600;
    return ((long)(dx4 + 2) << 16 | (unsigned)4);
L12:
    dx2 = W_D4A6;
    loc_6 = W_D4A8;
    *(int *)((char *)&loc_8 + 0) = dx2;
    ax2 = W_F2B4;
    if (ax2 < arg_4) {
        arg_4 = ax2;
    }
    dx3 = 0;
    di = *(int *)((char *)&arg_0 + 0);
    if (dx3 < arg_4) {
        do {
            ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)*loc_8);
            *(char far *)MK_FP(arg_2, di) = (char)ax2;
            *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 1;
            di = di + 1;
            dx3 = dx3 + 1;
        } while (dx3 < arg_4);
    }
    arg_0->f_1 = B_8A9C;
    return ((long)dx3 << 16 | (unsigned)W_F2B4);
L13:
    t3 = fn_dc887(arg_0);
    bx7 = FP_OFF(arg_0);
    es5 = FP_SEG(arg_0);
    *(char far *)MK_FP(es5, bx7 + 6) = (char)1;
    *(char far *)MK_FP(es5, bx7 + 7) = *(char *)((char *)&W_F2B6 + 0);
    *(char far *)MK_FP(es5, *(int *)((char *)&arg_0 + 0) + 8) = TBL_F602[W_F2B6.f_0];
    W_F2B6.f_0 = W_F2B6.f_0 + 1;
    return ((long)UNDEF << 16 | (unsigned)9);
L14:
    t2 = fn_dc887(arg_0);
    bx6 = FP_OFF(arg_0);
    es4 = FP_SEG(arg_0);
    *(char far *)MK_FP(es4, bx6 + 6) = (char)2;
    *(char far *)MK_FP(es4, bx6 + 7) = *(char *)((char *)&W_F2B6 + 0);
    *(char far *)MK_FP(es4, *(int *)((char *)&arg_0 + 0) + 8) = TBL_F642[W_F2B6.f_0];
    W_F2B6.f_0 = W_F2B6.f_0 + 1;
    return ((long)UNDEF << 16 | (unsigned)9);
L15:
    t1 = fn_dc887(arg_0);
    bx5 = FP_OFF(arg_0);
    es3 = FP_SEG(arg_0);
    *(char far *)MK_FP(es3, bx5 + 6) = (char)3;
    *(char far *)MK_FP(es3, bx5 + 7) = *(char *)((char *)&W_F2B6 + 0);
    *(char far *)MK_FP(es3, *(int *)((char *)&arg_0 + 0) + 8) = TBL_F682[W_F2B6.f_0];
    W_F2B6.f_0 = W_F2B6.f_0 + 1;
    return ((long)UNDEF << 16 | (unsigned)9);
L18:
    bx4 = FP_OFF(arg_0);
    es2 = FP_SEG(arg_0);
    *(char far *)MK_FP(es2, bx4) = (char)(TBL_F2BA[bx3] | -104);
    *(char far *)MK_FP(es2, bx4 + 1) = B_8A9C;
    *(char far *)MK_FP(es2, bx4 + 2) = *(char *)((char *)&W_F2B6 + 0);
    *(char far *)MK_FP(es2, *(int *)((char *)&arg_0 + 0) + 3) = TBL_F47A[W_F2B6.f_0];
    *(char far *)MK_FP(es2, *(int *)((char *)&arg_0 + 0) + 4) = TBL_F3FA[W_F2B6.f_0];
    *(char far *)MK_FP(es2, *(int *)((char *)&arg_0 + 0) + 5) = TBL_F37A[W_F2B6.f_0];
    *(char far *)MK_FP(es2, *(int *)((char *)&arg_0 + 0) + 6) = TBL_F2FA[W_F2B6.f_0];
    W_F2B6.f_0 = W_F2B6.f_0 + 1;
    return ((long)dx << 16 | (unsigned)7);
L19:
    bx2 = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    *(char far *)MK_FP(es, bx2) = (char)-24;
    *(char far *)MK_FP(es, bx2 + 1) = B_8A9C;
    return ((long)dx << 16 | (unsigned)2);
L20:
    arg_0->f_0 = (char)-1;
    return ((long)dx << 16 | (unsigned)1);
}
int far fn_dc887(struct s1 far *p0) { return 0; }
