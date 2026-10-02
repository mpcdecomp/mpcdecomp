/* differs: 308 at +0, 24 bytes; 311 at +0, 24 bytes; 312 at +0, 24 bytes */
#define UNDEF 0
extern int W_7384;
extern int near fn_e8097(void);

long far fn_e8093(void)
{
    int bx;

    W_7384 = bx;
    return ((long)UNDEF << 16 | (unsigned)fn_e8097());
}
int near fn_e8097(void) { return 0; }
