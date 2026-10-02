/* differs: 308 at +5, 60 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern int far far_b1d48(void far *, int, int, int);
extern void far fn_eabea(long);
void far fn_eabea(long p0) { }

void far fn_eac16(long arg_0, int arg_2, int arg_4)
{
    int ax;
    int bx;
    int es;
    int t1;

    if (arg_4 == 0) {
        goto L1;
    }
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    far_b1d48(MK_FP(SEG_DATA, 0x6d5f), *(char far *)MK_FP(es, bx + 4), *(char far *)MK_FP(es, bx + 3), *(char far *)MK_FP(es, bx + 2));
    return;
L1:
    fn_eabea(arg_0);
    return;
}
