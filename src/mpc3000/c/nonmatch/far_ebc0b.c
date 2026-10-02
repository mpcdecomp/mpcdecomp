/* differs: 308 at +5, 172 bytes; 311 at +5, 172 bytes; 312 at +5, 171 bytes */
extern char B_7FCD;
extern int W_D5E3;
extern int W_F764;
extern unsigned int W_F766;
extern unsigned int W_F768;
extern long far far_fa0c8(int, int, int);

long far far_ebc0b(void)
{
    int loc_2;
    unsigned int ax;
    unsigned int bx;
    unsigned int bx2;
    unsigned int dx;
    unsigned int dx2;
    int dx3;
    long t1;

    bx = W_D5E3 - W_F764;
    W_F764 = W_D5E3;
    if (bx > 222 || bx < 18) {
        W_F768 = 0;
        return ((long)dx3 << 16 | (unsigned)0);
    }
    bx2 = bx << 5;
    W_F768 = W_F768 + 1;
    if (W_F768 <= 1) {
        goto L1;
    }
    dx = W_F766 + (W_F766 >> 1);
    if (dx < bx2) {
        goto L2;
    }
    dx = W_F766 - (W_F766 >> 2);
    if (dx > bx2) {
L2:
        W_F768 = 0;
        return ((long)dx << 16 | (unsigned)0);
    }
L1:
    ax = B_7FCD - 1;
    loc_2 = ax;
    if (ax < W_F768) {
        W_F768 = ax;
    }
    W_F766 = bx2 / W_F768 + (W_F768 - 1) * W_F766 / W_F768;
    t1 = far_fa0c8(0x271, W_F766, 0);
    dx2 = (int)(t1 / 96L);
    if (dx2 > 0xa2c3) {
        dx2 = -0x5d3d;
    }
    if (dx2 < 0x1047) {
        dx2 = 0x1047;
    }
    return ((long)dx2 << 16 | (unsigned)dx2);
}
