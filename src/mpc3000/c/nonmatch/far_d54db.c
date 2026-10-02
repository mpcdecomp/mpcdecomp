/* differs: 308 absent; 311 at +5, 50 bytes; 312 at +5, 50 bytes */
extern long far far_d549d(int);
extern long far far_d5db8(int);
long far far_d549d(int p0) { return 0; }

long far far_d54db(int arg_0)
{
    int loc_2;
    int ax;
    int dx;
    long t1;
    long t2;

    t1 = far_d549d(arg_0);
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    loc_2 = ax;
    if (loc_2 != 0) {
        t2 = far_d5db8(arg_0);
        ax = (int)t2;
        dx = (int)(t2 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
