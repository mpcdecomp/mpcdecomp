/* differs: 308 at +3, 48 bytes; 311 at +3, 48 bytes; 312 at +3, 48 bytes */
#define UNDEF 0
extern char TBL_E3AC[];
extern long far far_cde12(int);

int far fn_cb87a(int arg_0)
{
    int ax;
    int bx;
    int cx;
    int dx;
    int es;
    int p8;
    int si;
    long t1;

    si = 0;
L1:
    ax = (unsigned char)TBL_E3AC[si];
    if (ax != arg_0) {
        goto L2;
    }
    p8 = si;
    t1 = far_cde12(p8);
    bx = UNDEF;
    cx = UNDEF;
    es = UNDEF;
    ax = (int)t1;
    dx = (int)(t1 >> 16);
L2:
    si = si + 1;
    if (si < 32) {
        goto L1;
    }
    return ax;
}
