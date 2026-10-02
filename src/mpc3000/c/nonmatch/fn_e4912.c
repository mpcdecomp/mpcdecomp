/* differs: 308 at +5, 170 bytes; 311 at +5, 170 bytes; 312 at +5, 168 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_901B[];
extern char TBL_8CE7[];
extern char TBL_8D4B[];
extern char TBL_8DAF[];
extern char TBL_90C1[];
extern char TBL_9125[];
extern char TBL_9189[];
extern long far far_e0031(unsigned char far *);
extern long far far_e4d15(int, char, char far *);
extern long far far_e57c8(int, int, char far *);

void far fn_e4912(int arg_0, int arg_2)
{
    char loc_66[102];
    char loc_78[18];
    int ax;
    long t1;

    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_66), -1, 100);
    loc_66[101] = (char)1;
    while (loc_66[101] < 100) {
        TBL_90C1[loc_66[101]] = TBL_8CE7[loc_66[101]];
        TBL_9125[loc_66[101]] = TBL_8D4B[loc_66[101]];
        TBL_9189[loc_66[101]] = TBL_8DAF[loc_66[101]];
        loc_66[101] = (char)(loc_66[101] + 1);
    }
    ax = (int)far_e0031((unsigned char far *)B_901B);
    loc_66[101] = (char)1;
    while (loc_66[101] < 100) {
        if ((int)far_e4d15(arg_0, loc_66[101], (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_78)) == 0) {
            t1 = far_e57c8(arg_2, loc_66[101], (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_78));
            if ((int)t1 != 0) {
                goto L1;
            }
L2:
            loc_66[101] = (char)(loc_66[101] + 1);
            continue;
        }
        goto L2;
    }
    return;
L1:
    return;
}
