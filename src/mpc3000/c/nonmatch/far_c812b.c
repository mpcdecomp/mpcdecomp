/* differs: 308 at +D, 147 bytes; 311 at +D, 147 bytes; 312 at +D, 147 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_b6aab(char far *, long);
extern long far far_fa274(int);

long far far_c812b(int arg_0, int arg_2, long arg_4, int arg_8, int arg_10)
{
    char loc_1a[26];
    int di;
    int es;
    int es2;
    int si;
    int si2;

    *(int *)((char *)&loc_1a + 24) = 16;
    *(int *)((char *)&loc_1a + 22) = 20;
    si = 0;
    di = arg_0;
L1:
    es = arg_2;
    if (*(char far *)MK_FP(es, di) == 32) {
        goto L2;
    }
    if (*(char far *)MK_FP(es, di) == 0) {
        goto L2;
    }
    loc_1a[si] = (char)(int)far_fa274(*(char far *)MK_FP(arg_2, di));
    di = di + 1;
    si = si + 1;
    if (si < *(int *)((char *)&loc_1a + 24)) {
        goto L1;
    }
L2:
    loc_1a[si] = (char)0;
    es2 = (int)(arg_4 >> 16);
    __movs1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_1a + (-1 - __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), 0, -1)) - 1)), (char far *)MK_FP(es2, (unsigned int)(unsigned)loc_1a), ~__repne_scas1(MK_FP(es2, (int)arg_4), 0, -1));
    si2 = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), 0, -1) - 1;
    if (si2 >= *(int *)((char *)&loc_1a + 22)) {
        goto L3;
    }
L4:
    loc_1a[si2] = (char)32;
    si2 = si2 + 1;
    if (si2 < *(int *)((char *)&loc_1a + 22)) {
        goto L4;
    }
L3:
    loc_1a[*(int *)((char *)&loc_1a + 22)] = (char)0;
    return far_b6aab((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), *(long *)((char *)&arg_8 + 0));
}
