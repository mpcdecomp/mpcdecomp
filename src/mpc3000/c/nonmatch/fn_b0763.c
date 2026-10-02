/* differs: 308 at +3, 112 bytes; 311 at +3, 112 bytes; 312 at +3, 112 bytes */
extern char B_7B8D;
extern char B_7B8E;
extern void far fn_b0635(int);
extern long far fn_b0670(int);
void far fn_b0635(int p0) { }
long far fn_b0670(int p0) { return 0; }

void far fn_b0763(int arg_0)
{
    int ax;
    int flags;
    long t1;
    long t2;
    int t3;
    int t4;

    B_7B8E = B_7B8D;
    ax = arg_0 & 0xf00;
    flags = ax - 0x400;
    if (CC("==", flags)) {
        fn_b0635(-1);
        return;
    }
    if (CC(">", flags)) {
        if (ax != 0x800) {
            goto L1;
        }
        fn_b0635(1);
        return;
    }
    if (ax == 0x100) {
        t2 = fn_b0670(-1);
        return;
    }
    if (ax != 0x200) {
        return;
    }
    t1 = fn_b0670(1);
L1:
    return;
}
