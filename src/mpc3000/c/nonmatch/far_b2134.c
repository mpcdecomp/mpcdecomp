/* differs: 308 at +0, 85 bytes; 311 at +0, 85 bytes; 312 at +0, 85 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7FEE;
extern char B_806F;
extern char B_8077;
extern char B_8078;
extern char B_807B;
extern char B_807C;
extern char B_807D;
extern char B_817F;
extern char B_8180;
extern unsigned char TBL_7FEB[];

void far far_b2134(void)
{
    __stos2((unsigned char far *)TBL_7FEB, 0x101, 138);
    B_806F = (char)0;
    B_7FEE = (char)0;
    B_8077 = (char)2;
    B_8078 = (char)5;
    B_807B = (char)5;
    B_807C = (char)5;
    B_807D = (char)5;
    __stos2(MK_FP(SEG_DATA, 0x7454), 0x505, 32);
    __stos2(MK_FP(SEG_DATA, 0x74d5), 0, 128);
    B_817F = (char)0;
    B_8180 = (char)64;
    return;
}
