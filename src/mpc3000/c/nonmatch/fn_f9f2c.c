/* differs: 308 at +0, 64 bytes; 311 at +0, 64 bytes; 312 at +0, 64 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int near fn_f9f5a(void);
extern long far fn_f9fb3(void);

int near fn_f9f2c(void)
{
    int ax;

    ax = (int)fn_f9fb3();
    if (!CC("<u", UNDEF)) {
        ax = fn_f9f5a();
        if (!CC("<u", UNDEF)) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char *)0xa);
        }
    }
    return ax;
}
int near fn_f9f5a(void) { return 0; }
long far fn_f9fb3(void) { return 0; }
