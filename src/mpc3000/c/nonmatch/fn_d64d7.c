/* differs: 308 at +0, 540 bytes; 311 at +0, 535 bytes; 312 at +0, 536 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_7144 {
    int f_0;
};
struct g_B_D613 {
    char f_0;
    char f_1;
};
extern char B_7FD1;
extern char B_7FEC;
extern char B_7FED;
extern char B_7FEF;
extern char B_8074;
extern char B_A5C1;
extern struct g_B_D613 B_D613;
extern struct g_TBL_7144 TBL_7144;
extern char TBL_7148[];
extern char TBL_7150[];
extern char TBL_7FEB;
extern unsigned char TBL_d653a[];
extern unsigned char TBL_d6561[];
extern long near br_d662d();
extern long far far_eb71a(void);
extern void far far_eb739(void);
extern void far far_eb769(void);
extern long far far_eb799(void);
extern int far far_fb3a9(void);
extern void far far_fb4a2(void);
extern void near fn_d693e(void);
extern long near fn_d699c(void);
extern long near tgt_d651f();
extern void near tgt_d6662();
extern long near tgt_d6693();
extern long near tgt_d66d2();
extern void near tgt_d66dc();
extern void near tgt_d671b();
extern void near tgt_d6732();
extern long near tgt_d67e0();
extern long near tgt_d6831();
extern void near tgt_d68d5();

void near fn_d64d7(void)
{
    int ax;
    int ax2;
    int ax3;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int dx;
    unsigned int si;
    unsigned int si2;
    unsigned int si3;
    int t1;
    long t2;
    int t3;
    int t4;
    long t5;
    int t6;
    long t7;
    int t8;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)inp(dx));
    if (((char)ax & -128) != 0) {
        if ((unsigned char)(char)ax >= 248) {
            goto L1;
        }
        si = si >> 1;
        if (TBL_7150[si] != 0) {
            TBL_7150[si] = (char)0;
            fn_d693e();
            bx = UNDEF;
            ax = (int)fn_d699c();
        } else {
            si2 = si << 1;
            bx = *(int *)((char *)&TBL_7144 + 0 + si2);
            si = si2 >> 1;
            if (bx == (int)(unsigned)br_d662d) {
                bx = UNDEF;
                ax = (int)fn_d699c();
            }
        }
        bx2 = ((char)(bx >> 8) << 8 | (unsigned char)((char)ax & -16));
        TBL_7148[si] = (char)ax;
        switch ((unsigned int)(unsigned)(TBL_d653a + (((char)(bx2 >> 8) << 8 | (unsigned char)((unsigned int)(char)bx2 >> 3)) & 14))) {
        case 0:
            goto L2;
        case 1:
            goto L3;
        case 2:
            goto L4;
        case 3:
            goto L5;
        case 4:
            goto L6;
        case 5:
            goto L7;
        case 6:
            goto L8;
        case 7:
            goto L9;
        }
    } else {
        bx3 = *(int *)((char *)&TBL_7144 + 0 + si);
        si = si >> 1;
        switch (bx3) {
        case 0x51b:
L9:
            bx4 = (int)(unsigned)tgt_d651f;
            si3 = si << 1;
            *(int *)((char *)&TBL_7144 + 0 + si3) = bx4;
            si = si3 >> 1;
L1:
            switch ((unsigned int)(unsigned)(TBL_d6561 + ((ax & 15) << 1))) {
            case 0:
                bx4 = (int)(unsigned)tgt_d67e0;
                goto L10;
            case 1:
                if (B_7FD1 == 1) {
                    bx4 = (int)(unsigned)tgt_d6831;
                }
                goto L10;
            case 2:
                bx4 = (int)(unsigned)tgt_d6662;
                goto L10;
            case 3:
                bx4 = (int)(unsigned)tgt_d6693;
                goto L10;
            case 4:
            case 5:
            case 7:
            case 9:
            case 13:
            case 14:
            case 15:
                goto L11;
            case 6:
                if ((B_8074 & 1) != 0) {
                    fn_d693e();
                    t7 = fn_d699c();
                    bx4 = UNDEF;
                    if (B_A5C1 == 0) {
                        far_fb4a2();
                        B_D613.f_0 = B_A5C1;
                        B_D613.f_1 = (char)0;
                        ax3 = far_fb3a9();
                        bx4 = bx4;
                        si = si;
                    }
                    goto L10;
                }
L11:
                return;
            case 8:
                t5 = far_eb71a();
                return;
            case 10:
                far_eb739();
                return;
            case 11:
                far_eb769();
                return;
            case 12:
                t2 = far_eb799();
                return;
            }
        case 0x597:
L3:
            bx4 = (int)(unsigned)tgt_d651f;
            if ((TBL_7FEB & 1) != 0) {
                bx4 = (int)(unsigned)tgt_d66dc;
            }
            goto L10;
        case 0x5a7:
L6:
            bx4 = (int)(unsigned)tgt_d651f;
            if ((B_7FEC & 1) != 0) {
                bx4 = (int)(unsigned)tgt_d66d2;
            }
            goto L10;
        case 0x5b7:
L7:
            bx4 = 0x764;
            goto L10;
        case 0x5bd:
L5:
            bx4 = (int)(unsigned)tgt_d6732;
            goto L10;
        case 0x5c3:
L8:
            bx4 = (int)(unsigned)tgt_d651f;
            if ((B_7FED & 1) != 0) {
                bx4 = (int)(unsigned)tgt_d68d5;
            } else {
                goto L12;
            }
            goto L10;
        case 0x5d3:
L4:
            bx4 = (int)(unsigned)tgt_d651f;
            if ((B_7FEF & 1) != 0) {
L2:
                bx4 = (int)(unsigned)tgt_d651f;
                if ((TBL_7FEB & 1) != 0) {
                    bx4 = (int)(unsigned)tgt_d671b;
                }
            }
L12:
L10:
            *(int *)((char *)&TBL_7144 + 0 + (si << 1)) = bx4;
            return;
        case 0x5dd:
            goto L2;
        }
    }
}
long near br_d662d(void) { return 0; }
long near tgt_d651f(void) { return 0; }
void near tgt_d6662(void) { }
long near tgt_d6693(void) { return 0; }
long near tgt_d66d2(void) { return 0; }
void near tgt_d66dc(void) { }
void near tgt_d671b(void) { }
void near tgt_d6732(void) { }
long near tgt_d67e0(void) { return 0; }
long near tgt_d6831(void) { return 0; }
void near tgt_d68d5(void) { }
