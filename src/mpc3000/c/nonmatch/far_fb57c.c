/* differs: 308 at +0, 53 bytes; 311 at +0, 53 bytes; 312 at +0, 53 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_fb14d(void);
extern int far far_fb18a(void);
extern void far fn_fb596(void);
int far far_fb14d(void) { return 0; }
int far far_fb18a(void) { return 0; }

void far far_fb57c(void)
{
    int di;
    int ds;
    long t1;
    int t2;
    long t3;

    di = (int)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40));
    ds = (int)(*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) >> 16);
    *(int far *)MK_FP(ds, di + 18) = *(int far *)MK_FP(ds, di + 18) - 1;
    if (*(int far *)MK_FP(ds, di + 18) == 1) {
        t1 = far_fb14d();
        fn_fb596();
        t3 = far_fb18a();
    }
    return;
}
void far fn_fb596(void) { }
