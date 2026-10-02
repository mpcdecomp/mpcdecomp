/* differs: 308 absent; 311 absent; 312 at +0, 20 bytes */
extern char TBL_714C[];
extern long near L_d6744(void);

long far tgt_d673c(void)
{
    int ax;
    int si;

    TBL_714C[si] = (char)ax;
    return L_d6744();
}
long near L_d6744(void) { return 0; }
