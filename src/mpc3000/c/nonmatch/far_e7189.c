/* differs: 308 at +5, 187 bytes; 311 at +5, 187 bytes; 312 at +5, 187 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[1];
    char f_1;
};
extern char B_8800;
extern unsigned char B_901B[];
extern void far far_d99a2(unsigned char far *, char far *, int);
extern long far far_e723d(struct s1 far *, int, int);
extern long far far_eb007(struct s1 far *, long, char far *);

long far far_e7189(struct s1 far *arg_0, int arg_2, int arg_4)
{
    char loc_a[10];
    char loc_12[8];
    int bx;
    int es;
    int t1;
    long t2;
    long t3;
    long t4;
    long t5;

    if (B_8800 == 0 && (arg_0->f_1 & 2) == 0) {
        far_d99a2((unsigned char far *)B_901B, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a), 5);
        if (loc_a[0] == -88) {
            t2 = far_e723d(arg_0, (unsigned char)loc_a[3], (unsigned char)loc_a[4]);
        } else {
            t3 = far_e723d(arg_0, 4, 4);
        }
        return 0L;
    }
    *(int *)((char *)&loc_12 + 4) = 0x100;
    *(int *)((char *)&loc_12 + 6) = arg_4;
    t4 = far_eb007(arg_0, ((long)*(int *)((char *)&loc_12 + 6) << 16 | (unsigned)0x100), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12));
    *(int *)((char *)&loc_a + 8) = (int)(t4 >> 16);
    *(int *)((char *)&loc_a + 6) = (int)t4;
    bx = (int)*(long *)((char *)&loc_a + 6);
    es = (int)(*(long *)((char *)&loc_a + 6) >> 16);
    t5 = far_e723d(arg_0, *(char far *)MK_FP(es, bx), *(char far *)MK_FP(es, bx + 1));
    return *(long *)((char *)&loc_12 + 0);
}
