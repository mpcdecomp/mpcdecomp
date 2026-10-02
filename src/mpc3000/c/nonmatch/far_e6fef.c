/* differs: 308 absent; 311 at +5, 176 bytes; 312 at +5, 176 bytes */
extern unsigned char B_901B[];
extern char B_9443;
extern char B_955B;
extern char B_955C;
extern char B_956A;
extern char B_A575;
extern char B_A5C1;
extern char B_A5C2;
extern int W_D5E7;
extern int W_D5E9;
extern int far far_dd6dd(void);
extern void far far_df9d3(int, int);
extern long far far_e37be(unsigned char far *);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_e6890(void);
extern void far far_e7c91(void);

long far far_e6fef(void)
{
    int loc_2;
    int ax;
    int ax2;
    int dx;
    int t1;
    int t2;
    int t3;
    long t4;
    long t5;
    long t6;

    if (B_A5C2 != 0) {
        t1 = far_dd6dd();
        do {
        } while (B_A5C1 != 0);
        B_956A = (char)(B_956A + 1);
        far_e7c91();
        far_df9d3(W_D5E7, W_D5E9);
        B_956A = (char)(B_956A - 1);
        t4 = far_e37be((unsigned char far *)B_901B);
        ax = (int)t4;
        dx = (int)(t4 >> 16);
        B_A575 = (char)1;
        if (B_9443 != 0) {
            ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_9443);
            loc_2 = (char)ax2;
            t5 = far_e51be((unsigned char far *)B_901B, (char)ax2, 1);
            t6 = far_e6890();
            ax = (int)t6;
            dx = (int)(t6 >> 16);
            B_955B = (char)64;
            B_955C = (char)-128;
            B_9443 = (char)0;
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
