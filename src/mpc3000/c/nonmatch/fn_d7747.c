/* differs: 308 at +0, 119 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_TBL_D5FF {
    char f_0;
    char f_1;
    char f_2;
    char f_3;
};
extern unsigned char B_7FCB;
extern struct g_TBL_D5FF TBL_D5FF;
extern unsigned char TBL_d7619[];

void near fn_d7747(void)
{
    int ax;
    int ax2;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(0xe055, (unsigned int)(unsigned)(TBL_d7619 + B_7FCB)));
    TBL_D5FF.f_0 = (char)(TBL_D5FF.f_0 + 1);
    if ((unsigned char)TBL_D5FF.f_0 >= (unsigned char)(char)ax) {
        TBL_D5FF.f_0 = (char)0;
        TBL_D5FF.f_1 = (char)(TBL_D5FF.f_1 + 1);
        if ((unsigned char)TBL_D5FF.f_1 >= 60) {
            TBL_D5FF.f_1 = (char)0;
            TBL_D5FF.f_2 = (char)(TBL_D5FF.f_2 + 1);
            if ((unsigned char)TBL_D5FF.f_2 >= 60) {
                TBL_D5FF.f_2 = (char)0;
                TBL_D5FF.f_3 = (char)(TBL_D5FF.f_3 + 1);
                if ((unsigned char)TBL_D5FF.f_3 >= 24) {
                    TBL_D5FF.f_3 = (char)0;
                }
            }
        }
    }
    return;
}
