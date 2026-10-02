/* differs: 308 absent; 311 at +3, 227 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
struct s1 {
    char f_0;
    char f_1;
    char pad_2[4];
    char f_6;
};
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far fn_b984c(int, struct s1 far *);
int far fn_b984c(int p0, struct s1 far *p1) { return 0; }

long far fn_b9967(int arg_0, struct s1 far *arg_2, int arg_4)
{
    int ax;
    int ax2;
    int dx;
    long t1;
    int t10;
    int t11;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    int t9;

    fn_b984c(arg_0, arg_2);
    t1 = far_b1073(1);
    t2 = far_b1073(5);
    t3 = far_b1073(8);
    t4 = far_b1073(9);
    t5 = far_b1073(12);
    t6 = far_b1073(13);
    t7 = far_b1073(14);
    t8 = far_b1073(15);
    ax2 = (int)t8;
    dx = (int)(t8 >> 16);
    if (arg_2->f_6 == 0) {
        t9 = far_b1ad0(4, 37);
        ax2 = far_b1b05(MK_FP(SEG_DATA, 0x38ba));
        dx = UNDEF;
    }
    if (arg_2->f_0 == 0) {
        t10 = far_b1ad0(5, 26);
        ax2 = far_b1b05(MK_FP(SEG_DATA, 0x38ba));
        dx = UNDEF;
    }
    if (arg_2->f_1 == 0) {
        t11 = far_b1ad0(5, 35);
        ax2 = far_b1b05(MK_FP(SEG_DATA, 0x38ba));
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)ax2);
}
