/* differs: 308 at +4, 22 bytes; 311 at +4, 22 bytes; 312 at +4, 22 bytes */
int far far_daae4(int arg_0)
{
    return ((char)arg_0 << 8 | (unsigned char)((char)arg_0 << 1)) << 1 ^ -0x8000;
}
