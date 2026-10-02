/* differs: 308 at +0, 94 bytes; 311 at +0, 94 bytes; 312 at +0, 94 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[26155];
    char f_662b;
};
extern long near fn_f9843(void);
extern int near fn_f985a(void);

void near fn_f97cc(void)
{
    int ax;
    int ax2;
    struct s1 near *bx;
    int bx2;
    long t1;
    long t2;

    bx = (struct s1 near *)*(int *)0x68ab;
    if ((char)bx2 == bx->f_662b) {
        *(char *)0x68af = (char)0;
    } else {
        bx->f_662b = (char)bx2;
        if (*(char *)0x68af == 0) {
            t1 = fn_f9843();
        }
        ax = fn_f985a();
    }
    ax2 = *(int *)0x68ab;
    if (ax2 != 0x13f) {
        *(int *)0x68ab = ax2 + 1;
        return;
    }
    t2 = fn_f9843();
    return;
}
long near fn_f9843(void) { return 0; }
int near fn_f985a(void) { return 0; }
