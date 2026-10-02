/* differs: 308 at +0, 110 bytes; 311 at +0, 110 bytes; 312 at +0, 110 bytes */
extern char B_83BA;
extern unsigned char B_F21A[];
extern unsigned char B_F21F[];
extern long far fn_c403f(int, int, unsigned char far *);
long far fn_c403f(int p0, int p1, unsigned char far *p2) { return 0; }

int far fn_c4122(void)
{
    int ax;
    int ax2;
    long t1;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_83BA);
    if ((char)ax == 0) {
        return (int)fn_c403f(4, 6, (unsigned char far *)B_F21F);
    }
    if ((char)ax == 1) {
        return (int)fn_c403f(5, 6, (unsigned char far *)B_F21F);
    }
    if ((char)ax != 2) {
        return (char)ax;
    }
    t1 = fn_c403f(4, 6, (unsigned char far *)B_F21F);
    return (int)fn_c403f(5, 6, (unsigned char far *)B_F21A);
}
