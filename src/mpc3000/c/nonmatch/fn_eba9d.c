/* differs: 308 at +5, 332 bytes; 311 at +5, 332 bytes; 312 at +5, 332 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1fc8(long, char far *);
extern long far far_b2436(char far *, char far *, char far *);
extern void far far_dcc68(int);
extern long far far_eb13c(int);

void far fn_eba9d(unsigned long arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_10, int arg_12, int arg_14, long arg_16, int arg_18)
{
    char loc_4[4];
    char loc_8[4];
    char loc_18[16];
    int ax;
    int ax2;
    int bx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int es;
    int es2;
    int flags;
    int flags2;
    int si;
    int t1;
    long t2;
    long t3;
    int t4;

    *(int *)((char *)&loc_18 + 10) = arg_12;
    *(int *)((char *)&loc_18 + 8) = arg_10;
    bx = (int)arg_16;
    es = (int)(arg_16 >> 16);
    *(int far *)MK_FP(es, bx + 6) = 0;
    *(int far *)MK_FP(es, bx + 4) = 0;
    *(int far *)MK_FP(es, bx + 2) = 0;
    *(int far *)MK_FP(es, bx) = 0;
    if ((*(int *)((char *)&arg_0 + 0) | arg_2) == 0) {
        return;
    }
    si = arg_4 + arg_8 * 6;
    for (;;) {
        flags = arg_2;
        if (!CC("<=u", flags)) {
            goto L1;
        }
        if (!CC("!=", flags) && *(int *)((char *)&arg_0 + 0) != 0) {
L1:
            far_dcc68(arg_14);
            t2 = far_eb13c(UNDEF);
            *(int *)((char *)&loc_8 + 2) = (int)(t2 >> 16);
            *(int *)((char *)&loc_8 + 0) = (int)t2;
            dx2 = *(int *)((char *)&loc_18 + 8);
            *(int *)((char *)&loc_18 + 14) = *(int *)((char *)&loc_18 + 10);
            *(int *)((char *)&loc_18 + 12) = dx2;
            es2 = arg_6;
            dx3 = *(int far *)MK_FP(es2, si);
            *(int *)((char *)&loc_18 + 10) = *(int far *)MK_FP(es2, si + 2);
            *(int *)((char *)&loc_18 + 8) = dx3;
            arg_14 = *(int far *)MK_FP(es2, si + 4);
            dx4 = dx3 - *(int *)((char *)&loc_18 + 12);
            *(int *)((char *)&loc_4 + 2) = (int)(((long)*(int *)((char *)&loc_18 + 10) << 16 | (unsigned)dx3) - *(long *)((char *)&loc_18 + 12) >> 16);
            *(int *)((char *)&loc_4 + 0) = dx4;
            ax = arg_2;
            flags2 = ax - *(int *)((char *)&loc_4 + 2);
            if (!CC(">u", flags2) && (CC("<u", flags2) || (unsigned int)*(int *)((char *)&arg_0 + 0) < (unsigned int)*(int *)((char *)&loc_4 + 0))) {
                dx5 = *(int *)((char *)&arg_0 + 0);
                *(int *)((char *)&loc_4 + 2) = arg_2;
                *(int *)((char *)&loc_4 + 0) = dx5;
            }
            t3 = far_b2436((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
            t4 = far_b1fc8(arg_16, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
            ax2 = *(int *)((char *)&loc_4 + 2);
            dx6 = *(int *)((char *)&loc_4 + 0);
            *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - dx6;
            arg_2 = (int)(arg_0 - ((long)ax2 << 16 | (unsigned)dx6) >> 16);
            si = si + 6;
            arg_8 = arg_8 + 1;
            continue;
        }
        break;
    }
    return;
}
