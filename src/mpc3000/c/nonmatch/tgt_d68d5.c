/* differs: 308 at +0, 27 bytes; 311 at +0, 27 bytes; 312 at +0, 27 bytes */
extern int TBL_7144[];
extern char TBL_714A[];
extern long near tgt_d68df();

void near tgt_d68d5(void)
{
    int ax;
    int si;

    TBL_714A[si] = (char)ax;
    TBL_7144[si] = (int)(unsigned)tgt_d68df;
    return;
}
long near tgt_d68df(void) { return 0; }
