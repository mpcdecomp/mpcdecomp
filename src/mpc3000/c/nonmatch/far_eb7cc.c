/* differs: 308 at +3, 172 bytes; 311 at +3, 172 bytes; 312 at +3, 172 bytes */
#define UNDEF 0
extern char B_7FD1;
extern char B_F762;
extern unsigned char TBL_eb82d[];
extern void far far_eb837(void);

long far far_eb7cc(unsigned int arg_0)
{
    int ax;
    int ax2;
    int dx;
    char t1;
    int t2;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)(inp(-0x3fef) | 64));
    dx = -0x3fef;
    outp(dx, (char)ax);
    B_7FD1 = (char)arg_0;
    if (arg_0 > 4) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(TBL_eb82d + (arg_0 << 1))) {
    case 0:
    case 1:
        break;
    case 2:
        t1 = inp(80);
        B_F762 = (char)6;
        goto L1;
    case 3:
        outp(246, (char)52);
        outp(240, (char)-95);
        outp(240, (char)1);
        B_F762 = (char)4;
        goto L1;
    case 4:
        B_F762 = (char)2;
L1:
        far_eb837();
        ax = ((char)(UNDEF >> 8) << 8 | (unsigned char)(inp(-0x3fef) & -65));
        dx = -0x3fef;
        outp(dx, (char)ax);
        break;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
void far far_eb837(void) { }
