/* differs: 308 at +3, 110 bytes; 311 at +3, 110 bytes; 312 at +3, 110 bytes */
#define UNDEF 0
extern char B_F008;
extern char B_F009;
extern char B_F00A;
extern void far far_c46ab(void);
extern int far far_d9cb4(int);
extern int far far_d9fe6(int);
extern long far far_da102(int, int);

long far fn_c4643(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int ax2;
    int dx;
    int dx2;
    int t1;
    long t2;

    if (B_F008 != arg_0) {
        goto L1;
    }
    if (B_F009 != arg_2) {
        goto L1;
    }
    if (B_F00A == arg_4) {
        goto L2;
    }
L1:
    B_F008 = *(char *)((char *)&arg_0 + 0);
    B_F009 = *(char *)((char *)&arg_2 + 0);
    B_F00A = *(char *)((char *)&arg_4 + 0);
    far_c46ab();
    t2 = far_da102(arg_0, arg_2);
    ax = far_d9fe6(arg_2);
    dx2 = UNDEF;
    if (arg_4 == 0) {
        goto L3;
    }
    ax2 = far_d9cb4(arg_2);
    dx2 = UNDEF;
L3:
    return ((long)dx2 << 16 | (unsigned)1);
L2:
    return ((long)dx << 16 | (unsigned)0);
}
void far far_c46ab(void) { }
