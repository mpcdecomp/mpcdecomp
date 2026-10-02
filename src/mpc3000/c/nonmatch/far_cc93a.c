/* differs: 308 at +18, 161 bytes; 311 at +18, 161 bytes; 312 at +18, 161 bytes */
extern char TBL_70EA[];
extern char TBL_70EE[];
extern char TBL_70FA[];
extern char TBL_70FE[];
extern char TBL_7102[];
extern int W_F290;
extern int far far_cb725(int);
extern int far far_cb737(int);
extern int far far_cb74d(void);
extern void far fn_cc843(int);
extern long far fn_cc8ae(int);
void far fn_cc843(int p0) { }
long far fn_cc8ae(int p0) { return 0; }

long far far_cc93a(void)
{
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int di;
    int dx;
    int si;
    int t1;
    int t2;
    int t3;
    int t4;

    far_cb725(0);
    di = TBL_7102[far_cb74d()];
    ax2 = far_cb737(0);
    loc_2 = 0;
    si = 3;
    while (si > 0) {
        t1 = far_cb725(TBL_70EA[si]);
        fn_cc843(TBL_70EE[si]);
        if ((int)fn_cc8ae(TBL_70EE[si]) == 0) {
            goto L1;
        }
        si = si - 1;
    }
    goto L2;
L1:
    loc_2 = TBL_70EE[si];
L2:
    ax3 = loc_2;
    if (ax3 == 1) {
        ax7 = far_cb737(TBL_70FA[di]);
    } else if (ax3 == 4) {
        ax6 = far_cb737(TBL_70FE[di]);
    } else if (ax3 == 16) {
        t4 = far_cb725(7);
        ax5 = far_cb737(0);
        di = 0;
    } else {
        t3 = far_cb725(0);
        ax4 = far_cb737(8);
        loc_2 = 0;
    }
    dx = loc_2 + TBL_70EE[di];
    W_F290 = dx;
    return ((long)dx << 16 | (unsigned)W_F290);
}
