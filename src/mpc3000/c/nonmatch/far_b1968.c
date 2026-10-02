/* differs: 308 at +10, 34 bytes; 311 at +10, 34 bytes; 312 at +10, 34 bytes */
extern char B_8187;
extern char B_826A;
extern void far far_cc50a(int, int, int);

void far far_b1968(int arg_0)
{
    int dx;
    int t1;

    if (arg_0 == 0) {
        goto L1;
    }
    dx = B_826A;
    goto L2;
L1:
    dx = (int)((long)(signed char)B_826A / 4L);
L2:
    far_cc50a(128, dx, B_8187);
    return;
}
