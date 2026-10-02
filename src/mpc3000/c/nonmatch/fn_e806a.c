/* differs: 308 at +0, 62 bytes; 311 at +0, 62 bytes; 312 at +0, 62 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7426;
extern int near fn_e80bc(void);
extern int near fn_e80f2(void);
extern void near fn_e8129(void);
extern int near fn_e8172(void);

long near fn_e806a(void)
{
    int ax;
    int dx;
    int t1;

    fn_e8129();
    ax = fn_e8172();
    dx = UNDEF;
    if (!CC("<u", UNDEF)) {
        B_7426 = (char)-58;
        ax = fn_e80bc();
        dx = UNDEF;
        if (!CC("<u", UNDEF)) {
            ax = fn_e80f2();
            dx = UNDEF;
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
int near fn_e80bc(void) { return 0; }
int near fn_e80f2(void) { return 0; }
void near fn_e8129(void) { }
int near fn_e8172(void) { return 0; }
