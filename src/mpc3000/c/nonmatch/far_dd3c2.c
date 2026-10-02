/* differs: 308 at +0, 108 bytes; 311 at +0, 109 bytes; 312 at +0, 109 bytes */
extern char B_880B;
extern char B_901B;
extern char B_A570;
extern char B_F77B;
extern int B_F77C;
extern int B_F77E;
extern char TBL_9D67[];
extern int TBL_9DE7[];
extern char TBL_9EE7[];
extern char TBL_9F67[];
extern char TBL_A4E7[];
extern char TBL_F779;

int far far_dd3c2(void)
{
    int ax;
    int ax2;
    int bx;
    int bx2;

    if (B_A570 == 0 && B_901B == 0) {
        bx = ((char)(bx2 >> 8) << 8 | (unsigned char)B_F77B);
        B_880B = (char)1;
        ax = B_F77C;
        if (TBL_A4E7[(unsigned char)(char)bx] == -1) {
            TBL_A4E7[(unsigned char)(char)bx] = (char)-3;
        }
        TBL_9F67[(unsigned char)(char)bx] = (char)ax;
        TBL_9EE7[(unsigned char)(char)bx] = (char)(ax >> 8);
        TBL_9D67[(unsigned char)(char)bx] = (char)(TBL_F779 & 7);
        ax2 = B_F77E;
        TBL_9DE7[(unsigned char)(char)bx] = ax2;
    }
    return ax2;
}
