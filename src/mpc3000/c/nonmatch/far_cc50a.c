/* differs: 308 at +57, 34 bytes; 311 match; 312 match */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void far far_cb363(char far *);
extern void far far_cb3de(char far *);
extern long far fn_cbc38(int, char far *, char far *, char far *, char far *, int);
long far fn_cbc38(int p0, char far *p1, char far *p2, char far *p3, char far *p4, int p5) { return 0; }

void far far_cc50a(int arg_0, int arg_2, int arg_4)
{
    char loc_4[4];
    char loc_a[6];
    char loc_22[24];
    int t1;
    int t2;
    long t3;

    loc_a[0] = (char)-112;
    loc_a[1] = (char)0;
    loc_a[2] = (char)0;
    loc_a[3] = (char)(arg_2 * 127 / 100);
    loc_a[4] = (char)64;
    far_cb363((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22));
    loc_22[0] = *(char *)((char *)&arg_0 + 0);
    far_cb3de((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4));
    if (arg_4 != 0) {
        loc_4[0] = (char)0;
    }
    loc_4[3] = *(char *)((char *)&arg_4 + 0);
    loc_4[2] = (char)100;
    t3 = fn_cbc38(98, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 0);
    return;
}
