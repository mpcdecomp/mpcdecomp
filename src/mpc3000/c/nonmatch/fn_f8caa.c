/* differs: 308 at +0, 9 bytes; 311 at +0, 9 bytes; 312 at +0, 9 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void near fn_f95ec(void);
extern int near fn_f9638(void);

void near fn_f8caa(void)
{
    int ax;
    int ax2;
    int t1;

    fn_f9638();
    ax2 = fn_f9638();
    do {
        fn_f95ec();
    } while ((unsigned int)(UNDEF + 1) <= (unsigned int)UNDEF);
    return;
}
void near fn_f95ec(void) { }
int near fn_f9638(void) { return 0; }
