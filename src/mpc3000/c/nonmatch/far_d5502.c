/* differs: 308 absent; 311 at +6, 66 bytes; 312 at +6, 66 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern char B_7AAA;
extern char B_7AAB;
extern char B_7AAC;
extern char B_7AAD;
extern char B_7AAE;
extern char B_7AAF;
extern int far far_d50a2(int, char far *, int, char far *, int);

void far far_d5502(int arg_0, int arg_2)
{
    char loc_4[4];
    int ax;

    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 0, 4);
    B_7AAA = (char)4;
    B_7AAB = (char)0;
    B_7AAC = (char)0;
    B_7AAD = (char)((unsigned int)(arg_2 & -0x100) >> 8);
    B_7AAE = (char)arg_2;
    B_7AAF = (char)0;
    far_d50a2(arg_0, (char far *)&B_7AAA, 6, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 0);
    return;
}
