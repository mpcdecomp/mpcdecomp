/* differs: 308 at +5, 633 bytes; 311 at +5, 633 bytes; 312 at +5, 633 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[4];
    char f_4;
    char pad_5[8];
    char f_d;
};
extern char B_7B87;
extern char B_7B88;
extern char B_D4C0;
extern char B_D4C1;
extern int FP_7B8F;
extern char TBL_79A5[];
extern char TBL_7B5E[];
extern int W_7B91;
extern int W_D4AD;
extern long far far_b0caf(void);
extern int far far_b0e80(void far *);
extern void far far_b1015(char);
extern int far far_b1ae0(int);
extern long far far_b32ec(int);
extern void far far_b342e(void);

long far far_b30df(int arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    struct s1 far *loc_6;
    int loc_8;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int di;
    int dx;
    int flags;
    int si;
    int t1;
    long t10;
    long t11;
    long t12;
    long t13;
    int t14;
    int t2;
    long t3;
    int t4;
    long t5;
    int t6;
    int t7;
    int t8;
    int t9;

    dx = FP_7B8F;
    loc_4 = W_7B91;
    *(int *)((char *)&loc_6 + 0) = dx;
    si = 0;
    loc_2 = 0;
    ax = *(char *)((char *)&arg_0 + 0);
    loc_8 = ax;
    if ((TBL_79A5[ax] & 2) != 0) {
        t1 = far_b0e80(MK_FP(SEG_DATA, 0x1dd8));
        far_b1015(*(char *)((char *)&arg_0 + 0));
        return ((long)UNDEF << 16 | (unsigned)0);
    }
    di = W_D4AD;
    if ((loc_6->f_d & 4) != 0) {
        t3 = (long)(int)di * 10L;
        dx = (int)(t3 >> 16);
        di = (int)t3;
    }
    ax2 = loc_8;
    flags = ax2 - 60;
    if (!CC("!=", flags)) {
        if (B_7B88 != 0) {
            si = 0x400;
        } else if (B_7B87 != 0) {
            ax3 = loc_6->f_4 - 1;
            if (B_7B87 == ax3 && TBL_7B5E[B_7B87] != 32) {
                far_b1015(32);
                dx = UNDEF;
            } else {
                ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)B_7B87);
                B_7B87 = (char)((char)ax4 - 1);
                TBL_7B5E[(signed char)((char)ax4 - 1)] = (char)32;
                ax5 = far_b1ae0(127);
                dx = UNDEF;
            }
        }
    } else if (!CC(">", flags)) {
        if (ax2 == 43) {
            goto L1;
        }
        if (ax2 == 45) {
            di = -di;
L1:
            t5 = far_b0caf();
            far_b342e();
            dx = (int)(far_b32ec(UNDEF + di) >> 16);
            si = -0x8000;
        } else {
            if (ax2 != 46) {
                goto L2;
            }
            if ((loc_6->f_d & 4) != 0) {
                t7 = far_b0e80(MK_FP(SEG_DATA, 0x1dd8));
                far_b1015(*(char *)((char *)&arg_0 + 0));
                dx = UNDEF;
            } else if (B_7B88 != 0) {
                far_b342e();
                dx = (int)(far_b32ec(-UNDEF) >> 16);
                si = -0x8000;
            } else {
                t10 = far_b0caf();
                dx = (int)(t10 >> 16);
                si = (int)t10 + 0x800;
            }
        }
    } else if (ax2 != 62) {
        if (ax2 == 68) {
            if ((loc_6->f_d & 16) != 0) {
                t11 = far_b0caf();
                dx = (int)(far_b32ec(B_D4C0) >> 16);
                si = -0x8000;
            } else if ((arg_2 & 192) != 0) {
                loc_2 = 1;
            }
        } else if (ax2 == 78) {
            if ((loc_6->f_d & 16) != 0 && B_D4C1 >= 35 && B_D4C1 <= 98) {
                t12 = far_b0caf();
                dx = (int)(far_b32ec(B_D4C1) >> 16);
                si = -0x8000;
            } else if ((arg_2 & 64) != 0) {
                loc_2 = 1;
            }
        } else {
L2:
            loc_2 = 1;
        }
    } else {
        t13 = far_b0caf();
        dx = (int)(t13 >> 16);
        si = (int)t13 + 0x800;
    }
    if (loc_2 != 0) {
        if (B_7B88 == 0) {
            far_b342e();
            dx = (int)(far_b32ec(UNDEF) >> 16);
        }
        si = *(char *)((char *)&arg_0 + 0);
    }
    return ((long)dx << 16 | (unsigned)si);
}
long far far_b32ec(int p0) { return 0; }
void far far_b342e(void) { }
