/* differs: 308 at +0, 82 bytes; 311 at +0, 82 bytes; 312 at +0, 82 bytes */
int near fn_f985a(void)
{
    int ax;
    int ax2;
    int p2;

    p2 = ax;
    do {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)inp(226));
        ax = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 & -128));
    } while ((char)ax != 0);
    outp(226, (char)(ax >> 8));
    outp(224, (char)p2);
    return p2;
}
