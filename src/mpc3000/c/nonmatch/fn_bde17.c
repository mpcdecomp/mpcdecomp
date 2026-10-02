/* differs: 308 match; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
struct s1 {
    char pad_0[17];
    int f_11;
};
extern int far far_b1ad0(int, int);
extern int far far_b1ae0(int);
extern int far far_b1b05(struct s1 far *);
extern long far far_b1d48(void far *, int);
extern long far far_b1f96(int);

long far fn_bde17(struct s1 far *arg_0, int arg_2)
{
    int ax;
    int ax2;
    int ax3;
    long t1;

    far_b1ad0(1, 11);
    far_b1ae0(45);
    far_b1b05(arg_0);
    t1 = far_b1f96(31);
    return far_b1d48(MK_FP(SEG_DATA, 0x3feb), arg_0->f_11);
}
