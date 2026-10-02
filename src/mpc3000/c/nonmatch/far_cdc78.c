/* differs: 308 at +3, 88 bytes; 311 at +3, 88 bytes; 312 at +3, 88 bytes */
extern long far far_fb88f(void);
extern long far far_fb8cd(void);

long far far_cdc78(int arg_0)
{
    int bx;
    int cx;
    long t1;

    t1 = far_fb88f();
    bx = arg_0;
    cx = 11;
    do {
        bx = (11 - (char)cx << 8 | (unsigned char)(char)bx);
        outpw(96, bx);
        if ((char)(bx >> 8) == 0) {
            outpw(102, 0x100);
        }
        outpw(108, 0);
        cx = cx - 1;
    } while (cx != 0);
    return far_fb8cd();
}
