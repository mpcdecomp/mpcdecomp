/* differs: 308 at +3, 69 bytes; 311 at +3, 69 bytes; 312 at +3, 69 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_8A9C;

int far fn_dc887(long arg_0)
{
    int ax;
    int ax2;
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(char far *)MK_FP(es, bx) = (char)-16;
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_8A9C);
    *(char far *)MK_FP(es, bx + 1) = (char)ax;
    *(char far *)MK_FP(es, bx + 2) = (char)71;
    *(char far *)MK_FP(es, bx + 3) = (char)0;
    *(char far *)MK_FP(es, bx + 4) = (char)68;
    *(char far *)MK_FP(es, bx + 5) = (char)69;
    return ax;
}
