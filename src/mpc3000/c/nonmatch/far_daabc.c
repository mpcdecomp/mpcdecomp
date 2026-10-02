/* differs: 308 at +4, 25 bytes; 311 at +4, 25 bytes; 312 at +4, 25 bytes */
int far far_daabc(int arg_0)
{
    int ax;

    ax = arg_0 << 1;
    return ((char)(ax >> 8) << 8 | (unsigned char)((unsigned int)(char)ax >> 1));
}
