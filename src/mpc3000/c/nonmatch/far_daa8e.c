/* differs: 308 at +8, 22 bytes; 311 at +8, 22 bytes; 312 at +8, 22 bytes */
int far far_daa8e(int far *arg_0)
{
    int ax;

    ax = *arg_0;
    return (unsigned int)((char)(ax >> 8) << 8 | (unsigned char)((char)ax << 1)) >> 1;
}
