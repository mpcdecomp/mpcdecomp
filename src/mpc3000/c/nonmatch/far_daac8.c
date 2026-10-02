/* differs: 308 at +3, 105 bytes; 311 at +3, 105 bytes; 312 at +3, 105 bytes */
long far far_daac8(unsigned int arg_0, int arg_2)
{
    int ax2;
    int ax3;
    int ax4;

    ax2 = arg_0 << 1;
    ax3 = ((char)(ax2 >> 8) << 1 << 8 | (unsigned char)(char)ax2);
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((unsigned int)(char)ax3 >> 1));
    return ((long)(unsigned char)((char)((arg_2 << 1 | arg_0 >> 15 & 1) << 1 | (unsigned int)(char)(ax2 >> 8) >> 7 & 1) & 127) << 16 | (unsigned)((unsigned int)(char)(ax4 >> 8) >> 1 << 8 | (unsigned char)(char)ax4));
}
