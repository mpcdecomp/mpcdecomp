/* differs: 308 at +A, 50 bytes; 311 at +A, 50 bytes; 312 at +A, 50 bytes */
extern char B_E550;
extern int W_E553;
extern int W_E555;
extern int W_E559;
extern int far far_b1ae0(int);

int far fn_b1b5f(int arg_0)
{
    int ax;
    int si;

    if (W_E559 != 0 && arg_0 != 0) {
        ax = W_E555;
        if (ax < W_E553) {
            si = W_E555;
            if (ax < W_E553) {
                do {
                    ax = far_b1ae0(B_E550);
                    si = si + 1;
                } while (si < W_E553);
            }
        }
    }
    return ax;
}
