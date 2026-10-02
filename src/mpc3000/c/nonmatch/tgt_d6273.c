/* differs: 308 absent; 311 at +0, 50 bytes; 312 at +0, 50 bytes */
extern char B_977C;
extern char B_977D;
extern int B_977E;
extern int W_713C;
extern long far far_da7e0(int, int);
extern void near tgt_d612d();
void near tgt_d612d(void) { }

long near tgt_d6273(void)
{
    int ax;
    int p2;
    long t1;

    p2 = B_977E;
    B_977C = (char)ax;
    t1 = far_da7e0(ax, p2);
    B_977D = (char)(int)t1;
    W_713C = (int)(unsigned)tgt_d612d;
    return t1;
}
