/* differs: 308 at +3, 102 bytes; 311 at +3, 101 bytes; 312 at +3, 102 bytes */
extern char B_880A;
extern long far far_d9b6e(int, long, int);
extern int far far_de95a(void);

long far far_dea12(int arg_0, long arg_2, int arg_6)
{
    int ax;
    int dx;
    long t1;
    int t2;
    long t3;

    t1 = far_d9b6e(arg_0, arg_2, arg_6);
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    if (ax == 0 && arg_0 == 4) {
        t2 = far_de95a();
        B_880A = (char)2;
        t3 = far_d9b6e(1, arg_2, arg_6);
        ax = (int)t3;
        dx = (int)(t3 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
