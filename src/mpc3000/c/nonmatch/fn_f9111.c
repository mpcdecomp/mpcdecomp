/* differs: 308 at +0, 87 bytes; 311 at +0, 87 bytes; 312 at +0, 87 bytes */
#define UNDEF 0
extern int far fn_f9325(int, int);
extern int near fn_f948b(void);
extern int near fn_f950a(void);

int near fn_f9111(void)
{
    int bx;
    int cx;
    long t1;

    t1 = fn_f9325(cx, bx);
    if (!CC(">=u", UNDEF)) {
        return (int)t1;
    }
    if ((char)((int)t1 >> 8) == -1) {
        return (-1 << 8 | (unsigned char)(char)(int)t1);
    }
    if (CC(">=u", UNDEF)) {
        return fn_f950a();
    }
    return fn_f948b();
}
int far fn_f9325(int p0, int p1) { return 0; }
int near fn_f948b(void) { return 0; }
int near fn_f950a(void) { return 0; }
