/* differs: 308 at +0, 75 bytes; 311 at +0, 75 bytes; 312 at +0, 75 bytes */
extern char B_7FCF;
extern char B_7FD1;
extern char B_7FD3;
extern long far far_dc8ae(void);

long far far_eb71a(void)
{
    int ax;
    int bx;
    int dx;
    int si;
    long t1;

    if ((((char)(bx >> 8) << 8 | (unsigned char)B_7FCF) & 2) == si && B_7FD3 != 0 && B_7FD1 == 0) {
        t1 = far_dc8ae();
        ax = (int)t1;
        dx = (int)(t1 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
