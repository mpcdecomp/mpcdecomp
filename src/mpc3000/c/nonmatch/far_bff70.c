/* differs: 308 at +0, 120 bytes; 311 at +0, 122 bytes; 312 at +0, 122 bytes */
#define UNDEF 0
extern char B_7FCA;
extern char B_7FCB;
extern char B_A5C2;
extern char B_D60A;
extern int W_9045;
extern unsigned char W_D5F3[];
extern int W_D657;
extern int W_D659;
extern int far far_de88f(int, int, int);
extern long far far_e710e(int, int);
extern int far far_ea926(int);
extern long far far_eb86b(long, unsigned char far *);

long far far_bff70(void)
{
    int ax;
    int dx;
    long t1;
    long t2;

    if (B_D60A == 0) {
        goto L1;
    }
    ax = far_de88f(W_D657, B_7FCA, B_7FCB);
    dx = UNDEF;
    W_D659 = ax;
    goto L2;
L1:
    t1 = far_e710e(W_D659, B_7FCA);
    ax = (int)t1;
    dx = (int)(t1 >> 16);
L2:
    if (B_A5C2 != 0) {
        goto L3;
    }
    t2 = far_eb86b(*(long *)((char *)&W_9045 + 0), (unsigned char far *)W_D5F3);
    ax = far_ea926(0);
    dx = UNDEF;
L3:
    return ((long)dx << 16 | (unsigned)ax);
}
