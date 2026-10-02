/* differs: 308 at +5, 482 bytes; 311 at +5, 481 bytes; 312 at +5, 481 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[11];
    char f_b;
};
extern unsigned char TBL_b56eb[];
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1d48(void far *, int);
extern int far far_b1f96(int);
extern long far far_b6aab(long, struct s1 far *);
extern long far far_cca70(void);
extern long far far_e2ce3(void);

long far fn_b556b(int arg_0, int arg_2, struct s1 far *arg_4, int arg_6)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    int loc_c;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int cx;
    int di;
    int ds;
    int dx;
    int dx2;
    int es;
    long t1;
    long t10;
    long t11;
    int t12;
    int t13;
    int t14;
    int t15;
    int t16;
    int t2;
    int t3;
    long t4;
    long t5;
    int t6;
    int t7;
    int t8;
    int t9;

    far_b1ad0(2, 24);
    t1 = far_b6aab(*(long *)((char *)&arg_0 + 0), arg_4);
    if (arg_4->f_b != 0) {
        ax2 = 16;
    } else {
        ax2 = 8;
    }
    loc_2 = ax2;
    loc_6 = -1;
    loc_4 = 0;
    dx = 0x229c;
    loc_c = *(int *)((char *)&arg_4 + 0) + loc_2;
    ds = SEG_DATA;
    while ((*(int far *)MK_FP(ds, dx) | *(int far *)MK_FP(ds, dx + 2)) != 0) {
        di = (int)*(long far *)MK_FP(ds, dx);
        es = (int)(*(long far *)MK_FP(ds, dx) >> 16);
        t2 = __repne_scas1(MK_FP(es, di), 0, -1);
        cx = ~t2;
        ax3 = 0;
        t3 = __repe_cmps1((int)((long)arg_6 << 16 | (unsigned)loc_c), MK_FP(es, di + (-1 - t2) - cx), cx);
        ds = ds;
        if (!CC("==", UNDEF)) {
            ax3 = 0 - 0 - CC("<u", UNDEF) + 1;
        }
        if (ax3 == 0) {
            goto L1;
        }
        dx = dx + 4;
        loc_4 = loc_4 + 1;
    }
    goto L2;
L1:
    loc_6 = loc_4;
L2:
    bx = loc_6;
    if ((unsigned int)(bx - 2) <= 9) {
        switch ((unsigned int)(unsigned)(TBL_b56eb + (bx - 2 << 1))) {
        case 0:
        case 1:
        case 2:
            goto L3;
        case 3:
        case 4:
        case 5:
        case 6:
L4:
            t10 = far_cca70();
            t11 = ((long)((int)(t10 >> 16) << 1 | (unsigned int)(int)t10 >> 15 & 1) << 16 | (unsigned)((int)t10 << 1)) / 0x400L;
            loc_a = (int)t11;
            t12 = far_b1d48(MK_FP(ds, 0x24eb), (int)t11);
            if (loc_6 >= 2 && loc_6 != 5) {
                t13 = far_b1ad0(4, 0);
                t14 = far_b1f96(40);
                t15 = far_b1ad0(5, 0);
                ax5 = far_b1f96(40);
                dx2 = UNDEF;
            } else {
                t16 = far_b1ad0(4, 0);
                ax6 = far_b1b05(MK_FP(ds, 0x24fa));
                dx2 = UNDEF;
            }
            break;
        case 7:
        case 8:
        case 9:
            loc_6 = 9;
L3:
            t4 = far_e2ce3();
            t5 = (t4 - 0x190L) / 0x400L;
            loc_8 = (int)t5;
            t6 = far_b1d48(MK_FP(ds, 0x24dc), (int)t5);
            t7 = far_b1ad0(4, 0);
            t8 = far_b1f96(40);
            t9 = far_b1ad0(5, 0);
            ax4 = far_b1f96(40);
            dx2 = UNDEF;
            break;
        }
    } else {
        goto L4;
    }
    return ((long)dx2 << 16 | (unsigned)loc_6);
}
long far far_b6aab(long p0, struct s1 far *p1) { return 0; }
