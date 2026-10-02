/* differs: 308 at +5, 409 bytes; 311 at +5, 409 bytes; 312 at +5, 409 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[4];
    char f_4;
    char pad_5[4];
    int f_9;
    int f_b;
    char f_d;
};
extern char B_7B88;
extern char B_D4B4;
extern char far *FP_7B55;
extern int FP_7B8F;
extern unsigned char TBL_7B5E[];
extern int W_7B91;
extern int W_9563;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(unsigned char far *);
extern long far far_b3ab6(unsigned char far *);
extern long far far_d7805(int, unsigned char far *, int, int);

long far far_b32ec(int arg_0)
{
    int loc_2;
    struct s1 far *loc_4;
    int loc_6;
    int loc_8;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int es3;
    int es4;
    long t1;
    int t2;
    long t3;

    dx = FP_7B8F;
    loc_2 = W_7B91;
    *(int *)((char *)&loc_4 + 0) = dx;
    if ((loc_4->f_d & 1) != 0) {
        arg_0 = arg_0 - W_9563;
    }
    ax = loc_4->f_9;
    loc_6 = ax;
    if (ax > arg_0) {
        arg_0 = ax;
    }
    ax2 = loc_4->f_b;
    loc_8 = ax2;
    if (ax2 < arg_0) {
        arg_0 = ax2;
    }
    if ((loc_4->f_d & 1) != 0) {
        arg_0 = arg_0 + W_9563;
    }
    bx = FP_OFF(loc_4);
    es = FP_SEG(loc_4);
    if ((*(int far *)MK_FP(es, bx + 14) | *(int far *)MK_FP(es, bx + 16)) != 0) {
        t1 = (*(long (far *)())*(long far *)MK_FP(es, bx + 14))((unsigned long)(unsigned int)arg_0);
        dx = (int)(t1 >> 16);
        arg_0 = (int)t1;
    }
    dx2 = ((char)(dx >> 8) << 8 | (unsigned char)32);
    if ((loc_4->f_d & 2) != 0) {
        dx2 = ((char)(dx2 >> 8) << 8 | (unsigned char)48);
    }
    ax3 = (int)far_d7805(arg_0, (unsigned char far *)TBL_7B5E, loc_4->f_4, dx2);
    if ((loc_4->f_d & 4) != 0) {
        ax4 = (int)far_b3ab6((unsigned char far *)TBL_7B5E);
    }
    bx2 = FP_OFF(loc_4);
    es2 = FP_SEG(loc_4);
    far_b1ad0(*(char far *)MK_FP(es2, bx2 + 1), *(char far *)MK_FP(es2, bx2 + 2));
    t2 = far_b1b05((unsigned char far *)TBL_7B5E);
    bx3 = FP_OFF(loc_4);
    es3 = FP_SEG(loc_4);
    far_b1ad0(*(char far *)MK_FP(es3, bx3 + 1), *(char far *)MK_FP(es3, bx3 + 2));
    dx3 = UNDEF;
    bx4 = FP_OFF(loc_4);
    es4 = FP_SEG(loc_4);
    ax7 = *(int far *)MK_FP(es4, bx4 + 14) | *(int far *)MK_FP(es4, bx4 + 16);
    if (ax7 != 0) {
        t3 = (*(long (far *)())*(long far *)MK_FP(es4, bx4 + 14))(arg_0, 1);
        ax7 = (int)t3;
        dx3 = (int)(t3 >> 16);
        arg_0 = ax7;
    }
    if ((loc_4->f_d & 1) != 0) {
        ax7 = W_9563;
        arg_0 = arg_0 - ax7;
    }
    if ((loc_4->f_d & 8) != 0) {
        ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_0 + 0));
        *(char far *)((char far *)*(long *)((char *)&FP_7B55 + 0)) = (char)ax8;
    } else {
        ax8 = arg_0;
        *(int far *)((char far *)*(long *)((char *)&FP_7B55 + 0)) = ax8;
    }
    B_D4B4 = (char)1;
    B_7B88 = (char)1;
    return ((long)dx3 << 16 | (unsigned)ax8);
}
