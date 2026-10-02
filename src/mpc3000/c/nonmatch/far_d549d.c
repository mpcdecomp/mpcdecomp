/* differs: 308 absent; 311 match; 312 match */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern char B_7AAA;
extern char B_7AAB;
extern char B_7AAC;
extern char B_7AAD;
extern char B_7AAE;
extern char B_7AAF;
extern long far far_d5ca6(int, char far *, int, char far *, int);

long far far_d549d(int arg_0)
{
    char loc_8[8];

    B_7AAA = (char)0;
    B_7AAB = (char)0;
    B_7AAC = (char)0;
    B_7AAD = (char)0;
    B_7AAE = (char)0;
    B_7AAF = (char)0;
    return far_d5ca6(arg_0, (char far *)&B_7AAA, 6, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), 8);
}
