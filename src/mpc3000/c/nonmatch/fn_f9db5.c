/* differs: 308 at +0, 24 bytes; 311 at +0, 24 bytes; 312 at +0, 24 bytes */
#define UNDEF 0
extern long near fn_f9f19(void);
extern int near fn_f9fb6(void);

long near fn_f9db5(void)
{
    int ax;
    int dx;
    long t1;

L1:
    return ((long)dx << 16 | (unsigned)ax);
    ax = fn_f9fb6();
    dx = UNDEF;
    if (CC("<u", UNDEF)) {
        goto L2;
    }
    t1 = fn_f9f19();
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    if (CC("<u", UNDEF)) {
        goto L2;
    }
    if ((*(char *)0xa & 32) != 0) {
        goto L1;
    }
    *(char *)0x7 = (char)64;
L2:
    return ((long)dx << 16 | (unsigned)ax);
}
long near fn_f9f19(void) { return 0; }
int near fn_f9fb6(void) { return 0; }
