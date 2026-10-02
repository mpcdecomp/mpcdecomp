/* differs: 308 at +6, 12 bytes; 311 at +6, 12 bytes; 312 at +6, 12 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_F21A;
extern char B_F21B;
extern char B_F21C;
extern char B_F21F;
extern char B_F220;
extern char B_F221;
extern long far fn_c4122(void);
long far fn_c4122(void) { return 0; }

long far fn_c4195(void)
{
    B_F220 = B_F21F;
    B_F221 = B_F21F;
    B_F21B = B_F21A;
    B_F21C = B_F21A;
    return fn_c4122();
}
