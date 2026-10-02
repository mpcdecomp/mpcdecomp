/* differs: 308 at +0, 68 bytes; 311 at +0, 69 bytes; 312 at +0, 68 bytes */
extern char B_9C31;
extern char B_9C32;
extern char B_9C33;
extern char B_9C34;
extern char TBL_9C35[];
extern char TBL_9C67[];
extern char TBL_9C99[];
extern char TBL_9CCB[];
extern long far far_dcfb5(char far *, int, int, int);

void near fn_de3b8(void)
{
    int bx;
    unsigned int bx2;
    long t1;

    bx = bx2 >> 1;
    B_9C31 = (char)-128;
    B_9C32 = (char)0;
    B_9C33 = TBL_9CCB[bx];
    B_9C34 = TBL_9C99[bx];
    t1 = far_dcfb5((char far *)&B_9C31, 4, (TBL_9C35[bx] << 8 | (unsigned char)TBL_9C67[bx]), 0);
    return;
}
