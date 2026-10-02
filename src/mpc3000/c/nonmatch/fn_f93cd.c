/* differs: 308 at +0, 94 bytes; 311 at +0, 94 bytes; 312 at +0, 94 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void near fn_f9654(int);
extern long near fn_f967a(void);

void near fn_f93cd(void)
{
    int bx;
    int di;
    int p14;
    int t1;
    long t2;

    if (*(char *)0x19 != 0) {
        return;
    }
    p14 = 0x201;
    *(int *)0x20 = *(int *)0x26 - 1;
    bx = 0x24d;
    di = *(int *)0x24;
    for (;;) {
        *(int *)0x20 = *(int *)0x20 + 1;
        fn_f9654(bx);
        p14 = p14;
        t2 = fn_f967a();
        if (!CC("<u", UNDEF)) {
            bx = UNDEF + 0x200;
            di = di - 1;
            if (di == 0) {
                break;
            }
            continue;
        }
        break;
    }
    return;
}
void near fn_f9654(int p0) { }
long near fn_f967a(void) { return 0; }
