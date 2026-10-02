/* differs: 308 at +0, 55 bytes; 311 at +0, 55 bytes; 312 at +0, 55 bytes */
extern int far far_fb47a(void);

int near fn_d4fda(void)
{
    int cx;

    outp(164, (char)16);
    cx = 0x3e8;
    do {
        cx = cx - 1;
    } while (cx != 0);
    outp(164, (char)0);
    return ((char)(far_fb47a() >> 8) << 8 | (unsigned char)inp(170));
}
