/* differs: 308 at +5, 217 bytes; 311 at +5, 218 bytes; 312 at +5, 218 bytes */
struct s1 {
    char pad_0[1508];
    int f_5e4;
    int f_5e6;
};
extern char B_7FCA;
extern char B_7FCB;
extern char B_7FCC;
extern char B_7FCE;
extern char B_7FD1;
extern char B_826C;
extern char B_901B;
extern char TBL_0F77[];
extern int TBL_D62B;
extern int W_7FC8;
extern int W_881C;
extern int W_8A98;
extern int W_9051;
extern int W_9053;
extern int W_D60E;
extern int W_D62D;
extern int W_D62F;
extern int W_D631;
extern int W_D633;
extern int W_D651;
extern int W_D653;
extern int W_D655;
extern int W_D657;
extern long far far_ca806(void);
extern long far far_de7ae(int, int, int);
extern long far far_e5612(int, int);
extern long far far_eb7cc(int);
extern long far far_eb845(int);

void far far_ba2a4(void)
{
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    struct s1 near *ax3;
    int ax4;
    int ax5;
    int dx;
    int dx2;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    W_881C = TBL_0F77[B_826C];
    W_D60E = B_7FCE * 0x7d0;
    t1 = far_ca806();
    if (B_7FCC == 0) {
        goto L1;
    }
    ax = W_8A98;
    goto L2;
L1:
    ax = W_7FC8;
L2:
    W_D651 = ax;
    t2 = far_de7ae(W_D651, B_7FCA, B_7FCB);
    W_D655 = (int)t2;
    W_D657 = (int)t2;
    W_D653 = (int)t2;
    ax2 = ((char)((int)t2 >> 8) << 8 | (unsigned char)B_7FCB);
    loc_6 = (char)ax2;
    ax3 = (struct s1 near *)((char)ax2 << 2);
    dx = ax3->f_5e4;
    W_D633 = ax3->f_5e6;
    W_D631 = dx;
    t3 = (long)(int)loc_6 * 6L;
    TBL_D62B = *(int *)(0x5f4 + (int)t3);
    W_D62D = *(int *)(0x5f6 + (int)t3);
    W_D62F = *(int *)(0x5f8 + (int)t3);
    if (B_901B < 0) {
        goto L3;
    }
    ax4 = W_9053;
    dx2 = W_9051;
    loc_2 = ax4;
    loc_4 = dx2;
    W_9053 = 0;
    ax5 = (int)far_e5612(W_9051, ax4);
L3:
    t4 = far_eb7cc(B_7FD1);
    t5 = far_eb845(1);
    return;
}
