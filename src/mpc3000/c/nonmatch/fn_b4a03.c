/* differs: 308 absent; 311 at +5, 819 bytes; 312 at +5, 819 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_8802;
extern unsigned char B_8803;
extern unsigned char B_8804;
extern char B_A5CE;
extern char B_D5DD;
extern char B_D5DE;
extern char TBL_A787[];
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern char TBL_A7B1[];
extern char TBL_A7B2[];
extern char TBL_A9A2[];
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1f96(int);
extern long far far_b3819(void far *, int far *, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_e6fef(void);
extern int far fn_b484b(int);
extern long far fn_b4c4b(void);
int far fn_b484b(int p0) { return 0; }

long far fn_b4a03(void)
{
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    int ax17;
    int ax18;
    int ax19;
    int ax2;
    int ax20;
    int ax21;
    int ax22;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int bx3;
    int cx;
    int cx2;
    int di;
    int dx;
    int p20;
    int si;
    int si2;
    int si3;
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

    t1 = far_e6fef();
    ax = B_8804 - 1;
    loc_2 = ax;
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_A5CE);
    loc_8 = (unsigned char)(char)ax2;
    loc_4 = (unsigned char)(char)ax2;
    loc_6 = (unsigned char)(char)ax2;
    t2 = far_b6cd3(MK_FP(SEG_DATA, 0x1f62));
    far_b1ad0(1, 0);
    t3 = far_b3819(MK_FP(SEG_DATA, 0x1f83), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 3, 1, 250, 0);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x1f94), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 3, 1, 250, 0);
    far_b1ad0(2, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x1fa3));
    t5 = far_b90dd();
    far_b1ad0(6, 19);
    far_b1b05(MK_FP(SEG_DATA, 0x1ece));
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x203c));
    far_b1f96(21);
    p20 = 0x2045;
    ax11 = far_b1b05(MK_FP(SEG_DATA, p20));
    dx = UNDEF;
    si = 0;
    while (si == 0) {
        dx = UNDEF;
        si = far_b08f7(4);
        if (si == 121) {
            si = 0;
            continue;
        }
        p20 = 0xb3ef;
        t6 = fn_b484b(loc_2);
        dx = UNDEF;
        di = t6;
        ax22 = B_7B8D;
        if (ax22 == 0) {
            if (loc_4 > di) {
                loc_4 = di;
            }
            t8 = far_b1073(0);
            dx = (int)(t8 >> 16);
            continue;
        }
        if (ax22 != 1) {
            continue;
        }
        if (loc_6 > di) {
            loc_6 = di;
        }
        t7 = far_b1073(1);
        dx = (int)(t7 >> 16);
    }
    ax12 = si;
    if (ax12 != 117) {
        if (ax12 == 120) {
            ax19 = ((char)(ax12 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_4 + 0));
            B_A5CE = (char)ax19;
            B_8803 = (unsigned char)((char)ax19 - 1);
            bx2 = loc_2;
            if ((unsigned char)TBL_A787[bx2] >= (unsigned char)*(char *)((char *)&loc_4 + 0)) {
                TBL_A787[bx2] = (char)(TBL_A787[bx2] + 1);
            }
            cx2 = 248;
            t10 = (long)(int)loc_2 * 0x1f4L;
            dx = (int)(t10 >> 16);
            si3 = (int)t10 + 0x1f0;
            ax20 = B_8803;
            loc_a = ax20;
            while (loc_a <= cx2) {
                ax21 = ((char)(ax20 >> 8) << 8 | (unsigned char)TBL_A7AF[si3]);
                TBL_A7B1[si3] = (char)ax21;
                ax20 = ((char)(ax21 >> 8) << 8 | (unsigned char)TBL_A7B0[si3]);
                TBL_A7B2[si3] = (char)ax20;
                si3 = si3 - 2;
                cx2 = cx2 - 1;
            }
            bx3 = (int)t10 + (loc_a << 1);
            if (TBL_A7AF[bx3] == 0) {
                TBL_A7AF[bx3] = (char)1;
            }
            if (TBL_A7B0[bx3] == 0) {
                TBL_A7B0[bx3] = (char)1;
            }
            TBL_A9A2[(int)t10] = (char)0;
            B_8802 = (char)0;
            si = B_D5DE;
        } else if (ax12 == 122) {
            ax13 = ((char)(ax12 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_6 + 0));
            B_A5CE = (char)ax13;
            ax14 = ((char)(ax13 >> 8) << 8 | (unsigned char)((char)ax13 - 1));
            B_8803 = (char)ax14;
            bx = loc_2;
            ax15 = ((char)(ax14 >> 8) << 8 | (unsigned char)TBL_A787[bx]);
            if ((unsigned char)(char)ax15 > (unsigned char)*(char *)((char *)&loc_6 + 0)) {
                TBL_A787[bx] = (char)(TBL_A787[bx] - 1);
            }
            ax16 = ((char)(ax15 >> 8) << 8 | (unsigned char)B_8803);
            loc_a = (unsigned char)(char)ax16;
            cx = (unsigned char)(char)ax16;
            si2 = loc_2 * 0x1f4 + (cx << 1);
            ax17 = di - 1;
            dx = ax17;
            while (dx > cx) {
                ax18 = ((char)(ax17 >> 8) << 8 | (unsigned char)TBL_A7B1[si2]);
                TBL_A7AF[si2] = (char)ax18;
                ax17 = ((char)(ax18 >> 8) << 8 | (unsigned char)TBL_A7B2[si2]);
                TBL_A7B0[si2] = (char)ax17;
                si2 = si2 + 2;
                cx = cx + 1;
            }
            B_8802 = (char)0;
            si = B_D5DE;
        }
    } else {
        B_D5DD = (char)2;
        t9 = fn_b4c4b();
        dx = (int)(t9 >> 16);
        si = (int)t9;
    }
    return ((long)dx << 16 | (unsigned)si);
}
long far fn_b4c4b(void) { return 0; }
