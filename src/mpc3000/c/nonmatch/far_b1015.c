/* differs: 308 at +32, 40 bytes; 311 at +32, 40 bytes; 312 at +32, 40 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B87;
extern char B_7B8B;
extern char TBL_7B5E[];
extern int far far_b1ad0(int, int);
extern int far far_b1ae0(int);
extern int far far_b1b2b(char far *, char far *);

void far far_b1015(char arg_0)
{
    char loc_1;
    char loc_2;
    int ax;
    int t1;
    int t2;

    t1 = far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2));
    t2 = far_b1ae0(arg_0);
    TBL_7B5E[B_7B87] = arg_0;
    B_7B87 = (char)(B_7B87 + 1);
    if (B_7B87 >= B_7B8B) {
        far_b1ad0(loc_1, loc_2);
        B_7B87 = (char)(B_7B87 - 1);
        return;
    }
    return;
}
