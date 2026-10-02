/* differs: 308 at +5, 149 bytes; 311 at +5, 149 bytes; 312 at +5, 149 bytes */
#define SEG_DATA _DS
extern char TBL_8C83[];
extern unsigned char TBL_F779;
extern unsigned char TBL_F77A;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daabc(int);

int far fn_e63ef(int arg_0)
{
    int far *loc_4;
    int loc_2;
    int ax;
    int ax2;
    int flags;
    int t1;
    long t2;
    long t3;

    loc_2 = SEG_DATA;
    *(int *)((char *)&loc_4 + 0) = (int)(unsigned)&TBL_F77A;
    for (;;) {
        t2 = far_d97ca(3, (unsigned char far *)&TBL_F779, 0x640);
        ax = TBL_F779 & 248;
        flags = ax - 184;
        if (CC("==", flags)) {
            goto L1;
        }
        if (!CC(">", flags)) {
            if (ax != 136) {
                if (ax != 168) {
                    goto L2;
                }
                ax2 = arg_0;
                arg_0 = arg_0 + 1;
                t1 = far_daabc(ax2);
                *loc_4 = t1;
            }
            goto L1;
        }
        if (ax == 248) {
            break;
        }
L2:
        TBL_F77A = TBL_8C83[TBL_F77A];
L1:
        t3 = far_d9b6e(1, (unsigned char far *)&TBL_F779, (int)t2);
    }
    return arg_0;
}
