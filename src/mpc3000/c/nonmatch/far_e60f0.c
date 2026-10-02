/* differs: 308 at +0, 70 bytes; 311 at +0, 72 bytes; 312 at +0, 72 bytes */
extern char B_8800;
extern char B_8A9F;
extern unsigned char B_901B[];
extern int far far_e0031(unsigned char far *);
extern long far far_e51be(unsigned char far *, int, int);

long far far_e60f0(void)
{
    int ax;
    int dx;
    int t1;
    long t2;

    if (B_8800 != 0) {
        t1 = far_e0031((unsigned char far *)B_901B);
        B_8800 = (char)0;
        t2 = far_e51be((unsigned char far *)B_901B, B_8A9F, 1);
        ax = (int)t2;
        dx = (int)(t2 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
