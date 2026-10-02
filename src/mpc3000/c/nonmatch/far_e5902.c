/* differs: 308 at +5, 136 bytes; 311 at +5, 135 bytes; 312 at +5, 135 bytes */
#define SEG_DATA _DS
extern char B_901C;
extern char B_956A;
extern unsigned char TBL_F779;
extern unsigned char TBL_F77A[];
extern int W_902D;
extern int W_902F;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daabc(int);

void far far_e5902(int arg_0)
{
    int far *loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int dx;
    int t1;
    long t2;
    long t3;

    B_956A = (char)(B_956A + 1);
    B_901C = (char)(B_901C & -3);
    for (;;) {
        dx = W_902D;
        loc_2 = W_902F;
        loc_4 = dx;
        t2 = far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
        if (TBL_F779 == -1) {
            break;
        }
        if ((TBL_F779 & 248) == 168) {
            loc_6 = SEG_DATA;
            *(int *)((char *)&loc_8 + 0) = (int)(unsigned)TBL_F77A;
            ax = arg_0;
            arg_0 = arg_0 + 1;
            t1 = far_daabc(ax);
            *loc_8 = t1;
        }
        t3 = far_d9b6e(1, (unsigned char far *)&TBL_F779, (int)t2);
    }
    W_902F = loc_2;
    W_902D = loc_4;
    B_956A = (char)(B_956A - 1);
    return;
}
