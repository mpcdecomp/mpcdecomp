/* differs: 308 at +5, 360 bytes; 311 at +5, 359 bytes; 312 at +5, 359 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_7DF5 {
    int f_0;
};
struct g_TBL_7FD7 {
    int f_0;
};
struct g_TBL_7FD5 {
    int f_0;
};
extern char B_7B8D;
extern unsigned char B_901B[];
extern char B_D4C2;
extern struct g_TBL_7DF5 TBL_7DF5;
extern struct g_TBL_7FD5 TBL_7FD5;
extern struct g_TBL_7FD7 TBL_7FD7;
extern unsigned char W_7FD9[];
extern unsigned char W_7FDD[];
extern unsigned char W_9051[];
extern long far L_ef4d3();
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1f96();
extern long far far_b39a2();
extern void far far_bffc9();
extern long far far_e5612();
extern long far far_e5a99();
extern long far far_ec03b();

long far far_bef6c(void)
{
    char loc_1;
    char loc_4[3];
    long loc_6;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    int dx;
    int es;
    int flags;
    int p14;
    int si;
    long t1;
    long t10;
    long t11;
    int t12;
    long t2;
    long t3;
    long t4;
    long t5;
    int t6;
    long t7;
    int t8;
    int t9;

    t1 = far_ec03b(0x4424);
    t2 = far_e5a99(B_901B);
    far_b1ad0(1);
    far_b1b05(0x442b);
    far_b1ad0(2);
    t3 = far_b39a2(MK_FP(SEG_DATA, 0x4454), &TBL_7FD5);
    far_b1ad0(3);
    t4 = far_b39a2(MK_FP(SEG_DATA, 0x445f), W_7FD9);
    far_b1ad0(4);
    t5 = far_b39a2(MK_FP(SEG_DATA, 0x446a), W_7FDD);
    far_bffc9();
    p14 = 0x4475;
    ax6 = far_b1b05(p14);
    dx = UNDEF;
    *(int *)((char *)&loc_4 + 0) = SEG_DATA;
    *(int *)((char *)&loc_6 + 0) = (int)(unsigned)W_9051;
    loc_1 = (char)0;
    for (;;) {
        if (loc_1 == 0) {
            do {
                t12 = far_b08f7();
                dx = UNDEF;
                loc_1 = (char)t12;
            } while ((char)t12 == 0);
            flags = (char)t12 - 120;
            if (!CC("==", flags)) {
                if (!CC(">", flags)) {
                    if ((char)t12 != 47) {
                        if ((char)t12 != 117) {
                            continue;
                        }
                        bx = (int)loc_6;
                        es = (int)(loc_6 >> 16);
                        bx2 = *(int far *)MK_FP(es, bx);
                        si = B_7B8D << 2;
                        *(int *)((char *)&TBL_7FD7 + 0 + si) = *(int far *)MK_FP(es, bx + 2);
                        *(int *)((char *)&TBL_7FD5 + 0 + si) = bx2;
                        t7 = far_b1073();
                        dx = (int)(t7 >> 16);
                        loc_1 = (char)0;
                        continue;
                    }
                    loc_1 = (char)(B_7B8D + 120);
                    goto L1;
                }
                if ((char)t12 != 121 && (char)t12 != 122) {
                    continue;
                }
L1:
                t8 = far_b1ad0(7);
                t9 = far_b1f96();
                p14 = *(int *)((char *)&TBL_7DF5 + 0 + (loc_1 << 2));
                t10 = far_e5612(p14);
                t11 = L_ef4d3();
                dx = (int)(t11 >> 16);
                loc_1 = B_D4C2;
                continue;
            }
            goto L1;
        }
        break;
    }
    return ((long)dx << 16 | (unsigned)loc_1);
}
