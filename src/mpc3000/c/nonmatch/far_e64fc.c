/* differs: 308 at +5, 243 bytes; 311 at +5, 243 bytes; 312 at +5, 243 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_A7B0 {
    char f_0;
};
extern char TBL_A7AF[];
extern struct g_TBL_A7B0 TBL_A7B0;
extern long far far_e6cb9(int);
extern long far far_fa0c8(int, int, int);

long far far_e64fc(int arg_0)
{
    int loc_2;
    long loc_4;
    int loc_6;
    long loc_8;
    unsigned char loc_9;
    unsigned char loc_a;
    int ax;
    int ax2;
    int ax3;
    int dx;
    long t1;
    long t2;
    long t3;

    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    loc_6 = 0;
    *(int *)((char *)&loc_8 + 0) = 0;
    if (*(char *)((char *)&TBL_A7B0 + 0 + arg_0 * 0x1f4) == 0) {
        return 0L;
    }
    loc_9 = (unsigned char)0;
    for (;;) {
        ax = loc_9 << 1;
        ax2 = arg_0 * 0x1f4 + ax;
        if (*(char *)((char *)&TBL_A7B0 + 0 + ax2) != 0) {
            dx = ((char)(ax >> 8) << 8 | (unsigned char)TBL_A7AF[ax2]);
            loc_a = *(char *)((char *)&TBL_A7B0 + 0 + ax2);
            t1 = far_e6cb9((unsigned char)(char)dx);
            t2 = far_fa0c8(loc_a, (int)t1, (int)(t1 >> 16));
            *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + (int)t2;
            loc_2 = (int)(loc_4 + t2 >> 16);
            ax3 = loc_a;
            *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + ax3;
            loc_6 = (int)(loc_8 + (long)(int)ax3 >> 16);
            loc_9 = (unsigned char)(loc_9 + 1);
            if (loc_9 >= 249) {
                break;
            }
            continue;
        }
        break;
    }
    t3 = far_fa0c8(0x151, *(int *)((char *)&loc_8 + 0), loc_6);
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - ((int)t3 - 0x151);
    loc_2 = (int)(loc_4 - (t3 - 0x151L) >> 16);
    return loc_4;
}
