/* differs: 308 at +16, 48 bytes; 311 at +16, 48 bytes; 312 at +16, 48 bytes */
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern long far far_e259f(int);

int far fn_e6472(int arg_0, int arg_2)
{
    unsigned int loc_2;
    int si;

    si = arg_0 * 0x1f4;
    while (TBL_A7B0[si] != 0) {
        loc_2 = (unsigned char)TBL_A7AF[si];
        si = si + 2;
        if ((int)far_e259f((unsigned char)*(char *)((char *)&loc_2 + 0)) == -1) {
            goto L1;
        }
        if (arg_2 != loc_2) {
            continue;
        }
        goto L2;
    }
    return 0;
L2:
    return -16;
L1:
    return -17;
}
