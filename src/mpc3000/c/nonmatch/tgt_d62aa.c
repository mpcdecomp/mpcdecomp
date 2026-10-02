/* differs: 308 at +0, 172 bytes; 311 at +0, 171 bytes; 312 at +0, 172 bytes */
extern char B_713F;
extern char B_7142;
extern char B_7FC7;
extern char B_9781;
extern char B_D4AA;
extern char B_D4AB;
extern char TBL_966E[];
extern int W_713C;
extern void near tgt_d612d();
void near tgt_d612d(void) { }

int near tgt_d62aa(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;

    if (B_D4AA != 0) {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)127);
    }
    if (B_D4AB == 0) {
        bx = ((char)(bx2 >> 8) << 8 | (unsigned char)B_713F);
    } else {
        if (B_7FC7 == 0) {
            ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_7142);
            ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 + 1));
            ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 << 3));
            ax = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 - 1));
        }
        bx = ((char)(bx2 >> 8) << 8 | (unsigned char)B_9781);
    }
    TBL_966E[(unsigned char)(char)bx] = (char)ax;
    W_713C = (int)(unsigned)tgt_d612d;
    return ax;
}
