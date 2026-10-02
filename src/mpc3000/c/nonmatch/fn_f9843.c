/* differs: 308 at +0, 44 bytes; 311 at +0, 44 bytes; 312 at +0, 44 bytes */
#define UNDEF 0
extern int near fn_f985a(void);

long near fn_f9843(void)
{
    int ax;
    int ax2;
    int t1;

    *(int *)0x68ab = ax;
    fn_f985a();
    t1 = fn_f985a();
    *(char *)0x68af = (char)-1;
    return ((long)UNDEF << 16 | (unsigned)t1);
}
int near fn_f985a(void) { return 0; }
