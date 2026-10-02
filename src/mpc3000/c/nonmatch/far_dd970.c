/* differs: 308 at +0, 154 bytes; 311 at +0, 154 bytes; 312 at +0, 153 bytes */
extern char B_A575;
extern char B_A5C2;
extern char B_A5C3;
extern char B_D5EB;

void far far_dd970(void)
{
    int ax;
    int ax2;
    int ax3;
    int bx;
    int bx2;

    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)B_A5C2);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)bx & 63));
    if ((char)ax != 0) {
        goto L1;
    }
    ax3 = (unsigned char)(char)ax;
    goto L2;
L1:
    if ((char)ax != 1) {
        goto L3;
    }
    ax3 = (6 << 8 | (unsigned char)(char)ax);
    goto L4;
L3:
    if ((char)ax != 4) {
        goto L5;
    }
    ax3 = (8 << 8 | (unsigned char)(char)ax);
    goto L4;
L5:
    if ((char)ax != 16) {
        goto L6;
    }
    ax3 = (10 << 8 | (unsigned char)(char)ax);
L4:
    if (((char)bx & 64) == 0) {
        goto L2;
    }
    ax3 = (((char)(ax3 >> 8) | 64) << 8 | (unsigned char)(char)ax3);
L2:
    B_A5C3 = (char)(ax3 >> 8);
    B_D5EB = (char)0;
    if ((char)(ax3 >> 8) == 0) {
        goto L6;
    }
    B_A575 = (char)0;
L6:
    return;
}
