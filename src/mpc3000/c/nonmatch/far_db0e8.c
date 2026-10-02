/* differs: 308 at +0, 45 bytes; 311 at +0, 45 bytes; 312 at +0, 45 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_9F67[];
extern unsigned char TBL_A367[];
extern unsigned char TBL_A4E7[];
extern int far far_de341(void);

void far far_db0e8(void)
{
    int ax;

    far_de341();
    __stos2((unsigned char far *)TBL_A4E7, -1, 128);
    __stos2((unsigned char far *)TBL_A367, -1, 128);
    __stos2((unsigned char far *)TBL_9F67, -1, 128);
    return;
}
