/* differs: 308 at +0, 37 bytes; 311 at +0, 37 bytes; 312 at +0, 37 bytes */
extern int far fn_fb1c5(int, int, int, int, int, int, int);
int far fn_fb1c5(int p0, int p1, int p2, int p3, int p4, int p5, int p6) { return 0; }

void far far_fb45f(void)
{
    int ax;
    int bp;
    int bx;
    int cx;
    int di;
    int dx;
    int si;
    long t1;

    t1 = fn_fb1c5(bp, di, si, bx, dx, cx, ax);
    _enable();
    return;
}
