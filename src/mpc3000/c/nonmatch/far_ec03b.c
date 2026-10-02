/* differs: 308 at +5, 100 bytes; 311 at +5, 100 bytes; 312 at +5, 100 bytes */
#define UNDEF 0
extern int far far_b1ae0(int);
extern int far far_b1b05(long);
extern int far far_b1b41(int, int);

long far far_ec03b(long arg_0, int arg_2)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int cx;
    int di;

    cx = ~__repne_scas1((int)arg_0, 0, -1);
    di = 38 - (cx - 1) >> 1;
    far_b1b41(61, di);
    far_b1ae0(32);
    far_b1b05(arg_0);
    far_b1ae0(32);
    return ((long)UNDEF << 16 | (unsigned)far_b1b41(61, di + (cx - 1 & 1)));
}
