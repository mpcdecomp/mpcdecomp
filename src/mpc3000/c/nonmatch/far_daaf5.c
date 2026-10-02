/* differs: 308 at +4, 41 bytes; 311 at +4, 41 bytes; 312 at +4, 40 bytes */
int far far_daaf5(int arg_0)
{
    int ax;
    int ax2;

    ax = (unsigned int)(arg_0 ^ -0x8000) >> 1;
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)((unsigned int)(char)ax >> 1));
    return ((char)ax2 << 8 | (unsigned char)(char)ax2);
}
