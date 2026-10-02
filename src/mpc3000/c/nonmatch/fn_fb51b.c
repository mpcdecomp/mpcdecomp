/* differs: 308 at +0, 16 bytes; 311 at +0, 16 bytes; 312 at +0, 16 bytes */
#define UNDEF 0
extern int near fn_fb52d(void);

long far fn_fb51b(void)
{
    int t1;

    t1 = fn_fb52d();
    return ((long)UNDEF << 16 | (unsigned)t1);
}
int near fn_fb52d(void) { return 0; }
