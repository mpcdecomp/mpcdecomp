/* differs: 308 at +3, 25 bytes; 311 at +3, 25 bytes; 312 at +3, 25 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far fn_e4a31(int arg_0, char far *arg_2)
{
    if ((arg_2[arg_0 + 166] & 4) != 0) {
        return 1;
    }
    return 0;
}
