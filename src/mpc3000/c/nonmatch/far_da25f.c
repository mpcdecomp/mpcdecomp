/* differs: 308 at +5, 627 bytes; 311 at +5, 624 bytes; 312 at +5, 625 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void far far_da23e(long, long, int);
extern void far far_da245(long, long, int);
extern long far far_da9b8(int, int, int, int);
extern long far far_daa59(int, int);

void far far_da25f(unsigned long arg_0, int arg_2, unsigned long arg_4, int arg_6, unsigned long arg_8, int arg_10)
{
    int loc_2;
    unsigned int loc_4;
    int ax;
    int ax2;
    int ax3;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    long t1;
    long t2;
    int t3;
    long t4;
    long t5;
    int t6;
    long t7;
    long t8;

    loc_2 = 0;
    loc_4 = -16;
    t1 = far_daa59(*(int *)((char *)&arg_0 + 0), arg_2);
    arg_2 = (int)(t1 >> 16);
    *(int *)((char *)&arg_0 + 0) = (int)t1;
    t2 = far_daa59(*(int *)((char *)&arg_4 + 0), arg_6);
    arg_6 = (int)(t2 >> 16);
    *(int *)((char *)&arg_4 + 0) = (int)t2;
    ax = arg_2;
    flags = ax - arg_6;
    if (!CC("<=u", flags)) {
        goto L1;
    }
    if (!CC("<u", flags) && (unsigned int)*(int *)((char *)&arg_0 + 0) >= (unsigned int)*(int *)((char *)&arg_4 + 0)) {
        for (;;) {
L1:
            flags2 = arg_10;
            if (CC(">", flags2)) {
                goto L2;
            }
            if (!CC("!=", flags2) && *(int *)((char *)&arg_8 + 0) != 0) {
L2:
                ax2 = arg_10;
                flags3 = ax2 - loc_2;
                if (!CC(">", flags3) && (CC("<", flags3) || (unsigned int)*(int *)((char *)&arg_8 + 0) < loc_4)) {
                    loc_2 = arg_10;
                    loc_4 = *(int *)((char *)&arg_8 + 0);
                }
                far_da23e(arg_0, arg_4, loc_4);
                t4 = far_da9b8(*(int *)((char *)&arg_0 + 0), arg_2, loc_4, loc_2);
                arg_2 = (int)(t4 >> 16);
                *(int *)((char *)&arg_0 + 0) = (int)t4;
                t5 = far_da9b8(*(int *)((char *)&arg_4 + 0), arg_6, loc_4, loc_2);
                arg_6 = (int)(t5 >> 16);
                *(int *)((char *)&arg_4 + 0) = (int)t5;
                dx = loc_4;
                *(int *)((char *)&arg_8 + 0) = *(int *)((char *)&arg_8 + 0) - dx;
                arg_10 = (int)(arg_8 - ((long)loc_2 << 16 | (unsigned)dx) >> 16);
                continue;
            }
            break;
        }
        goto L3;
    }
    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - 16;
    arg_2 = (int)(arg_0 - 0xffe0010L >> 16);
    *(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) - 16;
    arg_6 = (int)(arg_4 - 0xffe0010L >> 16);
    for (;;) {
        flags4 = arg_10;
        if (!CC("<=", flags4)) {
            goto L4;
        }
        if (!CC("==", flags4)) {
            break;
        }
        if (*(int *)((char *)&arg_8 + 0) != 0) {
L4:
            ax3 = arg_10;
            flags5 = ax3 - loc_2;
            if (!CC(">", flags5) && (CC("<", flags5) || (unsigned int)*(int *)((char *)&arg_8 + 0) < loc_4)) {
                loc_2 = arg_10;
                loc_4 = *(int *)((char *)&arg_8 + 0);
            }
            far_da245(arg_0, arg_4, loc_4);
            dx2 = loc_4;
            t7 = far_da9b8(*(int *)((char *)&arg_0 + 0), arg_2, -dx2, -loc_2 - (dx2 != 0));
            arg_2 = (int)(t7 - 0xffe0010L >> 16);
            *(int *)((char *)&arg_0 + 0) = (int)t7 - 16;
            dx3 = loc_4;
            t8 = far_da9b8(*(int *)((char *)&arg_4 + 0), arg_6, -dx3, -loc_2 - (dx3 != 0));
            arg_6 = (int)(t8 - 0xffe0010L >> 16);
            *(int *)((char *)&arg_4 + 0) = (int)t8 - 16;
            dx4 = loc_4;
            *(int *)((char *)&arg_8 + 0) = *(int *)((char *)&arg_8 + 0) - dx4;
            arg_10 = (int)(arg_8 - ((long)loc_2 << 16 | (unsigned)dx4) >> 16);
            continue;
        }
        goto L5;
    }
L3:
    return;
L5:
    return;
}
