/* differs: 308 at +1E, 4 bytes; 311 at +1E, 4 bytes; 312 at +1E, 4 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern int far far_e0031();
extern void far fn_e483e();

long far far_e481e(void)
{
    int ax;
    int ax2;
    int t1;

    far_e0031(B_901B);
    far_e0031(B_8C41);
    fn_e483e();
    return ((long)UNDEF << 16 | (unsigned)0);
}
void far fn_e483e(void) { }
