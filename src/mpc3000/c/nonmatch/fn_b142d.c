/* differs: 308 at +0, 130 bytes; 311 at +0, 130 bytes; 312 at +0, 130 bytes */
void near fn_b142d(void)
{
    int ax;
    int ax2;
    int ax3;
    int flags;
    int p4;

    ax = ((char)ax2 << 8 | (unsigned char)(char)ax2);
    p4 = ax;
    do {
        ax3 = ((char)(ax >> 8) << 8 | (unsigned char)inp(226));
        ax = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 << 1 | CC("<u", flags)));
        flags = (char)ax;
    } while (CC("<u", flags));
    outp(226, (char)p4);
    outp(224, (char)(p4 >> 8));
    return;
}
