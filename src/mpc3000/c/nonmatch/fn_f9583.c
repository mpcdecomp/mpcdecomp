/* differs: 308 at +0, 50 bytes; 311 at +0, 50 bytes; 312 at +0, 50 bytes */
#define UNDEF 0
extern void near fn_f955f(void);
extern void near fn_f95cf(int, int);
void near fn_f955f(void) { }

int near fn_f9583(void)
{
    int cx;
    int cx2;
    int dx;
    int dx2;
    int p6;
    int t1;
    int t2;

    fn_f955f();
    dx = 2;
    cx = UNDEF;
    p6 = 0;
    do {
        fn_f95cf(dx, cx);
        dx2 = dx;
        cx2 = cx;
        if (UNDEF == 0) {
            p6 = p6 + 1;
        }
        dx = dx2 + 1;
        cx = cx2 - 1;
    } while (cx != 0);
    return;
}
void near fn_f95cf(int p0, int p1) { }
