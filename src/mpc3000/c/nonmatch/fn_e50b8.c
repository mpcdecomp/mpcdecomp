/* differs: 308 at +5, 162 bytes; 311 at +5, 160 bytes; 312 at +5, 162 bytes */
struct g_W_9031 {
    long f_0;
};
extern char B_901B;
extern char B_901C;
extern char B_956A;
extern unsigned char TBL_F779;
extern unsigned char TBL_F77A[];
extern int W_902D;
extern int W_902F;
extern struct g_W_9031 W_9031;
extern int W_9033;
extern long far far_d97ca(int, unsigned char far *, int);
extern int far far_daa8e(unsigned char far *);
extern long far far_e56a0(int, int, long, int, int);

void far fn_e50b8(void)
{
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int dx;
    int dx2;
    int p20;
    int p22;
    long t1;
    int t2;
    long t3;
    long t4;

    if (B_901B == 0) {
        *(char far *)((char far *)W_9031.f_0) = (char)-1;
        dx = W_902D;
        loc_2 = W_902F;
        loc_4 = dx;
        B_956A = (char)(B_956A + 1);
        while (W_902F != W_9033 || W_902D != *(int *)((char *)&W_9031 + 0)) {
            dx2 = W_902D;
            loc_6 = W_902F;
            loc_8 = dx2;
            t4 = far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
            ax = TBL_F779 & 248;
            if (ax == 168) {
                t2 = far_daa8e((unsigned char far *)TBL_F77A);
                p20 = t2;
                p22 = 0;
                t3 = far_e56a0(p22, p20, *(long *)((char *)&loc_8 + 0), 0, 0);
                continue;
            }
            if (ax != 248) {
                continue;
            }
            p20 = 0;
            p22 = 0;
            t1 = far_e56a0(p22, p20, *(long *)((char *)&loc_8 + 0), 0, 0);
        }
        W_902F = loc_2;
        W_902D = loc_4;
        B_901C = (char)(B_901C | 2);
        B_956A = (char)(B_956A - 1);
    }
    return;
}
