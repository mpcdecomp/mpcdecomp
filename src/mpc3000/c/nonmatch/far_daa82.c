/* differs: 308 at +4, 18 bytes; 311 at +4, 18 bytes; 312 at +4, 18 bytes */
int far far_daa82(int arg_0)
{
    return (unsigned int)((char)(arg_0 >> 8) << 8 | (unsigned char)((char)arg_0 << 1)) >> 1;
}
