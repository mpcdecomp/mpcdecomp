/* differs: 308 at +0, 24 bytes; 311 at +0, 24 bytes; 312 at +0, 24 bytes */
extern int TBL_7144[];
extern char TBL_714A[];
extern long near tgt_d6725();

void near tgt_d671b(void)
{
    int ax;
    int si;

    TBL_714A[si] = (char)ax;
    TBL_7144[si] = (int)(unsigned)tgt_d6725;
    return;
}
long near tgt_d6725(void) { return 0; }
