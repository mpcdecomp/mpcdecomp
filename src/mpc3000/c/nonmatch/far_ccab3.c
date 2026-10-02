/* differs: 308 at +7, 72 bytes; 311 at +7, 72 bytes; 312 at +7, 72 bytes */
struct g_TBL_D661 {
    int f_0;
};
struct g_TBL_D663 {
    int f_0;
};
extern char TBL_D65B[];
extern struct g_TBL_D661 TBL_D661;
extern struct g_TBL_D663 TBL_D663;

long far far_ccab3(void)
{
    long loc_4;
    int loc_2;
    int ax;
    int cx;
    unsigned int dx;
    unsigned int dx2;
    int si;

    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    cx = 0;
    si = 0;
    do {
        if (TBL_D65B[si] == 1) {
            dx2 = *(int *)((char *)&loc_4 + 0);
            dx = dx2 + *(int *)((char *)&TBL_D661 + 0 + si);
            ax = loc_2 + *(int *)((char *)&TBL_D663 + 0 + si) + (dx < dx2);
            loc_2 = ax;
            *(int *)((char *)&loc_4 + 0) = dx;
        }
        si = si + 10;
        cx = cx + 1;
    } while (si != 0xbb8);
    return loc_4;
}
