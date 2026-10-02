/* differs: 308 absent; 311 at +9, 481 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern int W_7ACC;
extern long far far_d567e(int, int, int, int, char far *);
extern long far far_fa3be(char far *, char far *, int);

int far fn_d5296(int arg_0, int arg_2)
{
    char loc_290[104];
    char loc_228;
    char loc_227;
    char loc_226;
    char loc_225[8];
    int loc_21d;
    char loc_21b;
    int loc_21a;
    char loc_218;
    int loc_217;
    int loc_215;
    char loc_213;
    int loc_212;
    int loc_210;
    char loc_20e[6];
    char loc_208;
    char loc_207[63];
    char loc_1c8[444];
    char loc_c;
    char loc_b;
    char loc_a;
    char loc_9;
    int loc_8;
    int loc_6;
    long loc_4;
    int loc_2;
    unsigned int ax;
    int ax2;
    int ax3;
    int bx;
    int bx2;
    unsigned int bx3;
    unsigned int bx4;
    unsigned int bx5;
    int cx;
    int cx2;
    int dx;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;

    loc_228 = (char)-23;
    loc_227 = (char)0;
    loc_226 = (char)0;
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_225), MK_FP(SEG_DATA, 0x707a), 8);
    *(char *)((char *)&loc_21d + 0) = *(char *)(0x7082);
    loc_21d = 0x200;
    loc_21b = (char)16;
    loc_21a = 1;
    loc_218 = (char)2;
    loc_217 = 0x200;
    loc_213 = (char)-8;
    loc_210 = 16;
    *(int *)((char *)&loc_20e + 0) = 16;
    loc_215 = arg_0;
    loc_212 = 11;
    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_290), 0, 104);
    loc_6 = 0;
    cx = (int)(unsigned)loc_290;
    if (loc_6 < arg_2) {
        do {
            dx = *(int *)((char *)&loc_4 + 0);
            *(int far *)MK_FP(SEG_STACK, cx + 2) = loc_2;
            *(int far *)MK_FP(SEG_STACK, cx) = dx;
            ax = arg_0;
            *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + ax;
            loc_2 = (int)(loc_4 + (unsigned long)(unsigned int)ax >> 16);
            cx = cx + 4;
            loc_6 = loc_6 + 1;
        } while (loc_6 < arg_2);
    }
    loc_6 = 0;
    loc_8 = (int)(unsigned)loc_290;
    if (loc_6 >= arg_2) {
L1:
        return 0;
    }
    for (;;) {
        __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_208), 0, 0x200);
        t2 = far_fa3be((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_228), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_208), 32);
        t3 = far_fa3be((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_290), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c8), 104);
        loc_c = (char)85;
        loc_b = (char)-86;
        loc_a = (char)85;
        loc_9 = (char)-86;
        bx = loc_8;
        t4 = far_d567e(W_7ACC, *(int far *)MK_FP(SEG_STACK, bx), *(int far *)MK_FP(SEG_STACK, bx + 2), 1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_208));
        if ((int)t4 != 0) {
            break;
        }
        si = 0;
        while ((loc_212 << 1) + 32 > si) {
            __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_208), 0, 0x200);
            if (si == 0) {
                loc_208 = (char)-8;
                __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_207), -1, 4);
            }
            ax2 = loc_21a;
            bx2 = loc_8;
            bx3 = *(int far *)MK_FP(SEG_STACK, bx2);
            bx4 = bx3 + ax2;
            bx5 = bx4 + si;
            cx2 = *(int far *)MK_FP(SEG_STACK, bx2 + 2) + -(ax2 < 0) + (bx4 < bx3) + -(si < 0) + (bx5 < bx4);
            loc_2 = cx2;
            *(int *)((char *)&loc_4 + 0) = bx5;
            t1 = far_d567e(W_7ACC, bx5, cx2, 1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_208));
            ax3 = (int)t1;
            if (ax3 != 0) {
                goto L2;
            }
            si = si + 1;
        }
        loc_8 = loc_8 + 4;
        loc_6 = loc_6 + 1;
        if (loc_6 >= arg_2) {
            goto L1;
        }
    }
    return (int)t4;
L2:
    return ax3;
}
