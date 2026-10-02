/* differs: 308 at +3, 67 bytes; 311 at +3, 67 bytes; 312 at +3, 67 bytes */
extern long far fn_da877(int);
long far fn_da877(int p0) { return 0; }

long far far_da8a5(int arg_0, int arg_2)
{
    int dx2;
    long t1;

    if (arg_2 != 0) {
        return fn_da877(arg_0 << 1);
    }
    t1 = (long)(int)arg_0 * (long)(int)arg_0;
    dx2 = -((int)t1 + 1 < 0);
    return ((long)dx2 << 16 | (unsigned)((int)t1 + 1 - dx2 >> 1));
}
