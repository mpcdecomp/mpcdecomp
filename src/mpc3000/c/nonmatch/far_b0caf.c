/* differs: 308 at +5, 384 bytes; 311 at +5, 385 bytes; 312 at +5, 385 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define UNDEF 0
struct s1 {
    char pad_0[3];
    char f_3;
    char f_4;
    char pad_5[8];
    char f_d;
};
extern char B_7B5F;
extern char B_7B88;
extern unsigned char B_901B[];
extern char B_9446;
extern char B_D4B4;
extern int FP_7B55;
extern int FP_7B8F;
extern char TBL_7B5E[];
extern int W_7B57;
extern int W_7B91;
extern void far far_b0fe4(char far *, int);
extern long far far_b2739(long);
extern long far far_b2acb(long);
extern long far far_b2b84(char far *);
extern long far far_b32ec(int);
extern void far far_b342e(void);
extern long far far_e3c0f(unsigned char far *, void far *);
extern void far fn_b0e08(char far *);
extern void far fn_b0f1c(char far *);

long far far_b0caf(void)
{
    struct s1 far *loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int bx;
    unsigned int cx;
    int cx2;
    int dx;
    int es;
    int si;
    int si2;
    long t1;
    long t2;
    int t3;
    int t4;
    int t5;
    int t6;

    dx = FP_7B8F;
    loc_6 = W_7B91;
    *(int *)((char *)&loc_8 + 0) = dx;
    if (B_7B88 != 0) {
        return ((long)dx << 16 | (unsigned)0);
    }
    ax = loc_8->f_3 & 15;
    if (ax == 0) {
        TBL_7B5E[loc_8->f_4] = (char)0;
        fn_b0e08((char far *)TBL_7B5E);
        si2 = UNDEF;
        bx = FP_OFF(loc_8);
        es = FP_SEG(loc_8);
        if ((*(int far *)MK_FP(es, bx + 14) | *(int far *)MK_FP(es, bx + 16)) != 0) {
            si2 = (int)(*(long (far *)())*(long far *)MK_FP(es, bx + 14))(si2, 1);
        }
        if ((loc_8->f_d & 8) == 0) {
            far_b342e();
            if (UNDEF < 0) {
                si2 = -si2;
            }
        }
        dx = (int)(far_b32ec(si2) >> 16);
    } else if (ax == 1) {
        fn_b0f1c((char far *)TBL_7B5E);
        if (TBL_7B5E[0] == 0) {
            TBL_7B5E[0] = (char)95;
            B_7B5F = (char)0;
        }
        far_b0fe4((char far *)TBL_7B5E, loc_8->f_4);
        ax2 = W_7B57;
        si = FP_7B55;
        cx = ~__repne_scas1((char far *)TBL_7B5E, 0, -1);
        cx2 = cx >> 1;
        __movs2(((long)ax2 << 16 | (unsigned)si), MK_FP(SEG_DATA, si), cx2 * 2);
        __movs1(((long)ax2 << 16 | (unsigned)(si + cx2 * 2)), MK_FP(SEG_DATA, si + cx2 * 2), cx & 1);
        B_D4B4 = (char)1;
        dx = (int)(far_b2739(*(long *)((char *)&FP_7B55 + 0)) >> 16);
    } else if (ax == 5) {
        t1 = far_b2b84((char far *)TBL_7B5E);
        loc_2 = (int)(t1 >> 16);
        loc_4 = (int)t1;
        if (B_9446 == 0) {
            t2 = far_e3c0f((unsigned char far *)B_901B, MK_FP((int)(t1 >> 16), loc_4));
            loc_2 = (int)(t2 >> 16);
            loc_4 = (int)t2;
        }
        dx = (int)(far_b2acb(*(long *)((char *)&loc_4 + 0)) >> 16);
    }
    return ((long)dx << 16 | (unsigned)-0x8000);
}
void far far_b0fe4(char far *p0, int p1) { }
void far fn_b0e08(char far *p0) { }
void far fn_b0f1c(char far *p0) { }
