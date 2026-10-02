/* differs: 308 at +6, 255 bytes; 311 at +6, 257 bytes; 312 at +6, 257 bytes */
extern char B_880A;
extern char B_8A9B;
extern unsigned char B_901B[];
extern char B_96EE;
extern char B_A574;
extern int W_880C;
extern int W_880E;
extern int W_8810;
extern int W_8812;
extern int W_8814;
extern long far far_dca3e(void);
extern int far far_de95a(void);
extern void far far_e39e4(unsigned char far *);
extern long far far_e3d12(unsigned char far *, long);
extern long far far_e4a1d(int);
extern long far fn_e4bc1(int, int);

int far fn_e4af3(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_10, int arg_12)
{
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int dx2;
    long t1;
    int t2;
    long t3;
    int t4;

    loc_4 = B_8A9B;
    loc_2 = B_96EE;
    loc_6 = B_A574;
    B_8A9B = (char)arg_0;
    B_96EE = (char)(int)far_e4a1d(arg_0);
    t1 = far_e3d12((unsigned char far *)B_901B, *(long *)((char *)&arg_2 + 0));
    for (;;) {
        ax = arg_6;
        dx2 = arg_8;
        arg_6 = arg_6 - 1;
        arg_8 = arg_8 - (arg_6 == 0);
        if ((ax | dx2) == 0 || (int)fn_e4bc1(arg_10, arg_12) != 0) {
            break;
        }
        if (W_8810 == 0 || W_8810 == W_880C) {
            W_8812 = W_8814;
            W_8814 = 0;
            B_880A = (char)1;
        }
        if (W_880E == 0) {
            B_A574 = (char)1;
            t2 = far_de95a();
        }
        if (B_880A == 2) {
            t3 = far_dca3e();
        }
        far_e39e4((unsigned char far *)B_901B);
    }
    B_A574 = (char)1;
    ax2 = ((char)(far_de95a() >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_4 + 0));
    B_8A9B = (char)ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_2 + 0));
    B_96EE = (char)ax3;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_6 + 0));
    B_A574 = (char)ax4;
    return ax4;
}
long far fn_e4bc1(int p0, int p1) { return 0; }
