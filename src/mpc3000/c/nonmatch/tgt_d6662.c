/* differs: 308 at +0, 27 bytes; 311 at +0, 27 bytes; 312 at +0, 27 bytes */
extern int TBL_7144[];
extern char TBL_7148[];
extern int near tgt_d666c();

void near tgt_d6662(void)
{
    int ax;
    int si;

    TBL_7148[si] = (char)ax;
    TBL_7144[si] = (int)(unsigned)tgt_d666c;
    return;
}
int near tgt_d666c(void) { return 0; }
