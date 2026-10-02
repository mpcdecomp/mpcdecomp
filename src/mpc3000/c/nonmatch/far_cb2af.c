/* differs: 308 at +38, 133 bytes; 311 at +38, 135 bytes; 312 at +38, 135 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_E421;
extern char B_E422;
extern char B_E423;
extern char B_E424;
extern char B_E425;
extern char B_E426;
extern char B_E427;
extern char B_E428;
extern char TBL_E42A[];
extern char TBL_E42D[];
extern int TBL_E430[];
extern char TBL_E43C[];
extern char TBL_E44C[];
extern char TBL_E44D[];
extern char TBL_E44E[];
extern char TBL_E44F[];
extern int far far_cb457(int);

void far far_cb2af(void)
{
    unsigned char loc_1;
    int ax;
    int ax2;

    B_E421 = (char)0;
    B_E422 = (char)2;
    B_E423 = (char)2;
    B_E424 = (char)2;
    B_E425 = (char)0;
    B_E426 = (char)13;
    B_E427 = (char)35;
    loc_1 = (unsigned char)0;
    do {
        ax = loc_1 << 2;
        TBL_E44C[ax] = (char)100;
        TBL_E44D[ax] = (char)50;
        TBL_E44E[ax] = (char)0;
        TBL_E44F[ax] = (char)9;
        loc_1 = (unsigned char)(loc_1 + 1);
    } while (loc_1 < 64);
    B_E428 = (char)0;
    loc_1 = (unsigned char)0;
    do {
        TBL_E42A[loc_1] = (char)0;
        TBL_E42D[loc_1] = (char)50;
        TBL_E430[loc_1] = loc_1 * 100 + 100;
        TBL_E43C[loc_1] = (char)0;
        loc_1 = (unsigned char)(loc_1 + 1);
    } while (loc_1 < 3);
    TBL_E42A[0] = (char)50;
    loc_1 = (unsigned char)0;
    do {
        ax2 = far_cb457(loc_1);
        loc_1 = (unsigned char)(loc_1 + 1);
    } while (loc_1 < 24);
    return;
}
int far far_cb457(int p0) { return 0; }
