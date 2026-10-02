/* differs: 308 absent; 311 at +3, 82 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern char TBL_7D8E[];
extern char TBL_7D8F[];
extern long far far_d7805(int, void far *, int, int);

void far far_b2190(void)
{
    int loc_4;
    int loc_2;
    int bx;
    int dx;

    loc_2 = 0;
    loc_4 = 0;
    do {
        __movs2(MK_FP(SEG_DATA, loc_4 + 0x7ccf), MK_FP(SEG_DATA, 0x1d6a), 6);
        dx = (int)(far_d7805((loc_2 & 15) + 1, MK_FP(SEG_DATA, loc_4 + 0x7cd4), 2, 48) >> 16);
        bx = loc_4;
        TBL_7D8E[bx] = (char)((char)(loc_2 >> 4) + 65);
        TBL_7D8F[bx] = (char)0;
        loc_4 = loc_4 + 9;
        loc_2 = loc_2 + 1;
    } while (loc_4 != 0x240);
    return;
}
