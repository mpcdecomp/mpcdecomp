/* differs: 308 at +0, 55 bytes; 311 at +0, 55 bytes; 312 at +0, 55 bytes */
#define UNDEF 0
extern unsigned char TBL_7148[];
extern int W_945A;
extern int far far_dac9a(void);

void near fn_d693e(void)
{
    int ax;
    int cx;
    int di;
    int p4;
    int si;

    di = (int)(unsigned)(TBL_7148 + si);
    do {
        p4 = cx;
        di = di + 2;
        ax = far_dac9a();
        if (!CC("ns", UNDEF)) {
            W_945A = W_945A + 1;
        }
        cx = p4 - 1;
    } while (cx != 0);
    return;
}
