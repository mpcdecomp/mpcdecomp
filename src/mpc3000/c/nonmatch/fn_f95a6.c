/* differs: 308 at +0, 17 bytes; 311 at +0, 17 bytes; 312 at +0, 17 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void near fn_f955f(void);
extern void near fn_f95cf(void);
extern void near fn_f95ec(int);
void near fn_f955f(void) { }

int near fn_f95a6(void)
{
    int t1;
    int t2;
    int t3;

    fn_f955f();
L1:
    fn_f95cf();
    if (UNDEF == 0) {
        goto L2;
    }
    if (UNDEF != 1) {
        goto L1;
    }
    return (-1 << 8 | (unsigned char)(char)UNDEF);
L2:
    fn_f95ec(UNDEF);
    return (unsigned char)(char)UNDEF;
}
void near fn_f95cf(void) { }
void near fn_f95ec(int p0) { }
