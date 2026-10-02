/* differs: 308 at +3, 58 bytes; 311 at +3, 58 bytes; 312 at +3, 58 bytes */
long far fn_da877(unsigned int arg_0)
{
    unsigned int bx;
    unsigned int cx;
    int dx;
    int dx2;

    if (arg_0 <= 1) {
        return ((long)dx << 16 | (unsigned)arg_0);
    }
    bx = arg_0 >> 1;
    cx = 0;
    do {
        dx2 = arg_0 % bx;
        bx = arg_0 / bx + bx >> 1;
        cx = cx + 1;
    } while (cx < 9);
    return ((long)dx2 << 16 | (unsigned)bx);
}
