/* differs: 308 at +0, 76 bytes; 311 absent; 312 absent */
#define UNDEF 0
extern char B_713F;
extern char B_7142;
extern char B_D4B5;
extern int W_713C;
extern int far far_dab06(int);
extern int near tgt_d62aa();

long near tgt_d628c(void)
{
    int ax;
    int ax2;
    int t1;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char *)(0x53 + (unsigned char)(char)ax2));
    B_7142 = (char)ax;
    t1 = far_dab06((unsigned char)((char)ax + B_D4B5));
    B_713F = (char)t1;
    W_713C = (int)(unsigned)tgt_d62aa;
    return ((long)UNDEF << 16 | (unsigned)t1);
}
int near tgt_d62aa(void) { return 0; }
