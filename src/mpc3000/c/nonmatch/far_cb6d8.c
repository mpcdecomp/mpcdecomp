/* differs: 308 at +0, 77 bytes; 311 at +0, 77 bytes; 312 at +0, 77 bytes */
void far far_cb6d8(void)
{
    int bx;
    int cx;
    int flags;

    bx = 0xa00;
    cx = 32;
    do {
        outpw(96, bx);
        outpw(98, 3);
        outpw(100, 0);
        bx = ((char)(bx >> 8) << 8 | (unsigned char)((char)bx + 1));
        flags = (char)bx;
        cx = cx - 1;
    } while (cx != 0);
    outpw(104, 128);
    return;
}
