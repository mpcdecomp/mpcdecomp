/* differs: 308 at +0, 39 bytes; 311 at +0, 39 bytes; 312 at +0, 39 bytes */
extern int W_E3AA;
extern long far fn_b51c5(int);
long far fn_b51c5(int p0) { return 0; }

long far fn_b5241(void)
{
    int si;
    long t1;

    W_E3AA = 0;
    si = 0;
    do {
        t1 = fn_b51c5(si);
        si = si + 8;
    } while (si < 32);
    return t1;
}
