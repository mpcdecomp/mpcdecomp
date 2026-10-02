/* differs: 308 at +3, 155 bytes; 311 at +3, 154 bytes; 312 at +3, 155 bytes */
extern char B_8A9F;
extern unsigned char B_901B[];
extern int W_8C35;
extern int far far_e0031(unsigned char far *);
extern long far far_e259f(char);
extern long far far_e26cc(long);
extern long far far_e26fb(long);

long far far_e6cb9(int arg_0)
{
    int ax;
    unsigned int ax2;
    int t1;
    long t2;
    long t3;
    long t4;

    if ((int)far_e259f(*(char *)((char *)&arg_0 + 0)) != 0) {
        return 0L;
    }
    if (B_8A9F == arg_0) {
        t1 = far_e0031((unsigned char far *)B_901B);
        t2 = far_e259f(*(char *)((char *)&arg_0 + 0));
    }
    t3 = far_e26fb(*(long *)((char *)&W_8C35 + 0));
    t4 = far_e26cc(*(long *)((char *)&W_8C35 + 0));
    ax2 = (int)t3 + (int)t4;
    return ((long)((int)(t3 >> 16) + -((int)t4 < 0) + (ax2 < (unsigned int)(int)t3)) << 16 | (unsigned)ax2);
}
