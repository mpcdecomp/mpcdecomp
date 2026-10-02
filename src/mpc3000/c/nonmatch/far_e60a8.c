/* differs: 308 at +19, 64 bytes; 311 at +19, 64 bytes; 312 at +19, 64 bytes */
extern unsigned char B_8804;
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern long far far_e49dd(int);

int far far_e60a8(void)
{
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int di;
    int si;

    ax = B_8804 - 1;
    loc_2 = ax;
    di = 0;
    ax2 = ax * 0x1f4;
    si = ax2;
    while (TBL_A7B0[si] != 0) {
        ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)TBL_A7AF[si]);
        si = si + 2;
        di = di + 1;
        ax2 = (int)far_e49dd((unsigned char)(char)ax3);
        if (ax2 != 0) {
            continue;
        }
        goto L1;
    }
    return 0;
L1:
    return di;
}
