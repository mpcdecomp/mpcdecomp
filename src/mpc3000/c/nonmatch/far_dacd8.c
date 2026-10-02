/* differs: 308 at +0, 129 bytes; 311 at +0, 129 bytes; 312 at +0, 129 bytes */
extern unsigned char B_7FE1;
extern char B_8807;
extern char B_8808;
extern unsigned int W_880C;
extern int W_880E;
extern int W_8810;

int far far_dacd8(void)
{
    unsigned int ax;
    unsigned int ax2;
    int ax3;
    int cx;
    int cx2;
    unsigned int cx3;
    int cx4;

    cx = ((char)(cx2 >> 8) << 8 | (unsigned char)B_8808);
    ax = (unsigned char)(char)cx - B_7FE1;
    while (ax >= (unsigned char)(char)cx) {
        ax = ax - (unsigned char)(char)cx;
    }
    W_8810 = ax;
    ax2 = ax + (unsigned char)(char)cx - (W_880C >> 1);
    cx3 = (unsigned char)(char)cx >> 1;
    while (ax2 >= cx3) {
        ax2 = ax2 - cx3;
    }
    W_880E = ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)0);
    cx4 = W_8810;
    if (cx4 == 0 || cx4 == W_880C) {
        ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 + 1));
    }
    B_8807 = (char)ax3;
    return ax3;
}
