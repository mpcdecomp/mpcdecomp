/* differs: 308 absent; 311 at +E, 3 bytes; 312 at +E, 3 bytes */
extern long far far_b3b9f(int);

void far fn_bafcb(int arg_0)
{
    long t1;
    long t2;
    long t3;

    if (arg_0 == -2) {
        goto L1;
    }
    if (arg_0 == -1) {
        goto L2;
    }
    goto L3;
L1:
    t3 = far_b3b9f(-183);
    return;
L2:
    t2 = far_b3b9f(-128);
    return;
L3:
    t1 = far_b3b9f(-0xb00);
    return;
}
