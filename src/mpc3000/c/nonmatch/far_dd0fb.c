/* differs: 308 at +0, 185 bytes; 311 at +0, 188 bytes; 312 at +0, 188 bytes */
extern char TBL_8CE7[];
extern char TBL_8D4B[];
extern char TBL_8DAF[];
extern char TBL_90C1[];
extern char TBL_9125[];
extern char TBL_9189[];

int far far_dd0fb(void)
{
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;

    if (((char)ax & -128) != 0) {
        bx4 = ((char)(bx2 >> 8) << 8 | (unsigned char)(char)ax) & 127;
        ax2 = (TBL_8DAF[bx4] << 8 | (unsigned char)TBL_8D4B[bx4]);
        bx3 = ((char)(bx4 >> 8) << 8 | (unsigned char)TBL_8CE7[bx4]);
    } else {
        bx = ((char)(bx2 >> 8) << 8 | (unsigned char)(char)ax) & 127;
        ax2 = (TBL_9189[bx] << 8 | (unsigned char)TBL_9125[bx]);
        bx3 = ((char)(bx >> 8) << 8 | (unsigned char)TBL_90C1[bx]);
    }
    bx5 = ((char)(bx3 >> 8) << 8 | (unsigned char)((char)bx3 & 4));
    bx6 = ((char)(bx5 >> 8) << 8 | (unsigned char)((char)bx5 << 4));
    return ax2 & -0x4041 | ((char)bx6 << 8 | (unsigned char)(char)bx6);
}
