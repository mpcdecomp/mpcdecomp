/* differs: 308 at +3, 59 bytes; 311 at +3, 59 bytes; 312 at +3, 59 bytes */
extern char B_901B;
extern long far far_d9b6e(int, long, int);
extern long far far_dad54(int);

long far far_e7d89(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int dx;
    long t1;
    long t2;

    if (B_901B == 0) {
        t1 = far_dad54(1);
        t2 = far_d9b6e(1, *(long *)((char *)&arg_0 + 0), arg_4);
        ax = (int)t2;
        dx = (int)(t2 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
