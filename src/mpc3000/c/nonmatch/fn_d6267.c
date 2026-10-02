/* differs: 308 at +0, 39 bytes; 311 at +0, 40 bytes; 312 at +0, 40 bytes */
#define UNDEF 0
extern char B_7140;
extern int W_713C;
extern int far far_dac9a(void);
extern void near tgt_d612d();
void near tgt_d612d(void) { }

long near fn_d6267(void)
{
    int ax;
    int ax2;
    int ax3;
    int t1;

    B_7140 = (char)ax;
    far_dac9a();
    far_dac9a();
    t1 = far_dac9a();
    W_713C = (int)(unsigned)tgt_d612d;
    return ((long)UNDEF << 16 | (unsigned)t1);
}
