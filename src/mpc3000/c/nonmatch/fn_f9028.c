/* differs: 308 at +0, 86 bytes; 311 at +0, 86 bytes; 312 at +0, 86 bytes */
#define UNDEF 0
extern int far fn_f9325(int, int);
extern int near fn_f948b(void);

int near fn_f9028(void)
{
    int bx;
    int si;
    long t1;
    int t2;

    t1 = fn_f9325(si, bx);
    if (CC(">=u", UNDEF)) {
        goto L1;
    }
    return (int)t1;
L1:
    if ((char)((int)t1 >> 8) != -1) {
        goto L2;
    }
    return (int)t1;
L2:
    t2 = fn_f948b();
    if (CC(">=u", UNDEF)) {
        goto L3;
    }
    return t2;
L3:
    return (unsigned char)(char)t2;
}
int far fn_f9325(int p0, int p1) { return 0; }
int near fn_f948b(void) { return 0; }
