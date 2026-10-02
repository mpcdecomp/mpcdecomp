/* differs: 308 at +3, 55 bytes; 311 at +3, 55 bytes; 312 at +3, 55 bytes */
extern unsigned char B_901B[];
extern long far far_e15e2(int);
extern long far far_e51be(unsigned char far *, int, int);

long far far_e49b0(int arg_0)
{
    int dx;
    long t1;

    t1 = far_e51be((unsigned char far *)B_901B, arg_0, 0);
    dx = (int)t1;
    if ((int)t1 == -1) {
        dx = (int)far_e15e2(arg_0);
    }
    return ((long)dx << 16 | (unsigned)dx);
}
