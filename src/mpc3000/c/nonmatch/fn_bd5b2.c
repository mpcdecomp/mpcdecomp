/* differs: 308 at +15, 124 bytes; 311 at +15, 124 bytes; 312 at +15, 124 bytes */
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
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(char far *);
extern int far far_b1b41(int, int);
extern long far far_b3cdb(int, int, int);
extern long far far_b6beb(struct s1 far *, char far *);
extern long far far_ebda4(int);

int far fn_bd5b2(struct s1 far *arg_0, int arg_2, char arg_4)
{
    char loc_1a[26];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    long t1;
    long t2;

    far_b1af9();
    if (arg_0->f_b != 0) {
        ax2 = 16;
    } else {
        ax2 = 8;
    }
    *(int *)((char *)&loc_1a + 24) = ax2;
    *(char far *)MK_FP(arg_2, *(int *)((char *)&loc_1a + 24) + *(int *)((char *)&arg_0 + 0) + 2) = (char)(arg_4 + 48);
    t1 = far_b3cdb(102, 3, 37);
    far_b1ad0(3, 6);
    t2 = far_b6beb(arg_0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a));
    far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a));
    far_b1ad0(6, 0);
    far_b1b41(61, 40);
    *(int *)((char *)&loc_1a + 22) = (int)far_ebda4(1);
    far_b1aff();
    return *(int *)((char *)&loc_1a + 22);
}
