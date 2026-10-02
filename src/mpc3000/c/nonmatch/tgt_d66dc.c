/* differs: 308 at +0, 37 bytes; 311 at +0, 37 bytes; 312 at +0, 37 bytes */
extern int TBL_7144[];
extern char TBL_7148[];
extern char TBL_714A[];
extern long near tgt_d66eb();

void near tgt_d66dc(void)
{
    int ax;
    int si;

    TBL_7148[si] = (char)(TBL_7148[si] | -112);
    TBL_714A[si] = (char)ax;
    TBL_7144[si] = (int)(unsigned)tgt_d66eb;
    return;
}
long near tgt_d66eb(void) { return 0; }
