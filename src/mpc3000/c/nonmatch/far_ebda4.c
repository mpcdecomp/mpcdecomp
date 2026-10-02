/* differs: 308 at +3, 74 bytes; 311 at +3, 74 bytes; 312 at +3, 74 bytes */
#define UNDEF 0
extern int far far_b1ab2(int);
extern long far far_ba0a7(int);
extern int far far_d78b2(void);
extern long far far_ebde1(int, int);

long far far_ebda4(int arg_0)
{
    int ax;
    int ax2;
    int dx;
    int si;
    long t1;

    si = 0;
    far_b1ab2(0);
    ax2 = far_d78b2();
    dx = UNDEF;
    while (si == 0) {
        t1 = far_ebde1((int)far_ba0a7(0), arg_0);
        dx = (int)(t1 >> 16);
        si = (int)t1;
    }
    return ((long)dx << 16 | (unsigned)si);
}
long far far_ebde1(int p0, int p1) { return 0; }
