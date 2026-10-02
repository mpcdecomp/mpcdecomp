/* differs: 308 absent; 311 absent; 312 at +5, 309 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern char B_D5DD;
extern char B_D5DE;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_caade(long);
extern long far far_cab20(int);
extern long far far_cad00(int);
extern int far far_cad6d(char far *, int, int);
extern long far far_ebcce(char far *, int, int);
extern long far fn_bde5d(int, int);
extern long far fn_be1ab(long);

long far far_bda63(int arg_0, int arg_2)
{
    char loc_a;
    char loc_9[6];
    char loc_3;
    int loc_2;
    int ax;
    int ax2;
    int dx;
    long t1;
    long t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;
    int t8;
    long t9;

    B_D5DD = (char)101;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x4495));
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x44a3));
    t2 = far_b90dd();
    t3 = far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), 2, 0);
    if ((int)t3 != 0) {
        return ((long)(int)t3 << 16 | (unsigned)(int)t3);
    }
    if (loc_3 != 1) {
        dx = (int)fn_bde5d(arg_0, arg_2);
L1:
        return ((long)dx << 16 | (unsigned)dx);
    }
    t4 = far_b1ad0(7, 0);
    t5 = far_b1b05(MK_FP(SEG_DATA, 0x44cf));
    t6 = far_cad00(0);
    t7 = far_caade(*(long *)((char *)&arg_0 + 0));
    if ((int)t7 < 0) {
        return (long)MK_FP((int)(far_b3b9f((int)t7) >> 16), B_D5DE);
    }
    t8 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), (int)t7, 6);
    loc_2 = t8;
    if (t8 != 0) {
        return (long)MK_FP((int)(far_b3b9f(t8) >> 16), B_D5DE);
    }
    t9 = far_cab20((int)t7);
    if ((loc_a != 4 || loc_9[0] > 3) && (loc_a != 3 || loc_9[0] != 1)) {
        return (long)MK_FP((int)(far_b3b9f(-32) >> 16), B_D5DE);
    }
    dx = (int)fn_be1ab(*(long *)((char *)&arg_0 + 0));
    goto L1;
}
long far fn_bde5d(int p0, int p1) { return 0; }
long far fn_be1ab(long p0) { return 0; }
