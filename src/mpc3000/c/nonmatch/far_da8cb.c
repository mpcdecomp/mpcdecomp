/* differs: 308 at +4, 16 bytes; 311 at +4, 17 bytes; 312 at +4, 17 bytes */
extern int W_F2AE;
extern int W_F2B0;

long far far_da8cb(int arg_0, int arg_2)
{
    W_F2B0 = arg_2;
    W_F2AE = arg_0;
    return ((long)arg_0 << 16 | (unsigned)arg_2);
}
