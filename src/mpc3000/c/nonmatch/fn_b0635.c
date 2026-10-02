/* differs: 308 at +5, 73 bytes; 311 at +5, 73 bytes; 312 at +5, 73 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_7B8E;
extern char far *FP_7B8F;
extern long far fn_b05ca(void);
extern long far fn_b05de(void);
long far fn_b05ca(void) { return 0; }
long far fn_b05de(void) { return 0; }

void far fn_b0635(int arg_0)
{
    char loc_1;
    int ax;
    long t1;
    long t2;

    loc_1 = B_7B8D;
    do {
        if (arg_0 > 0) {
            t1 = fn_b05de();
            ax = (int)t1;
        } else {
            t2 = fn_b05ca();
            ax = (int)t2;
        }
    } while (ax != 0 && *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0) + 3) == 7);
    B_7B8E = B_7B8D;
    B_7B8D = loc_1;
    return;
}
