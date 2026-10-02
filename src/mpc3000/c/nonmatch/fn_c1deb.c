/* differs: 308 at +0, 189 bytes; 311 at +0, 189 bytes; 312 at +0, 189 bytes */
#define UNDEF 0
extern char TBL_159B[];
extern long far fn_c1e77(int, int);

long far fn_c1deb(void)
{
    int ax;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int si;
    long t1;
    long t2;

    t1 = fn_c1e77(10, 0);
    bx = UNDEF;
    dx = (int)(fn_c1e77(11, 0) >> 16);
    si = 0;
    do {
        dx2 = ((char)(dx >> 8) << 8 | (unsigned char)0);
        bx2 = ((char)(bx >> 8) << 8 | (unsigned char)TBL_159B[si]);
        if ((char)bx2 != 0) {
            ax = 0;
            do {
                dx2 = ((char)(dx2 >> 8) << 8 | (unsigned char)((char)dx2 << 1));
                if (((char)bx2 & 1) != 0) {
                    dx2 = ((char)(dx2 >> 8) << 8 | (unsigned char)((char)dx2 + 1));
                }
                bx2 = ((char)(bx2 >> 8) << 8 | (unsigned char)((unsigned int)(char)bx2 >> 1));
                ax = ax + 1;
            } while (ax < 8);
        }
        t2 = fn_c1e77(12, (unsigned char)(char)dx2);
        bx = UNDEF;
        dx = (int)(t2 >> 16);
        si = si + 1;
    } while (si < 0x780);
    return ((long)dx << 16 | (unsigned)(int)t2);
}
long far fn_c1e77(int p0, int p1) { return 0; }
