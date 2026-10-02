/* differs: 308 at +5, 536 bytes; 311 at +5, 557 bytes; 312 at +5, 557 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_CEC0;
extern unsigned char B_F28C;
extern unsigned char B_F28F;
extern int TBL_E223[];
extern char TBL_E3AC[];
extern int W_E3AA;
extern unsigned int W_F28A;
extern unsigned int W_F28D;
extern long far far_cde12(int);

int far far_cafac(int arg_0, int arg_2, int arg_4, int arg_6, char arg_8)
{
    char loc_48[72];
    char loc_c8[128];
    int ax;
    int ax2;
    int ax3;
    int bx;
    int cx;
    int cx2;
    int cx3;
    int di;
    int dx;
    unsigned int dx2;
    int es;
    int p208;
    int si2;
    long t1;
    long t2;
    long t3;

    W_F28A = -1;
    W_F28D = -1;
    *(int *)((char *)&loc_48 + 68) = 0;
    p208 = SEG_STACK;
    es = p208;
    __stos2((char far *)MK_FP(es, (unsigned int)(unsigned)loc_c8), 0, 128);
    cx = 0;
    if (arg_0 == 1) {
        *(int *)((char *)&loc_48 + 70) = 0;
        do {
            bx = *(int *)((char *)&loc_48 + 70);
            if ((unsigned char)TBL_E3AC[bx] == arg_2) {
                p208 = bx;
                t1 = far_cde12(p208);
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                dx = (int)(t1 >> 16);
            }
            *(int *)((char *)&loc_48 + 70) = *(int *)((char *)&loc_48 + 70) + 1;
        } while ((unsigned int)*(int *)((char *)&loc_48 + 70) < 32);
    }
    if (arg_4 >= 35) {
        *(int *)((char *)&loc_48 + 70) = 0;
        do {
            bx = *(int *)((char *)&loc_48 + 70);
            if ((unsigned char)TBL_E3AC[bx] == arg_4) {
                p208 = bx;
                t2 = far_cde12(p208);
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                dx = (int)(t2 >> 16);
            }
            *(int *)((char *)&loc_48 + 70) = *(int *)((char *)&loc_48 + 70) + 1;
        } while ((unsigned int)*(int *)((char *)&loc_48 + 70) < 32);
    }
    if (arg_6 >= 35) {
        *(int *)((char *)&loc_48 + 70) = 0;
        do {
            bx = *(int *)((char *)&loc_48 + 70);
            if ((unsigned char)TBL_E3AC[bx] == arg_6) {
                p208 = bx;
                t3 = far_cde12(p208);
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                dx = (int)(t3 >> 16);
            }
            *(int *)((char *)&loc_48 + 70) = *(int *)((char *)&loc_48 + 70) + 1;
        } while ((unsigned int)*(int *)((char *)&loc_48 + 70) < 32);
    }
    *(int *)((char *)&loc_48 + 70) = W_E3AA;
    cx2 = 0;
    *(int *)((char *)&loc_48 + 64) = arg_8;
    ax = B_CEC0;
    di = ax;
    for (;;) {
        if (di > cx2) {
            *(int *)((char *)&loc_48 + 70) = *(int *)((char *)&loc_48 + 70) + 1;
            if ((unsigned int)di <= (unsigned int)*(int *)((char *)&loc_48 + 70)) {
                *(int *)((char *)&loc_48 + 70) = 0;
            }
            dx2 = TBL_E223[*(int *)((char *)&loc_48 + 70) + 32];
            if (dx2 == 0) {
                goto L1;
            }
            if (dx2 < W_F28A && *(int *)((char *)&loc_48 + 64) != *(int *)((char *)&loc_48 + 70)) {
                W_F28A = dx2;
                B_F28C = loc_48[70];
            }
            if ((unsigned char)TBL_E3AC[*(int *)((char *)&loc_48 + 70)] == arg_2 && dx2 < W_F28D && *(int *)((char *)&loc_48 + 64) != *(int *)((char *)&loc_48 + 70)) {
                W_F28D = dx2;
                B_F28F = loc_48[70];
            }
            *(int *)((char *)&loc_48 + 0 + (*(int *)((char *)&loc_48 + 70) << 1)) = dx2;
            ax2 = ((char)((unsigned int)(unsigned)loc_48 >> 8) << 8 | (unsigned char)TBL_E3AC[*(int *)((char *)&loc_48 + 70)]);
            bx = (int)(unsigned)(loc_c8 + (unsigned char)(char)ax2);
            ax3 = ((char)((unsigned int)(unsigned)loc_c8 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(SEG_STACK, bx));
            loc_c8[(unsigned char)(char)ax2] = (char)((char)ax3 + 1);
            ax = (unsigned char)((char)ax3 + 1);
            if (ax > *(int *)((char *)&loc_48 + 68)) {
                ax = (unsigned char)loc_c8[(unsigned char)(char)ax2];
                *(int *)((char *)&loc_48 + 68) = ax;
                *(int *)((char *)&loc_48 + 66) = (unsigned char)(char)ax2;
            }
            cx2 = cx2 + 1;
            continue;
        }
        break;
    }
    if (W_F28D != -1) {
        *(int *)((char *)&loc_48 + 70) = B_F28F;
    } else if (*(int *)((char *)&loc_48 + 68) >= 3) {
        W_F28D = -1;
        cx3 = 0;
        si2 = (int)(unsigned)loc_48;
        while (di > cx3) {
            if (*(int far *)MK_FP(SEG_STACK, si2) != 0) {
                bx = cx3;
                ax = (unsigned char)TBL_E3AC[bx];
                if (ax == *(int *)((char *)&loc_48 + 66)) {
                    ax = *(int far *)MK_FP(SEG_STACK, si2);
                    if ((unsigned int)ax < W_F28D) {
                        W_F28D = ax;
                        B_F28F = (char)cx3;
                    }
                }
            }
            si2 = si2 + 2;
            cx3 = cx3 + 1;
        }
        *(int *)((char *)&loc_48 + 70) = B_F28F;
    } else {
        *(int *)((char *)&loc_48 + 70) = B_F28C;
    }
    W_E3AA = *(int *)((char *)&loc_48 + 70) + 1;
    return *(int *)((char *)&loc_48 + 70);
L1:
    W_E3AA = *(int *)((char *)&loc_48 + 70) + 1;
    return *(int *)((char *)&loc_48 + 70);
}
