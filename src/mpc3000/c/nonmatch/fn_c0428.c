/* differs: 308 at +3, 32 bytes; 311 at +3, 32 bytes; 312 at +3, 32 bytes */
long far fn_c0428(int arg_0, int arg_2)
{
    int ax;
    int dx;

    if (arg_2 == 0) {
        goto L1;
    }
    ax = arg_0 << 4;
    return ((long)ax << 16 | (unsigned)(arg_2 + ax - 1));
L1:
    return ((long)dx << 16 | (unsigned)-1);
}
