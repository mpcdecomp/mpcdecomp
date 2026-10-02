/* differs: 308 at +5, 174 bytes; 311 at +5, 173 bytes; 312 at +5, 174 bytes */
extern char B_8A9F;
extern unsigned char B_901B[];
extern unsigned char TBL_A7B0[];
extern int W_8C31;
extern int W_8C33;
extern int W_8C39;
extern long far far_daa07(int, int, int);
extern long far far_e51be(unsigned char far *, int);

void far fn_c803e(void)
{
    long loc_4;
    int loc_2;
    int cx;
    int di;
    int dx;
    int dx2;
    char near *si;
    long t1;
    long t2;
    long t3;

    t1 = far_e51be((unsigned char far *)B_901B, B_8A9F);
    t2 = far_daa07(W_8C31, W_8C33, W_8C39);
    loc_2 = (int)(t2 + 8L >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t2 + 8;
    cx = 0;
    di = (int)(unsigned)TBL_A7B0;
L1:
    dx = 0;
    si = (char near *)di;
L2:
    if (*si == 0) {
        goto L3;
    }
    if (dx != 0) {
        goto L4;
    }
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 4;
    loc_2 = (int)(loc_4 + 4L >> 16);
L4:
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 2;
    loc_2 = (int)(loc_4 + 2L >> 16);
    si = si + 2;
    dx = dx + 1;
    if (dx < 250) {
        goto L2;
    }
L3:
    di = di + 0x1f4;
    cx = cx + 1;
    if (cx < 20) {
        goto L1;
    }
    dx2 = *(int *)((char *)&loc_4 + 0);
    t3 = (((long)loc_2 << 16 | (unsigned)dx2) + 0x3ffL) / 0x400L;
    return;
}
