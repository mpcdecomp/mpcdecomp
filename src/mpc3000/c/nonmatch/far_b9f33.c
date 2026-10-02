/* differs: 308 at +3, 124 bytes; 311 absent; 312 absent */
#define UNDEF 0
struct s1 {
    char pad_0[1];
    char f_1;
};
extern int far far_b1ae0(void);
extern int far far_b1b05(int);
extern int far far_b1f96(void);
extern void far far_b3843(int);
extern long far far_b9755(int, int);
long far far_b9755(int p0, int p1) { return 0; }

long far far_b9f33(struct s1 far *arg_0, int arg_2, int arg_4)
{
    int ax;
    int ax2;
    int t1;
    int t2;
    int t3;

    t1 = far_b1b05(0x37cb);
    if (arg_4 != 0) {
        __stos2(arg_0, 0x101, 64);
        return far_b9755(*(int *)((char *)&arg_0 + 0), arg_2);
    }
    __stos2(arg_0, 0, 64);
    far_b3843(*(int *)((char *)&arg_0 + 0));
    far_b1ae0();
    arg_0->f_1 = (char)127;
    far_b3843(*(int *)((char *)&arg_0 + 0) + 1);
    far_b1f96();
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(0x37d2));
}
