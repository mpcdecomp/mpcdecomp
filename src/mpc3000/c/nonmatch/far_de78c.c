/* differs: 308 at +0, 62 bytes; 311 at +0, 62 bytes; 312 at +0, 62 bytes */
extern char B_7FD1;
extern char B_7FD3;
extern char B_D60A;
extern long far far_dcca0(void);

long far far_de78c(void)
{
    int ax;
    int dx;
    long t1;

    if (B_D60A == 0 || B_7FD3 == 0 || (B_7FD1 == 2 || B_7FD1 == 1)) {
        t1 = far_dcca0();
        ax = (int)t1;
        dx = (int)(t1 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
