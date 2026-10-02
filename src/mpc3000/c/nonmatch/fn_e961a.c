/* differs: 308 absent; 311 at +3, 79 bytes; 312 at +3, 79 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far fn_e961a(long arg_0)
{
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es, bx + 2) = 0;
    *(int far *)MK_FP(es, bx) = 0;
    *(int far *)MK_FP(es, bx + 6) = 0;
    *(int far *)MK_FP(es, bx + 4) = 0;
    *(int far *)MK_FP(es, bx + 10) = 0;
    *(char far *)MK_FP(es, bx + 12) = (char)4;
    *(int far *)MK_FP(es, bx + 8) = 0x180;
    *(char far *)MK_FP(es, bx + 13) = (char)4;
    *(char far *)MK_FP(es, bx + 14) = (char)-2;
    *(char far *)MK_FP(es, bx + 15) = (char)-2;
    *(int far *)MK_FP(es, bx + 18) = 0;
    *(int far *)MK_FP(es, bx + 16) = 0;
    *(char far *)MK_FP(es, bx + 20) = (char)0;
    return;
}
