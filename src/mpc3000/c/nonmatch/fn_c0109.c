/* differs: 308 at +0, 219 bytes; 311 at +0, 219 bytes; 312 at +0, 217 bytes */
extern char B_8A9C;
extern char B_956A;
extern char B_EFA5;
extern char B_EFA6;
extern char B_EFA8;
extern char B_EFA9;
extern char B_EFAA;
extern char B_EFAB;
extern char B_EFAC;
extern char B_EFAD;
extern char B_EFAE;
extern char B_EFAF;
extern char TBL_9125[];
extern char TBL_9189[];
extern char TBL_91ED[];
extern char TBL_9251[];
extern int far far_e3b75(void);
extern long far fn_c0428(int, int);

int far fn_c0109(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    long t1;

    ax = ((char)(far_e3b75() >> 8) << 8 | (unsigned char)B_8A9C);
    TBL_9251[(char)ax] = B_EFA6;
    TBL_91ED[(char)ax] = B_EFA5;
    TBL_9125[B_8A9C] = (char)(int)fn_c0428(B_EFAC, B_EFAE);
    t1 = fn_c0428(B_EFAD, B_EFAF);
    TBL_9189[B_8A9C] = (char)(int)t1;
    ax2 = ((char)((int)t1 >> 8) << 8 | (unsigned char)B_EFAE);
    B_EFAA = (char)ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_EFAF);
    B_EFAB = (char)ax3;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)B_EFAC);
    B_EFA8 = (char)ax4;
    ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)B_EFAD);
    B_EFA9 = (char)ax5;
    B_956A = (char)(B_956A - 1);
    return ax5;
}
long far fn_c0428(int p0, int p1) { return 0; }
