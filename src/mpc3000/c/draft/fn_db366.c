/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[1];
    int f_2;
};
extern char B_7FF0;
extern char B_8185;
extern char B_956D;
extern char B_9786;
extern char B_A567;
extern char B_A568;
extern char B_A569;
extern char B_A56A;
extern char B_A56B;
extern char B_A56C;
extern char B_A56D;
extern char B_A570;
extern char B_A5C0;
extern char TBL_956E[];
extern char TBL_9787[];
extern unsigned char TBL_9807[];
extern int far far_d7b6a(struct s1 far *);
extern long far fn_db2f3(struct s1 far *, int);
long far fn_db2f3(struct s1 far *p0, int p1) { return 0; }

int far fn_db366(struct s1 far *arg_0, int arg_2, int arg_4)
{
    char loc_8;
    char loc_7;
    char loc_6;
    char loc_5;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    int bx3;
    int cx;
    int dx;
    int es;
    int es2;
    int es3;
    int es4;
    int flags;
    int flags2;
    int p16;
    int p18;
    int p20;
    int p22;
    char near *si;
    long t1;
    int t2;
    long t3;

    ax = (unsigned char)arg_0->f_0;
    flags = ax - 208;
    if (!CC("!=", flags)) {
        B_A56D = *(char far *)((char far *)arg_0 + 2);
L1:
        ax5 = (int)fn_db2f3(arg_0, arg_4);
L2:
        return ax5;
    }
    if (CC(">", flags)) {
        if (ax != 224) {
            if (ax != 240) {
                goto L1;
            }
            if (B_7FF0 == 0) {
                return ax;
            }
            goto L1;
        }
        if (arg_0->f_2 == 0x4000) {
            ax7 = 0;
        } else {
            ax7 = 1;
        }
        B_A56C = (char)ax7;
        goto L1;
    }
    if (ax == 128) {
        bx = FP_OFF(arg_0);
        es = FP_SEG(arg_0);
        ax2 = (unsigned char)*(char far *)MK_FP(es, bx + 2);
        loc_2 = ax2;
        if (B_9786 != 0) {
            ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 3));
            TBL_9787[loc_2] = (char)ax3;
            return ax3;
        }
        TBL_956E[loc_2] = (char)0;
        if (B_956D != 0) {
            B_956D = (char)(B_956D - 1);
        }
        goto L1;
    }
    if (ax == 144) {
        if (B_A5C0 == 0) {
            t2 = far_d7b6a(arg_0);
        }
        es4 = FP_SEG(arg_0);
        ax6 = (unsigned char)*(char far *)MK_FP(es4, FP_OFF(arg_0) + 2);
        loc_2 = ax6;
        if (TBL_956E[ax6] == 0) {
            TBL_956E[loc_2] = (char)1;
            B_956D = (char)(B_956D + 1);
        } else {
            loc_8 = (char)-128;
            loc_7 = *(char far *)MK_FP(es4, *(int *)((char *)&arg_0 + 0) + 1);
            loc_6 = *(char *)((char *)&loc_2 + 0);
            loc_5 = (char)64;
            t3 = fn_db2f3((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), 4);
            TBL_9787[loc_2] = (char)-1;
        }
        goto L1;
    }
    if (ax != 176) {
        goto L1;
    }
    ax4 = (unsigned char)*(char far *)((char far *)arg_0 + 2);
    flags2 = ax4 - 7;
    if (!CC("!=", flags2)) {
        B_A568 = (char)1;
        goto L1;
    }
    if (!CC(">", flags2)) {
        if (ax4 != 1) {
            if (ax4 != 2) {
                if (ax4 == 4) {
                    B_A569 = *(char far *)((char far *)arg_0 + 3);
                }
            } else {
                B_A56A = *(char far *)((char far *)arg_0 + 3);
            }
        } else {
            B_A56B = *(char far *)((char far *)arg_0 + 3);
        }
        goto L1;
    }
    if (ax4 == 11) {
        B_A567 = (char)1;
        goto L1;
    }
    if (ax4 != 64) {
        goto L1;
    }
    ax5 = B_8185;
    if (ax5 == 0) {
        goto L1;
    }
    if (B_A570 != 0) {
        goto L1;
    }
    if (*(char far *)((char far *)arg_0 + 3) != 0) {
        B_9786 = (char)1;
        return ax5;
    }
    if (B_9786 == 0) {
        goto L2;
    }
    B_9786 = (char)0;
    bx2 = FP_OFF(arg_0);
    es2 = FP_SEG(arg_0);
    *(char far *)MK_FP(es2, bx2) = (char)-128;
    loc_4 = 0;
    si = TBL_9787;
    do {
        if (*si != -1) {
            bx3 = FP_OFF(arg_0);
            es3 = FP_SEG(arg_0);
            *(char far *)MK_FP(es3, bx3 + 2) = *(char *)((char *)&loc_4 + 0);
            *(char far *)MK_FP(es3, bx3 + 3) = *si;
            p16 = arg_4;
            p18 = arg_2;
            p20 = bx3;
            p22 = 0xe3c6;
            t1 = fn_db2f3(((long)p18 << 16 | (unsigned)p20), p16);
            cx = UNDEF;
            es2 = UNDEF;
            ax5 = (int)t1;
            dx = (int)(t1 >> 16);
            *si = (char)-1;
            bx2 = loc_4;
            TBL_956E[bx2] = (char)0;
            B_956D = (char)(B_956D - 1);
        }
        si = si + 1;
        loc_4 = loc_4 + 1;
    } while (si != (char near *)TBL_9807);
    return ax5;
}
