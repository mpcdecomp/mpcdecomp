/* differs: 308 at +3, 831 bytes; 311 at +3, 831 bytes; 312 at +3, 830 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[18];
    int f_12;
    int f_14;
};
extern unsigned char B_8800;
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char TBL_9784[];
extern unsigned char TBL_d97b8[];
extern long far far_e56a0();
extern long near fn_d995d(void);
extern long near fn_d9980(void);

long far far_d97ca(int arg_0, long arg_2, unsigned int arg_6)
{
    int ax;
    int ax10;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    struct s1 near *bx6;
    int bx7;
    unsigned int cx;
    unsigned int cx2;
    int di;
    int di2;
    int di3;
    int di4;
    int ds;
    int ds2;
    int ds3;
    int ds4;
    unsigned int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int p10;
    int p8;
    int si;
    int si2;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    bx = arg_0;
    if (bx >= 9) {
        return;
    }
    switch ((unsigned int)(unsigned)(TBL_d97b8 + (bx << 1))) {
    case 0:
    case 2:
        goto L1;
    case 1:
        bx6 = (struct s1 near *)B_901B;
        if (*(char *)((char near *)bx6) < 0) {
            return ((long)dx << 16 | (unsigned)0);
        }
        goto L2;
    case 3:
        bx6 = (struct s1 near *)B_8C41;
L2:
        p8 = bx6->f_14;
        p10 = bx6->f_12;
        di3 = (int)arg_2;
        ds3 = (int)(arg_2 >> 16);
        si2 = (int)*(long far *)MK_FP(ds3, (unsigned int)(unsigned)(struct s1 near *)((char near *)bx6 + 18));
        t3 = fn_d995d();
        bx7 = UNDEF;
        ax7 = (int)t3;
        dx3 = (int)(t3 >> 16);
        do {
            *(int far *)MK_FP(ds3, bx7 + 18) = si2;
            *(int far *)MK_FP(ds3, bx7 + 20) = dx3;
            *(char far *)MK_FP(ds3, di3) = (char)ax7;
            di3 = di3 + 1;
            t4 = fn_d995d();
            bx7 = UNDEF;
            ax7 = (int)t4;
            dx3 = (int)(t4 >> 16);
        } while (((char)ax7 & -128) == 0 && (unsigned int)UNDEF < arg_6);
        if (*(char far *)MK_FP(ds3, bx7) == 0) {
            goto L3;
        }
        if ((*(char far *)MK_FP(ds3, bx7 + 1) & -128) == 0 && *(char far *)MK_FP(ds3, (unsigned)&B_8800) != 0) {
            goto L3;
        }
        di4 = (int)arg_2;
        ds4 = (int)(arg_2 >> 16);
        ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds4, di4));
        ax9 = ((char)(ax8 >> 8) << 8 | (unsigned char)((char)ax8 & -8));
        if ((char)ax9 == -88) {
            ax10 = *(int far *)MK_FP(ds4, di4 + 1);
            t5 = far_e56a0(*(int far *)MK_FP(ds4, bx7 + 1));
            dx3 = p8;
            if ((unsigned int)((char)(ax10 >> 8) << 8 | (unsigned char)((char)ax10 << 1)) >> 1 == *(int far *)MK_FP(ds4, UNDEF + 50)) {
                *(int far *)MK_FP(ds4, UNDEF + 28) = dx3;
                *(int far *)MK_FP(ds4, UNDEF + 26) = p10;
            }
        } else {
            if ((char)ax9 == -8) {
                dx3 = (int)(far_e56a0(*(int far *)MK_FP(ds4, bx7 + 1), 0) >> 16);
            }
L3:
        }
        return ((long)dx3 << 16 | (unsigned)UNDEF);
    case 4:
        di2 = (int)arg_2;
        ds2 = (int)(arg_2 >> 16);
        _disable();
        t1 = fn_d9980();
        bx5 = UNDEF;
        cx2 = UNDEF;
        es2 = UNDEF;
        ax6 = (int)t1;
        dx2 = (int)(t1 >> 16);
        if (!CC("!=", UNDEF)) {
            do {
                *(int far *)MK_FP(es2, 2) = dx2;
                *(int far *)MK_FP(es2, 6) = bx5;
                _enable();
                *(char far *)MK_FP(ds2, di2) = (char)ax6;
                di2 = di2 + 1;
                _disable();
                t2 = fn_d9980();
                bx5 = UNDEF;
                cx2 = UNDEF;
                es2 = UNDEF;
                ax6 = (int)t2;
                dx2 = (int)(t2 >> 16);
            } while (!CC("!=", UNDEF) && ((char)ax6 & -128) == 0 && cx2 < arg_6);
        }
        _enable();
        return ((long)dx2 << 16 | (unsigned)cx2);
    case 5:
        ax2 = 0x6ac;
        goto L4;
    case 6:
        ax3 = 0x734;
        bx2 = 0;
        goto L5;
    case 7:
        ax3 = 0xd31;
        bx2 = 1;
L5:
        si = ax3;
        ax4 = 0xa8ec /* SEG_A8EC */;
        es = ax4;
        cx = arg_6;
        dx = *(int far *)MK_FP(es, si + 2);
        if (TBL_9784[bx2] == 0) {
            if (dx < cx) {
                goto L6;
            }
            goto L7;
        }
        TBL_9784[bx2] = (char)(TBL_9784[bx2] - 1);
        goto L7;
        goto L8;
    case 8:
        ax2 = 0x2b36;
L4:
        si = ax2;
        ax4 = 0xa8ec /* SEG_A8EC */;
        es = ax4;
        cx = arg_6;
        dx = *(int far *)MK_FP(es, si + 2);
L7:
        if (dx != 0) {
            di = (int)arg_2;
            ds = (int)(arg_2 >> 16);
            bx3 = *(int far *)MK_FP(es, si + 6);
            if (bx3 == 0) {
                bx3 = *(int far *)MK_FP(es, si);
            }
            bx4 = bx3 - 1;
            ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx4 + 8 + si));
            for (;;) {
                *(char far *)MK_FP(ds, di) = (char)ax5;
                di = di + 1;
                *(int far *)MK_FP(es, si + 6) = bx4;
                cx = cx - 1;
                *(int far *)MK_FP(es, si + 2) = *(int far *)MK_FP(es, si + 2) - 1;
                dx = dx - 1;
                if (dx != 0) {
                    if (bx4 == 0) {
                        bx4 = *(int far *)MK_FP(es, si);
                    }
                    bx4 = bx4 - 1;
                    ax5 = ((char)(ax5 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx4 + 8 + si));
                    if ((char)ax5 >= 0 && cx != 0) {
                        continue;
                    }
                    goto L9;
                }
                break;
            }
            goto L6;
        }
        goto L6;
        goto L8;
    }
    goto L1;
    goto L6;
    goto L8;
L9:
    if ((char)ax5 == -7) {
        *(int far *)MK_FP(es, si + 6) = bx4;
        *(int far *)MK_FP(es, si + 2) = *(int far *)MK_FP(es, si + 2) - 1;
        ax = 0;
    } else {
L6:
        ax = arg_6 - cx;
    }
L8:
L1:
    return ((long)dx << 16 | (unsigned)ax);
}
long near fn_d995d(void) { return 0; }
long near fn_d9980(void) { return 0; }
