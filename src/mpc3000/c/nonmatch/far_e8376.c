/* differs: 308 at +5, 707 bytes; 311 at +5, 707 bytes; 312 at +5, 707 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char TBL_A5CF[];
extern char TBL_A787[];
extern char TBL_A79B[];
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern int W_8C31;
extern int W_8C33;
extern int W_8C39;
extern int W_8C3B;
extern long far far_caa9c();
extern long far far_cab20();
extern long far far_cad00();
extern int far far_cad90();
extern long far far_cadb4();
extern long far far_daa07();
extern long far far_daa59();

long far far_e8376(int arg_0, int arg_2)
{
    char loc_4[4];
    char loc_a[6];
    char loc_222[536];
    char loc_226[4];
    int ax;
    int ax2;
    int bx;
    int bx2;
    int cx;
    int cx2;
    int cx3;
    char near *di;
    int dx;
    int p560;
    int p562;
    int p564;
    int si;
    int si2;
    long t1;
    int t10;
    long t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;
    int t8;
    long t9;

    t1 = far_daa07(W_8C31, W_8C33, W_8C39, W_8C3B);
    *(int *)((char *)&loc_4 + 2) = (int)(t1 + 1L >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t1 + 1;
    t2 = far_cad00(0);
    t3 = far_caa9c(*(long *)((char *)&arg_0 + 0));
    *(int *)((char *)&loc_a + 4) = (int)t3;
    if ((int)t3 < 0) {
        return t3;
    }
    *(int *)((char *)&loc_a + 0) = 0x304;
    t4 = far_cad90((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a), *(int *)((char *)&loc_a + 4), 2);
    if (t4 != 0) {
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_a + 4)) >> 16), t4);
    }
    t5 = far_cad90((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), *(int *)((char *)&loc_a + 4), 4);
    if (t5 != 0) {
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_a + 4)) >> 16), t5);
    }
    p560 = *(int *)((char *)&loc_4 + 0);
    p562 = *(int *)((char *)&loc_a + 4);
    t6 = far_daa59(W_8C39, W_8C3B);
    p564 = (int)(t6 >> 16);
    t7 = far_cadb4(5, (int)t6, p564);
    if ((int)t7 != 0) {
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_a + 4)) >> 16), (int)t7);
    }
    loc_222[535] = (char)0;
    loc_222[529] = (char)1;
    for (;;) {
        __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_226), 0, 0x20e);
        *(int *)((char *)&loc_222 + 532) = SEG_STACK;
        *(int *)((char *)&loc_222 + 530) = (int)(unsigned)loc_222;
        si = 0;
        *(int *)((char *)&loc_a + 2) = si;
        cx = 0;
        *(int *)((char *)&loc_222 + 526) = (unsigned char)loc_222[535];
        ax = (unsigned char)loc_222[535] * 17;
        di = (char near *)ax;
        do {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)di[cx + -24505]);
            *(char far *)((char far *)*(long *)((char *)&loc_222 + 530)) = (char)ax;
            *(int *)((char *)&loc_222 + 530) = *(int *)((char *)&loc_222 + 530) + 1;
            si = si + 1;
            cx = cx + 1;
        } while (cx < 16);
        cx2 = 0;
        ax2 = *(int *)((char *)&loc_222 + 526) * 5;
        *(int *)((char *)&loc_222 + 524) = ax2;
        do {
            ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char *)((char *)&TBL_A5CF + 0 + cx2 + *(int *)((char *)&loc_222 + 524)));
            *(char far *)((char far *)*(long *)((char *)&loc_222 + 530)) = (char)ax2;
            *(int *)((char *)&loc_222 + 530) = *(int *)((char *)&loc_222 + 530) + 1;
            si = si + 1;
            cx2 = cx2 + 1;
        } while (cx2 < 5);
        cx3 = ((char)(cx2 >> 8) << 8 | (unsigned char)0);
        t9 = (long)(int)*(int *)((char *)&loc_222 + 526) * 0x1f4L;
        dx = (int)(t9 >> 16);
        for (;;) {
            bx = (int)t9 + ((unsigned char)(char)cx3 << 1);
            loc_222[534] = TBL_A7AF[bx];
            dx = ((char)(dx >> 8) << 8 | (unsigned char)TBL_A7B0[bx]);
            if ((char)dx != 0) {
                *(char far *)((char far *)*(long *)((char *)&loc_222 + 530)) = loc_222[534];
                *(int *)((char *)&loc_222 + 530) = *(int *)((char *)&loc_222 + 530) + 1;
                *(char far *)((char far *)*(long *)((char *)&loc_222 + 530)) = (char)dx;
                *(int *)((char *)&loc_222 + 530) = *(int *)((char *)&loc_222 + 530) + 1;
                si = si + 2;
                *(int *)((char *)&loc_a + 2) = si;
                cx3 = ((char)(cx3 >> 8) << 8 | (unsigned char)((char)cx3 + 1));
                if ((unsigned char)(char)cx3 >= 250) {
                    break;
                }
                continue;
            }
            break;
        }
        if (*(int *)((char *)&loc_a + 2) != 0) {
            loc_226[0] = (char)cx3;
            loc_226[1] = loc_222[529];
            bx2 = *(int *)((char *)&loc_222 + 526);
            loc_226[2] = TBL_A79B[bx2];
            loc_226[3] = TBL_A787[bx2];
            p560 = *(int *)((char *)&loc_a + 4);
            p562 = SEG_STACK;
            p564 = (int)(unsigned)loc_226;
            t8 = far_cad90(((long)p562 << 16 | (unsigned)p564), p560, si + 4);
            si2 = t8;
            if (t8 != 0) {
                break;
            }
L1:
            loc_222[529] = (char)(loc_222[529] + 1);
            loc_222[535] = (char)(loc_222[535] + 1);
            if ((unsigned char)loc_222[535] < 20) {
                continue;
            }
            goto L2;
        }
        goto L1;
    }
    return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_a + 4)) >> 16), si2);
L2:
    loc_226[0] = (char)0;
    t10 = far_cad90((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_226), *(int *)((char *)&loc_a + 4), 1);
    if (t10 != 0) {
        return ((long)UNDEF << 16 | (unsigned)t10);
    }
    return far_cab20(*(int *)((char *)&loc_a + 4));
}
