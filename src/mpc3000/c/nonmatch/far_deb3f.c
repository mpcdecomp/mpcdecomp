/* differs: 308 at +0, 56 bytes; 311 at +0, 56 bytes; 312 at +0, 56 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_A5CF[];
extern unsigned char TBL_A787[];
extern unsigned char TBL_A79B[];
extern unsigned char TBL_A7AF[];
extern int far far_e66a4(void);

void far far_deb3f(void)
{
    int ax;

    __stos2((unsigned char far *)TBL_A7AF, 0, 0x2710);
    __stos2((unsigned char far *)TBL_A79B, 0, 20);
    __stos2((unsigned char far *)TBL_A787, 0x101, 20);
    __stos2((unsigned char far *)TBL_A5CF, 0, 100);
    far_e66a4();
    return;
}
