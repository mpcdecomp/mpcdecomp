/* differs: 308 at +3, 51 bytes; 311 at +3, 50 bytes; 312 at +3, 51 bytes */
extern int W_71A2;
extern int W_71A4;
extern int W_71A6;

void far far_d9e7b(long arg_0, unsigned int arg_4)
{
    unsigned int bx;
    unsigned int bx2;
    unsigned int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    bx2 = bx + (es << 4);
    W_71A2 = bx2;
    W_71A4 = (es >> 12) + (bx2 < bx);
    W_71A6 = (arg_4 >> 1) - 1;
    return;
}
