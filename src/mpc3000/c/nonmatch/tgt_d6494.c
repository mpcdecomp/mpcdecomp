/* differs: 308 at +0, 20 bytes; 311 at +0, 20 bytes; 312 at +0, 20 bytes */
extern char B_713F;
extern int W_713C;
extern long near tgt_d649d();

void near tgt_d6494(void)
{
    int ax;

    B_713F = (char)ax;
    W_713C = (int)(unsigned)tgt_d649d;
    return;
}
long near tgt_d649d(void) { return 0; }
