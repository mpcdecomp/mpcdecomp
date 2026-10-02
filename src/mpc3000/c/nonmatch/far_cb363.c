/* differs: 308 absent; 311 at +3, 133 bytes; 312 at +3, 133 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far far_cb363(long arg_0)
{
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(char far *)MK_FP(es, bx) = (char)-1;
    *(char far *)MK_FP(es, bx + 1) = (char)0;
    *(char far *)MK_FP(es, bx + 2) = (char)44;
    *(char far *)MK_FP(es, bx + 3) = (char)34;
    *(char far *)MK_FP(es, bx + 4) = (char)88;
    *(char far *)MK_FP(es, bx + 5) = (char)34;
    *(char far *)MK_FP(es, bx + 6) = (char)0;
    *(char far *)MK_FP(es, bx + 7) = (char)34;
    *(char far *)MK_FP(es, bx + 8) = (char)34;
    *(int far *)MK_FP(es, bx + 9) = 0;
    *(char far *)MK_FP(es, bx + 11) = (char)0;
    *(char far *)MK_FP(es, bx + 12) = (char)6;
    *(char far *)MK_FP(es, bx + 13) = (char)0;
    *(char far *)MK_FP(es, bx + 14) = (char)100;
    *(char far *)MK_FP(es, bx + 15) = (char)0;
    *(char far *)MK_FP(es, bx + 16) = (char)0;
    *(char far *)MK_FP(es, bx + 17) = (char)0;
    *(char far *)MK_FP(es, bx + 18) = (char)0;
    *(char far *)MK_FP(es, bx + 19) = (char)100;
    *(char far *)MK_FP(es, bx + 20) = (char)0;
    *(char far *)MK_FP(es, bx + 21) = (char)0;
    *(char far *)MK_FP(es, bx + 22) = (char)0;
    *(char far *)MK_FP(es, bx + 23) = (char)0;
    return;
}
