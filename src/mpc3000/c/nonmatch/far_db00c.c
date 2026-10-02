/* differs: 308 at +0, 38 bytes; 311 at +0, 38 bytes; 312 at +0, 38 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_981B[];
extern unsigned char TBL_9831[];
extern int far far_db034(void);
extern long far far_de3fa(void);

int far far_db00c(void)
{
    int ax;
    long t1;

    far_db034();
    t1 = far_de3fa();
    __stos2((unsigned char far *)TBL_9831, 0, 0x400);
    __stos2((unsigned char far *)TBL_981B, -1, 20);
    return -1;
}
int far far_db034(void) { return 0; }
