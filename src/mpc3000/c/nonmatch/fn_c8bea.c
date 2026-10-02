/* differs: 308 at +0, 61 bytes; 311 at +0, 61 bytes; 312 at +0, 61 bytes */
extern unsigned char TBL_F779[];
extern int W_93F5;
extern long far far_dbe67(unsigned char far *, int, int);

long far fn_c8bea(void)
{
    int ax;
    int dx;
    long t1;

    if (W_93F5 != 0) {
        t1 = far_dbe67((unsigned char far *)TBL_F779, W_93F5, 0);
        ax = (int)t1;
        dx = (int)(t1 >> 16);
        W_93F5 = 0;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
