/* differs: 308 at +0, 136 bytes; 311 at +0, 136 bytes; 312 at +0, 136 bytes */
extern char TBL_D5EF[];

int near fn_d6963(void)
{
    int ax;
    int ax2;
    int bx;
    int bx2;

    ax = ((char)ax2 << 8 | (unsigned char)(char)ax2);
    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)((unsigned int)(char)ax >> 5));
    if (((char)ax & 16) != 0) {
        goto L1;
    }
    ax = (((char)(ax >> 8) & 15) << 8 | (unsigned char)(char)ax);
    TBL_D5EF[(unsigned char)(char)bx] = (char)(ax >> 8);
    goto L2;
L1:
    if ((unsigned char)(char)bx == 3) {
        goto L2;
    }
    ax = ((char)(ax >> 8) << 4 << 8 | (unsigned char)(char)ax);
    TBL_D5EF[(unsigned char)(char)bx] = (char)(TBL_D5EF[(unsigned char)(char)bx] | (char)(ax >> 8));
L2:
    return ax;
}
