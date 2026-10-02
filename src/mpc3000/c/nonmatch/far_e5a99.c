/* differs: matches beside its same-file callees (the stubs) */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern unsigned char B_901B[];
extern long far far_e5d7c(void);
extern long far fn_e5ac8(long);

long far far_e5a99(int arg_0, int arg_2)
{
    if (B_8800 != 0 && arg_2 == SEG_DATA && arg_0 == (unsigned int)(unsigned)B_901B) {
        return far_e5d7c();
    }
    return fn_e5ac8(*(long *)((char *)&arg_0 + 0));
}
long far far_e5d7c(void) { return 0; }
long far fn_e5ac8(long p0) { return 0; }
