/* differs: 308 at +0, 4 bytes; 311 at +0, 4 bytes; 312 at +0, 4 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int near fn_ead18(void);

void far far_eacdc(void)
{
    int ax;

    fn_ead18();
    return;
}
int near fn_ead18(void) { return 0; }
