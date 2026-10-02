/* differs: 308 at +0, 68 bytes; 311 at +0, 68 bytes; 312 at +0, 68 bytes */
extern char B_7FCF;
extern char B_A5C2;
extern char B_D5EB;
extern char B_D5ED;
extern char B_D60A;

void far far_eb739(void)
{
    int bx;
    int si;

    if ((((char)(bx >> 8) << 8 | (unsigned char)B_7FCF) & 2) == si && (B_A5C2 & 21) == 0 && (B_D60A == 0 || B_D60A == 16)) {
        B_D5EB = (char)1;
        B_D5ED = (char)1;
        B_D60A = (char)0;
    }
    return;
}
