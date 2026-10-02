/* differs: 308 absent; 311 at +3, 216 bytes; 312 at +3, 217 bytes */
extern char B_901B;
extern int W_8814;
extern int W_9059;
extern long far far_dad54(int);
extern void far far_db240(int, int);
extern long far far_deee8(char far *);
extern void far far_e2a44(int, int, int);
extern long far far_e2ce3(int);
extern void far far_e5902(int);
extern long far far_e723d(char far *, int, int);

int far far_e3ad2(int arg_0, int arg_2, int arg_4, int arg_6)
{
    int ax;
    int di;
    int dx;
    int flags;
    int si2;
    long t1;
    long t2;
    long t3;
    int t4;
    long t5;
    int t6;
    int t7;

    if (B_901B != 0) {
        return 0;
    }
    ax = arg_0 << 3;
    dx = -(ax + 8 < 0);
    t1 = far_e2ce3(dx);
    flags = dx - (int)(t1 >> 16);
    if (!CC("<", flags) && (CC(">", flags) || (unsigned int)(ax + 8) > (unsigned int)(int)t1)) {
        return -3;
    }
    t2 = far_deee8((char far *)&B_901B);
    t3 = far_e723d((char far *)&B_901B, arg_4, arg_6);
    di = arg_2 + arg_0;
    si2 = arg_2;
    if (arg_2 < di) {
        do {
            far_db240(1, si2);
            W_8814 = W_9059;
            t5 = far_dad54(1);
            si2 = si2 + 1;
        } while (si2 < di);
    }
    far_e5902(di);
    far_e2a44(arg_2, di, 1);
    return 0;
}
