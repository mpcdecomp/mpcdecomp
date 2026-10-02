/* differs: 308 at +0, 63 bytes; 311 at +0, 63 bytes; 312 at +0, 63 bytes */
extern int W_D610;
extern int W_D64D;
extern int W_D64F;
extern int W_D655;
extern int W_D657;
extern long far far_dcc68(int);
extern long far far_eb13c(int);
long far far_dcc68(int p0) { return 0; }

long far far_dcca0(void)
{
    long t1;

    t1 = far_eb13c((int)far_dcc68(W_D610));
    W_D64D = (int)t1;
    W_D64F = (int)(t1 >> 16);
    W_D657 = (int)(t1 >> 16);
    W_D655 = (int)(t1 >> 16);
    return t1;
}
