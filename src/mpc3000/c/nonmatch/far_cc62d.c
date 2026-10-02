/* differs: 308 at +0, 32 bytes; 311 at +0, 33 bytes; 312 at +0, 33 bytes */
extern long far far_cde12(int);

long far far_cc62d(void)
{
    int si;
    long t1;

    si = 0;
    do {
        t1 = far_cde12(si);
        si = si + 1;
    } while (si < 32);
    return t1;
}
