/* differs: 308 at +0, 132 bytes; 311 at +0, 132 bytes; 312 at +0, 132 bytes */
struct g_TBL_E2E6 {
    int f_0;
};
struct g_TBL_E366 {
    int f_0;
};
struct g_TBL_E326 {
    int f_0;
};
extern struct g_TBL_E2E6 TBL_E2E6;
extern struct g_TBL_E326 TBL_E326;
extern struct g_TBL_E366 TBL_E366;
extern long far far_cde12(int);

long far far_cdd52(void)
{
    int ax;
    unsigned int bx;
    int bx2;
    int bx3;
    int cx;

    if (bx < 64) {
        cx = *(int *)((char *)&TBL_E2E6 + 0 + bx);
        outpw(96, (bx >> 1) + 0x400);
        outpw(98, cx);
        outpw(100, -0x8000);
        return 0x648000L;
    }
    if (bx < 128) {
        return far_cde12(bx - 64 >> 1);
    }
    bx2 = bx - 128 >> 1;
    outpw(96, bx2 + 0x600);
    bx3 = bx2 << 1;
    outpw(98, *(int *)((char *)&TBL_E366 + 0 + bx3));
    ax = *(int *)((char *)&TBL_E326 + 0 + bx3);
    outpw(100, ax);
    return ((long)100 << 16 | (unsigned)ax);
}
