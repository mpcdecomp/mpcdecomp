/* differs: 308 at +0, 132 bytes; 311 at +0, 132 bytes; 312 at +0, 132 bytes */
#define UNDEF 0
extern int near fn_f93bd(void);
extern void near fn_f9654(void);
extern long near fn_f967a(void);
int near fn_f93bd(void) { return 0; }

int near fn_f950a(void)
{
    int ax;
    int bx;
    int bx2;
    int cx;
    int cx2;
    int cx3;
    int p14;
    int si;
    int si2;
    int t1;

    if (*(char *)0x19 != 0) {
        return 0;
    }
    cx = (unsigned char)*(char *)0x5;
    bx = *(int *)0x3;
    for (;;) {
L1:
        p14 = cx;
        si = 0x424d;
        cx2 = *(int *)0xb;
        for (;;) {
            fn_f9654();
            ax = (int)fn_f967a();
            si2 = si;
            cx3 = cx2;
            bx2 = bx;
            if (CC("<u", UNDEF)) {
                goto L2;
            }
            bx = bx2 + 1;
            si = si2 + *(int *)0x0;
            cx2 = cx3 - 1;
            if (cx2 != 0) {
                continue;
            }
            goto L3;
        }
    }
    goto L4;
L2:
    goto L5;
L3:
    cx = p14 - 1;
    if (cx != 0) {
        goto L1;
    }
L4:
    ax = fn_f93bd();
L5:
    return ax;
}
void near fn_f9654(void) { }
long near fn_f967a(void) { return 0; }
