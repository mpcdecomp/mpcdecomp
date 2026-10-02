/* differs: 308 at +0, 400 bytes; 311 at +0, 405 bytes; 312 at +0, 406 bytes */
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
extern char TBL_7FEB;
extern unsigned char TBL_d653a[];
extern unsigned char TBL_d6561[];
extern long far far_eb71a(void);
extern void far far_eb739(void);
extern void far far_eb769(void);
extern long far far_eb799(void);
extern int far far_fb3a9(void);
extern int far far_fb4a2(void);
extern void near fn_d693e(void);
extern long near fn_d699c(void);
extern void near tgt_d6662();
extern int near tgt_d6693();
extern long near tgt_d66d2();
extern void near tgt_d66dc();
extern void near tgt_d671b();
extern void near tgt_d6732();
extern long near tgt_d67e0();
extern int near tgt_d6831();
extern void near tgt_d68d5();

long near tgt_d651f(void)
{
    int ax;
    int bx;
    int bx2;
    int dx;
    int si;
    unsigned int si2;
    int t1;
    int t2;
    int t3;
    long t4;
    int t5;

    if (((char)ax & -128) == 0) {
        goto L1;
    }
    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)((char)ax & -16));
    TBL_7148[si] = (char)ax;
    switch ((unsigned int)(unsigned)(TBL_d653a + (((char)(bx >> 8) << 8 | (unsigned char)((unsigned int)(char)bx >> 3)) & 14))) {
    case 0:
        goto L2;
    case 1:
        bx2 = (int)(unsigned)tgt_d651f;
        if ((TBL_7FEB & 1) != 0) {
            bx2 = (int)(unsigned)tgt_d66dc;
        }
        goto L1;
    case 2:
        bx2 = (int)(unsigned)tgt_d651f;
        if ((B_7FEF & 1) != 0) {
L2:
            bx2 = (int)(unsigned)tgt_d651f;
            if ((TBL_7FEB & 1) != 0) {
                bx2 = (int)(unsigned)tgt_d671b;
            }
        }
        goto L3;
    case 3:
        bx2 = (int)(unsigned)tgt_d6732;
        goto L1;
    case 4:
        bx2 = (int)(unsigned)tgt_d651f;
        if ((B_7FEC & 1) != 0) {
            bx2 = (int)(unsigned)tgt_d66d2;
        }
        goto L1;
    case 5:
        bx2 = 0x764;
        goto L1;
    case 6:
        bx2 = (int)(unsigned)tgt_d651f;
        if ((B_7FED & 1) != 0) {
            bx2 = (int)(unsigned)tgt_d68d5;
        } else {
L3:
        }
        goto L1;
    case 7:
        bx2 = (int)(unsigned)tgt_d651f;
        si2 = si << 1;
        *(int *)((char *)&TBL_7144 + 0 + si2) = bx2;
        si = si2 >> 1;
        switch ((unsigned int)(unsigned)(TBL_d6561 + ((ax & 15) << 1))) {
        case 0:
            bx2 = (int)(unsigned)tgt_d67e0;
            goto L1;
        case 1:
            if (B_7FD1 == 1) {
                bx2 = (int)(unsigned)tgt_d6831;
            }
            goto L1;
        case 2:
            bx2 = (int)(unsigned)tgt_d6662;
            goto L1;
        case 3:
            bx2 = (int)(unsigned)tgt_d6693;
            goto L1;
        case 4:
        case 5:
        case 7:
        case 9:
        case 13:
        case 14:
        case 15:
            goto L4;
        case 6:
            if ((B_8074 & 1) != 0) {
                fn_d693e();
                t4 = fn_d699c();
                bx2 = UNDEF;
                ax = (int)t4;
                dx = (int)(t4 >> 16);
                if (B_A5C1 == 0) {
                    t5 = far_fb4a2();
                    B_D613.f_0 = B_A5C1;
                    B_D613.f_1 = (char)0;
                    ax = far_fb3a9();
                    dx = UNDEF;
                    bx2 = bx2;
                    si = si;
                }
L1:
                *(int *)((char *)&TBL_7144 + 0 + (si << 1)) = bx2;
                return ((long)dx << 16 | (unsigned)ax);
            }
L4:
            return;
        case 8:
            return far_eb71a();
        case 10:
            far_eb739();
            return;
        case 11:
            far_eb769();
            return;
        case 12:
            return far_eb799();
        }
    }
}
void near tgt_d6662(void) { }
int near tgt_d6693(void) { return 0; }
long near tgt_d66d2(void) { return 0; }
void near tgt_d66dc(void) { }
void near tgt_d671b(void) { }
void near tgt_d6732(void) { }
long near tgt_d67e0(void) { return 0; }
int near tgt_d6831(void) { return 0; }
void near tgt_d68d5(void) { }
