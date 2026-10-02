/* differs: 308 at +5, 218 bytes; 311 at +5, 218 bytes; 312 at +5, 218 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1ae0(int);
extern void far far_b3ab6(char far *);
extern long far far_d7805(int, char far *, int, int);
void far far_b3ab6(char far *p0) { }

long far far_b3b12(int arg_0, int arg_2, char arg_4)
{
    char loc_30[48];
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int dx2;
    int es;
    int t1;
    int t2;
    int t3;

    if ((arg_4 & 8) != 0) {
        arg_0 = arg_0 & 255;
    }
    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)32);
    if ((arg_4 & 2) != 0) {
        bx = ((char)(bx >> 8) << 8 | (unsigned char)48);
    }
    dx2 = (int)(far_d7805(arg_0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_30), *(char *)((char *)&arg_2 + 0), bx) >> 16);
    if ((arg_4 & 4) != 0) {
        far_b3ab6((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_30));
        dx2 = UNDEF;
    }
    *(int *)((char *)&loc_30 + 44) = SEG_STACK;
    *(int *)((char *)&loc_30 + 42) = (int)(unsigned)loc_30;
    loc_30[47] = (char)0;
    ax = ((char)((unsigned int)(unsigned)loc_30 >> 8) << 8 | (unsigned char)loc_30[47]);
    if ((char)ax < *(char *)((char *)&arg_2 + 0)) {
        do {
            es = (int)(*(long *)((char *)&loc_30 + 42) >> 16);
            if (*(char far *)MK_FP(es, (int)*(long *)((char *)&loc_30 + 42)) != 0) {
                bx3 = *(int *)((char *)&loc_30 + 42);
                *(int *)((char *)&loc_30 + 42) = *(int *)((char *)&loc_30 + 42) + 1;
                t2 = far_b1ae0(*(char far *)MK_FP(es, bx3));
                ax2 = t2;
                dx2 = UNDEF;
            } else {
                t3 = far_b1ae0(32);
                ax2 = t3;
                dx2 = UNDEF;
            }
            loc_30[47] = (char)(loc_30[47] + 1);
            ax = ((char)(ax2 >> 8) << 8 | (unsigned char)loc_30[47]);
        } while ((char)ax < *(char *)((char *)&arg_2 + 0));
    }
    return ((long)dx2 << 16 | (unsigned)ax);
}
