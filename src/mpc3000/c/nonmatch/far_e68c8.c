/* differs: 308 at +5, 495 bytes; 311 at +5, 495 bytes; 312 at +5, 494 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_A7B0 {
    char f_0;
};
struct g_W_901D {
    long f_0;
    char pad_4[332];
    char f_150;
};
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char TBL_8CE7[];
extern char TBL_8D4B[];
extern char TBL_8DAF[];
extern char TBL_90C1[];
extern char TBL_9125[];
extern char TBL_9189[];
extern char TBL_A7AF[];
extern struct g_TBL_A7B0 TBL_A7B0;
extern struct g_W_901D W_901D;
extern int W_901F;
extern long far far_e0031(unsigned char far *);
extern long far far_e12dc(int, int);
extern long far far_e1e11(int);
extern long far far_e259f(char);
extern void far far_e344a(unsigned char far *);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_e7cf9(int, int);

int far far_e68c8(int arg_0, int arg_2)
{
    char loc_70[100];
    int loc_c;
    long loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int cx;
    int di;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int p120;
    int p122;
    int si2;
    long t1;
    long t2;
    int t3;
    long t4;
    long t5;
    long t6;
    long t7;

    loc_4 = 0;
    if (*(char *)((char *)&TBL_A7B0 + 0 + arg_0 * 0x1f4) == 0) {
        return -14;
    }
    if ((int)far_e259f(*(char *)((char *)&arg_2 + 0)) == 0) {
        t1 = far_e1e11(arg_2);
    }
    ax = arg_0 * 0x1f4 + (loc_4 << 1);
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)TBL_A7AF[ax]);
    loc_2 = (unsigned char)(char)ax2;
    t2 = far_e12dc((unsigned char)(char)ax2, arg_2);
    loc_6 = (int)t2;
    if ((int)t2 != 0) {
        return (int)t2;
    }
    dx = *(int *)((char *)&W_901D + 0);
    loc_8 = (int)(((long)W_901F << 16 | (unsigned)dx) + 0x151L >> 16);
    *(int *)((char *)&loc_a + 0) = dx + 0x151;
    dx2 = *(char far *)((char far *)W_901D.f_0 + 336);
    for (;;) {
        ax3 = dx2;
        dx2 = dx2 - 1;
        if (ax3 == 0) {
            break;
        }
        bx2 = (int)loc_a;
        es2 = (int)(loc_a >> 16);
        if (*(char far *)MK_FP(es2, bx2) != -1) {
            *(char far *)MK_FP(es2, bx2) = *(char far *)MK_FP(es2, bx2 + 1);
        }
        *(int *)((char *)&loc_a + 0) = *(int *)((char *)&loc_a + 0) + 24;
    }
    far_e344a((unsigned char far *)B_901B);
    ax4 = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_2 + 0));
    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_70), ((char)ax4 << 8 | (unsigned char)(char)ax4), 100);
    di = (int)(unsigned)&loc_c;
    ax5 = arg_0 * 0x1f4 + (loc_4 << 1);
    loc_c = ax5;
    for (;;) {
L1:
        if (*(char *)((char *)&TBL_A7B0 + 0 + loc_c) == 0) {
            break;
        }
        ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)TBL_A7AF[loc_c]);
        loc_2 = (unsigned char)(char)ax6;
        loc_c = loc_c + 2;
        p120 = 1;
        p122 = (unsigned char)(char)ax6;
        t7 = far_e51be((unsigned char far *)B_8C41, p122, p120);
        bx = UNDEF;
        cx = UNDEF;
        es = UNDEF;
        ax5 = (int)t7;
        dx3 = (int)(t7 >> 16);
        si2 = 0;
        for (;;) {
            if ((TBL_8CE7[si2] & 2) != 0) {
                p120 = si2;
                p122 = loc_2;
                t4 = far_e7cf9(p122, p120);
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                ax5 = (int)t4;
                dx3 = (int)(t4 >> 16);
                di = ax5;
                if (di != -5 && (TBL_90C1[di] & 2) == 0) {
                    ax7 = ((char)(ax5 >> 8) << 8 | (unsigned char)TBL_8CE7[si2]);
                    TBL_90C1[di] = (char)ax7;
                    ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)TBL_8D4B[si2]);
                    TBL_9125[di] = (char)ax8;
                    ax9 = ((char)(ax8 >> 8) << 8 | (unsigned char)TBL_8DAF[si2]);
                    TBL_9189[di] = (char)ax9;
                    ax5 = ((char)(ax9 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_2 + 0));
                    loc_70[di] = (char)ax5;
                }
            }
            si2 = si2 + 1;
            if (si2 < 100) {
                continue;
            }
            goto L1;
        }
    }
    t5 = far_e0031((unsigned char far *)B_8C41);
    t6 = far_e0031((unsigned char far *)B_901B);
    return 0;
}
