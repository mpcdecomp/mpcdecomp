/* differs: 308 at +0, 42 bytes; 311 at +0, 42 bytes; 312 at +0, 42 bytes */
#define UNDEF 0
extern char B_744C;
extern long far fn_e8093(void);

long near fn_e7fcd(void)
{
    long t1;

    t1 = fn_e8093();
    if (!CC("<u", UNDEF)) {
        B_744C = (char)0;
    }
    return t1;
}
long far fn_e8093(void) { return 0; }
