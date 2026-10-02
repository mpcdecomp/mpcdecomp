/* differs: 308 at +0, 119 bytes; 311 at +0, 119 bytes; 312 at +0, 119 bytes */
#define UNDEF 0
extern void near fn_f93cd(void);
extern void near fn_f941d(void);
extern void near fn_f9654(void);
extern long near fn_f967a(void);
void near fn_f93cd(void) { }
void near fn_f941d(void) { }

void near fn_f94b4(void)
{
    int bx;
    int bx2;
    int cx;
    int cx2;
    int si;
    int si2;
    int t1;
    long t2;
    int t3;
    int t4;

    if (*(char *)0x19 != 0) {
        return;
    }
    *(int *)0x22 = -1;
    *(int *)0x20 = -2;
    bx = *(int *)0x3;
    si = 0x424d;
    cx = *(int *)0xb;
    for (;;) {
        fn_f9654();
        t2 = fn_f967a();
        si2 = si;
        cx2 = cx;
        bx2 = bx;
        if (CC("<u", UNDEF)) {
            break;
        }
        si = si2 + *(int *)0x0;
        bx = bx2 + 1;
        cx = cx2 - 1;
        if (cx != 0) {
            continue;
        }
        goto L1;
    }
    goto L2;
L1:
    fn_f93cd();
    fn_f941d();
L2:
    return;
}
void near fn_f9654(void) { }
long near fn_f967a(void) { return 0; }
