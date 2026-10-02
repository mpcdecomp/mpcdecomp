/* differs: 308 at +3, 48 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern int far far_b1d48(void far *, int, int, int, int);

void far fn_eabea(long arg_0)
{
    int ax;
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    far_b1d48(MK_FP(SEG_DATA, 0x6d4b), *(char far *)MK_FP(es, bx + 4), *(char far *)MK_FP(es, bx + 3), *(char far *)MK_FP(es, bx + 2), *(char far *)MK_FP(es, bx + 1));
    return;
}
