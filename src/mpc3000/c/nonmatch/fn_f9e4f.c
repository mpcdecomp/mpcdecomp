/* differs: 308 at +0, 51 bytes; 311 at +0, 51 bytes; 312 at +0, 51 bytes */
#define UNDEF 0
extern int near fn_f9fb6(void);

void near fn_f9e4f(void)
{
    int ax;

    ax = fn_f9fb6();
    if (!CC("<u", UNDEF) && !CC("<u", UNDEF)) {
        if ((*(char *)0xa & -64) != 0) {
            *(char *)0x7 = (char)64;
        }
    }
    return;
}
int near fn_f9fb6(void) { return 0; }
