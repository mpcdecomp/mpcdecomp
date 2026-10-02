/* differs: 308 at +3, 124 bytes; 311 at +3, 123 bytes; 312 at +3, 124 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far far_daa9d(long arg_0)
{
    int ax;
    int bx;
    int dx;
    int dx2;
    int dx3;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    ax = *(int far *)MK_FP(es, bx);
    dx = ((char)(dx2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 2));
    dx3 = ((char)(dx >> 8) << 8 | (unsigned char)((unsigned int)(char)dx >> 1));
    return ((long)(unsigned char)((unsigned int)(char)dx3 >> 1) << 16 | (unsigned)(((unsigned int)(((char)(ax >> 8) << 8 | (unsigned char)((char)ax << 1)) << 1) >> 1 | ((char)dx & 1) << 15) >> 1 | ((char)dx3 & 1) << 15));
}
