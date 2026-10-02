/* differs: 308 at +5, 488 bytes; 311 at +5, 488 bytes; 312 at +5, 488 bytes */
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
extern char B_956A;
extern char B_D5DD;
extern unsigned char TBL_9419[];
extern long far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b1d48(void far *, int);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern int far far_d7903(void);
extern int far far_d7b9c(int, int);
extern int far far_d8388(int, int, int, char far *);
extern long far fn_bd7ce(void far *);
long far fn_bd7ce(void far *p0) { return 0; }

void far fn_be1ab(struct s1 far *arg_0, int arg_2)
{
    char loc_6[6];
    int loc_8;
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
    unsigned int cx;
    int cx2;
    int cx3;
    int di;
    int ds;
    unsigned int dx;
    int dx2;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    int t8;
    long t9;

    B_D5DD = (char)110;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x4063));
    far_b1ad0(2, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x4082));
    t2 = far_b90dd();
    far_b1b05(MK_FP(SEG_DATA, 0x3def));
    *(int *)((char *)&loc_6 + 4) = (int)far_b08f7(1);
    if (*(int *)((char *)&loc_6 + 4) != 120) {
        return;
    }
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x40bf));
    ax6 = far_d8388(*(int *)((char *)&arg_0 + 0), arg_2, 4, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6));
    *(int *)((char *)&loc_6 + 2) = ax6;
    if (ax6 != 0) {
        t3 = far_b3b9f(ax6);
        return;
    }
    if (*(int *)((char *)&loc_6 + 0) < 3) {
        t4 = fn_bd7ce(MK_FP(SEG_DATA, 0x40cb));
        *(int *)((char *)&loc_6 + 4) = (int)t4;
        if ((int)t4 != 120) {
            return;
        }
L1:
        B_956A = (char)(B_956A + 1);
        *(int *)((char *)&loc_6 + 4) = 0;
        *(int *)((char *)&loc_6 + 2) = far_d7b9c(*(int *)((char *)&arg_0 + 0), arg_2);
        if (*(int *)((char *)&loc_6 + 2) < 0) {
            t5 = far_b3b9f(*(int *)((char *)&loc_6 + 2));
            ds = SEG_DATA;
        } else {
            if (arg_0->f_b != 0) {
                ax7 = 16;
            } else {
                ax7 = 8;
            }
            loc_8 = ax7;
            dx = loc_8;
            cx = ~__repne_scas1(arg_0, 0, -1);
            ax8 = arg_2;
            si = *(int *)((char *)&arg_0 + 0);
            dx2 = dx - cx;
            if (dx < cx) {
                cx = cx + dx2;
                dx2 = 0;
            }
            cx2 = cx >> 1;
            __movs2((unsigned char far *)TBL_9419, ((long)ax8 << 16 | (unsigned)si), cx2 * 2);
            di = (int)(unsigned)(TBL_9419 + cx2 * 2);
            cx3 = cx & 1;
            __movs1(MK_FP(SEG_DATA, di), ((long)ax8 << 16 | (unsigned)(si + cx2 * 2)), cx3);
            __stos1(MK_FP(SEG_DATA, di + cx3), 0, dx2);
            ds = SEG_DATA;
            *(char far *)MK_FP(ds, (unsigned)&TBL_9419 + loc_8) = (char)0;
            if (*(int *)((char *)&loc_6 + 2) > 0) {
                t6 = far_b6cd3(MK_FP(ds, 0x40df));
                t7 = far_b1d48(MK_FP(ds, 0x40f8), *(int *)((char *)&loc_6 + 2) - 1);
                t8 = far_b1ad0(7, 0);
                ax9 = far_b1b05(MK_FP(ds, 0x41d5));
                do {
                    t9 = far_b08f7(1);
                    *(int *)((char *)&loc_6 + 4) = (int)t9;
                } while ((int)t9 == 0);
                if (*(int *)((char *)&loc_6 + 4) == 120) {
                    *(int *)((char *)&loc_6 + 4) = 0;
                }
            }
        }
        far_d7903();
        *(char far *)MK_FP(ds, (unsigned)&B_956A) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_956A) - 1);
        return;
    }
    goto L1;
}
