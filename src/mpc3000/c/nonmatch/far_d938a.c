/* differs: 308 at +5, 283 bytes; 311 at +5, 283 bytes; 312 at +5, 283 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void far far_b1941(int);
extern long far far_fa0c8(int, int, int);
extern void far fn_d9451(int, int, int, int, int);

long far far_d938a(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8)
{
    int loc_2;
    long loc_4;
    int loc_6;
    unsigned long loc_8;
    int loc_a;
    int loc_c;
    unsigned int cx;
    unsigned int cx2;
    int dx;
    int flags;
    int flags2;
    unsigned int si;
    int t1;
    long t2;
    long t3;
    long t4;
    int t5;

    far_b1941(1);
    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    t2 = far_fa0c8(3, arg_6, arg_8);
    t3 = t2 / 2L;
    dx = (int)(t3 >> 16);
    loc_6 = dx;
    *(int *)((char *)&loc_8 + 0) = (int)t3;
    si = 0x3600;
    for (;;) {
        flags = loc_6;
        if (!CC(">", flags) && (CC("!=", flags) || *(int *)((char *)&loc_8 + 0) == 0)) {
            break;
        }
        flags2 = 0 - loc_6;
        if (!CC("<", flags2) && (CC(">", flags2) || si > (unsigned int)*(int *)((char *)&loc_8 + 0))) {
            si = *(int *)((char *)&loc_8 + 0);
        }
        t4 = loc_4 / 3L;
        cx = arg_2;
        cx2 = cx + ((int)t4 << 1);
        loc_a = arg_4 + ((int)(t4 >> 16) << 1 | (unsigned int)(int)t4 >> 15 & 1) + (cx2 < cx);
        loc_c = cx2;
        fn_d9451(arg_0, loc_c, loc_a, (int)(loc_4 % 3L), si);
        dx = UNDEF;
        if (UNDEF != 0) {
            goto L1;
        }
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + si;
        loc_2 = (int)(loc_4 + (unsigned long)(unsigned int)si >> 16);
        *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) - si;
        loc_6 = (int)(loc_8 - (unsigned long)(unsigned int)si >> 16);
    }
    return ((long)dx << 16 | (unsigned)0);
L1:
    return ((long)dx << 16 | (unsigned)UNDEF);
}
void far fn_d9451(int p0, int p1, int p2, int p3, int p4) { }
