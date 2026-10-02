/* differs: 308 at +0, 73 bytes; 311 at +0, 73 bytes; 312 at +0, 73 bytes */
#define UNDEF 0
extern int near fn_f9f42(void);
extern int near fn_f9f5a(void);
extern long far fn_f9fb3(void);

long near fn_f9f19(void)
{
    int ax;
    int dx;
    long t1;

    ax = fn_f9f42();
    dx = UNDEF;
    if (!CC("<u", UNDEF)) {
        t1 = fn_f9fb3();
        ax = (int)t1;
        dx = (int)(t1 >> 16);
        if (!CC("<u", UNDEF)) {
            ax = fn_f9f5a();
            dx = UNDEF;
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
int near fn_f9f42(void) { return 0; }
int near fn_f9f5a(void) { return 0; }
long far fn_f9fb3(void) { return 0; }
