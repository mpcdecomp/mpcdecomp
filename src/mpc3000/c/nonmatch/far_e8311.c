/* differs: 308 at +0, 29 bytes; 311 at +0, 29 bytes; 312 at +0, 29 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int near fn_e80bc(void);
extern int near fn_e80f2(void);
int near fn_e80bc(void) { return 0; }
int near fn_e80f2(void) { return 0; }

void far far_e8311(void)
{
    int ax;
    int t1;

    ax = fn_e80bc();
    if (!CC("<u", UNDEF)) {
        t1 = fn_e80f2();
        if (CC("<u", UNDEF)) {
L1:
        }
    } else {
        goto L1;
    }
    return;
}
