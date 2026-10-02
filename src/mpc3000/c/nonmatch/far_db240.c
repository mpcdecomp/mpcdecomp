/* differs: 308 at +3, 60 bytes; 311 at +3, 60 bytes; 312 at +3, 60 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern char B_9057;
extern char B_9058;
extern long far far_dea12(int, char far *, int, int, int, int);

void far far_db240(int arg_0, int arg_2)
{
    char loc_6;
    int loc_5;
    char loc_3;
    char loc_2[2];
    int ax;
    int ax2;
    int p4;
    int p6;
    int p8;
    long t1;

    ax = arg_2 << 1;
    loc_6 = (char)-88;
    loc_5 = ((char)(ax >> 8) << 8 | (unsigned char)((unsigned int)(char)ax >> 1));
    ax2 = (B_9058 << 8 | (unsigned char)B_9057);
    loc_3 = (char)ax2;
    loc_2[0] = (char)(ax2 >> 8);
    t1 = far_dea12(arg_0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 5, p8, p6, p4);
    return;
}
