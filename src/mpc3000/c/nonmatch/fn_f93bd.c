/* differs: 308 at +0, 113 bytes; 311 at +0, 113 bytes; 312 at +0, 113 bytes */
#define UNDEF 0
extern void near fn_f9654(int);
extern long near fn_f967a(void);

int near fn_f93bd(void)
{
    int bx;
    int di;
    int p14;
    int t1;
    long t2;

    if (*(char *)0x19 != 0) {
        return 0;
    }
    p14 = 0x301;
    *(int *)0x20 = *(int *)0x26 - 1;
    bx = 0x24d;
    di = *(int *)0x24;
    do {
        *(int *)0x20 = *(int *)0x20 + 1;
        fn_f9654(bx);
        p14 = p14;
        t2 = fn_f967a();
        if (CC("<u", UNDEF)) {
            break;
        }
        bx = UNDEF + 0x200;
        di = di - 1;
    } while (di != 0);
    return (int)t2;
}
void near fn_f9654(int p0) { }
long near fn_f967a(void) { return 0; }
