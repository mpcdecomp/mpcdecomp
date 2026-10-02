/* differs: 308 at +1, 76 bytes; 311 at +1, 76 bytes; 312 at +1, 76 bytes */
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9B;
extern char B_A571;
extern int far far_dce14(long, int, int);
extern int far far_dd0fb(void);

int near fn_dba91(void)
{
    int ax;
    int bx;
    int cx;
    int dx;
    int es;
    int p10;
    int p12;
    int p14;
    int p16;
    int p4;
    int p6;
    int p8;
    char near *si;
    int t1;
    int t2;

    do {
        if (si[bx] != 0) {
            p6 = (B_8A9B << 8 | (unsigned char)-128);
            p4 = (64 << 8 | (unsigned char)(char)bx);
            p8 = bx;
            t1 = far_dd0fb();
            p10 = t1;
            p12 = 4;
            p14 = SEG_STACK;
            p16 = UNDEF;
            t2 = far_dce14(((long)p14 << 16 | (unsigned)p16), p12, p10);
            cx = UNDEF;
            es = UNDEF;
            dx = UNDEF;
            bx = p8;
            ax = ((char)(t2 >> 8) << 8 | (unsigned char)B_A571);
            si[bx] = (char)ax;
        }
        bx = bx - 1;
    } while (bx >= 0);
    B_A571 = (char)0;
    return ax;
}
