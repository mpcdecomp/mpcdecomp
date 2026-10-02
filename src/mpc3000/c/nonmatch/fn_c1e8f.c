/* differs: 308 at +3, 61 bytes; 311 at +3, 62 bytes; 312 at +3, 62 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern char TBL_13EF[];
extern int TBL_1405[];

long far fn_c1e8f(char arg_0)
{
    int dx;
    int dx2;
    int si;

    dx = ((char)(dx2 >> 8) << 8 | (unsigned char)arg_0);
    si = 0;
    while (TBL_13EF[si] != 0) {
        if (TBL_13EF[si] == (char)dx) {
            goto L1;
        }
        si = si + 1;
    }
    return (long)MK_FP(SEG_DATA, TBL_1405[0]);
L1:
    return (long)MK_FP(SEG_DATA, TBL_1405[si]);
}
