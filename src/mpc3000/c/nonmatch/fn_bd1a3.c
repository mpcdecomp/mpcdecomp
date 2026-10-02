/* differs: 308 absent; 311 at +5, 29 bytes; 312 at +5, 29 bytes */
struct g_TBL_6AC0 {
    int f_0;
};
struct g_TBL_6AC2 {
    int f_0;
};
extern struct g_TBL_6AC0 TBL_6AC0;
extern struct g_TBL_6AC2 TBL_6AC2;

long far fn_bd1a3(int arg_0)
{
    int dx;
    int si;

    dx = 0;
    si = 0;
L1:
    if (*(int *)((char *)&TBL_6AC0 + 0 + si) > arg_0) {
        goto L2;
    }
    if (*(int *)((char *)&TBL_6AC2 + 0 + si) <= arg_0) {
        goto L2;
    }
    return ((long)dx << 16 | (unsigned)(dx - 120));
L2:
    si = si + 2;
    dx = dx + 1;
    if (si != 0x168) {
        goto L1;
    }
    return ((long)dx << 16 | (unsigned)0);
}
