/* differs: 308 at +5, 500 bytes; 311 at +5, 501 bytes; 312 at +5, 501 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_1E98;
extern char B_1E99;
extern char B_7B8D;
extern char B_8802;
extern char B_8803;
extern unsigned char B_8804;
extern char B_D5DD;
extern char B_D5DE;
extern char TBL_A5BB[];
extern char TBL_A5CA[];
extern char TBL_A786[];
extern char TBL_A79A[];
extern int far far_b08f7(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b3819(void far *, unsigned char far *, int, int, int);
extern long far far_b6cd3(int);
extern long far far_b9102(void);
extern long far far_d7805(int, char far *, int);
extern long far fn_b49c4(int, int);
extern long far fn_b4de1(void);
long far fn_b49c4(int p0, int p1) { return 0; }

long far fn_b4c4b(void)
{
    char loc_4[4];
    int loc_6;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    int cx;
    unsigned int cx2;
    int cx3;
    int cx4;
    int dx;
    int dx2;
    int p16;
    int p18;
    int p20;
    int si;
    long t1;
    long t10;
    long t2;
    long t3;
    long t4;
    long t5;
    int t6;
    long t7;
    long t8;
    long t9;

    t1 = far_b6cd3(0x1fd7);
    far_b1ad0(1);
    t2 = far_b3819(MK_FP(SEG_DATA, 0x1fe3), (unsigned char far *)&B_8804, 2, 1, 20);
    p18 = B_8804;
    p20 = 0xbae8;
    t3 = fn_b49c4(p18, 1);
    far_b1ad0(2);
    far_b1b05(0x1ff0);
    t4 = far_b9102();
    far_b1ad0(7);
    p16 = 0x2028;
    ax5 = far_b1b05(p16);
    for (;;) {
        t6 = far_b08f7();
        dx = t6;
        if (t6 != 0) {
            break;
        }
        if (B_7B8D == 0) {
            p16 = 1;
            p18 = B_8804;
            p20 = 0xbae8;
            t5 = fn_b49c4(p18, p16);
            continue;
        }
    }
    if (t6 != 120) {
        if (t6 == 121) {
            B_D5DD = (char)3;
            dx = (int)fn_b4de1();
        }
    } else {
        cx = 0;
        si = 0;
        ax6 = ((char)(t6 >> 8) << 8 | (unsigned char)B_8804);
        loc_6 = (unsigned char)(char)ax6;
        t7 = (long)(int)(unsigned char)(char)ax6 * 0x1f4L;
        do {
            bx = (int)t7 + si;
            TBL_A5BB[bx] = (char)0;
            TBL_A5BB[bx + 1] = (char)0;
            si = si + 2;
            cx = cx + 1;
        } while (si != 0x1f4);
        bx2 = loc_6;
        TBL_A79A[bx2] = (char)0;
        TBL_A786[bx2] = (char)1;
        t8 = far_d7805(bx2, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 2);
        B_1E98 = loc_4[0];
        B_1E99 = loc_4[1];
        dx2 = ((char)((int)(t8 >> 16) >> 8) << 8 | (unsigned char)B_8804);
        loc_6 = (unsigned char)(char)dx2;
        t9 = (long)(int)(unsigned char)(char)dx2 * 17L;
        cx2 = ~__repne_scas1(MK_FP(SEG_DATA, 0x1e12), 0, -1);
        cx3 = cx2 >> 1;
        __movs2(MK_FP(SEG_DATA, (int)t9 - 0x5fca), MK_FP(SEG_DATA, (int)t9 - 0x5fca), cx3 * 2);
        __movs1(MK_FP(SEG_DATA, (int)t9 - 0x5fca + cx3 * 2), MK_FP(SEG_DATA, (int)t9 - 0x5fca + cx3 * 2), cx2 & 1);
        cx4 = 0;
        t10 = (long)(int)(loc_6 * 0x1f4) * 5L;
        do {
            *(char *)((char *)&TBL_A5CA + 0 + cx4 + (int)t10) = (char)0;
            cx4 = cx4 + 1;
        } while (cx4 < 5);
        B_8802 = (char)0;
        B_8803 = (char)0;
        dx = B_D5DE;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far fn_b4de1(void) { return 0; }
