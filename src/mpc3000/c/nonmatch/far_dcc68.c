/* differs: 308 at +3, 22 bytes; 311 at +3, 22 bytes; 312 at +3, 22 bytes */
extern unsigned int W_D651;

void far far_dcc68(unsigned int arg_0)
{
    unsigned int ax;
    unsigned int ax2;
    unsigned int ax3;
    unsigned int dx;
    long t1;

    t1 = (unsigned long)(unsigned int)arg_0 * (unsigned long)(unsigned int)W_D651;
    ax = (int)t1 << 1;
    ax2 = ax << 1;
    ax3 = ax2 << 1;
    dx = (((((int)(t1 >> 16) << 1 | (unsigned int)(int)t1 >> 15 & 1) << 1 | ax >> 15 & 1) << 1 | ax2 >> 15 & 1) << 1 | ax3 >> 15 & 1) + (ax3 << 1 >> 15 & 1);
    return;
}
