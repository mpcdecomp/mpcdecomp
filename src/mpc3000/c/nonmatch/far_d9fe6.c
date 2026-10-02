/* differs: 308 at +3, 492 bytes; 311 at +3, 494 bytes; 312 at +3, 494 bytes */
extern int W_71A2;
extern int W_71A4;
extern int W_71A6;
extern int W_71A8;
extern int W_71AA;
extern int W_71AC;
extern int W_71AE;
extern int W_71B0;
extern int W_71B2;
extern int W_71B4;
extern int W_71B6;
extern int W_71B8;
extern int W_71BA;
extern int W_71BC;
extern int W_71BE;
extern int W_71C0;
extern int W_71C2;
extern int W_71C4;
extern int W_71C6;
extern int W_71C8;
extern int W_71CA;
extern int W_71CC;
extern int W_71CE;
extern int W_71D0;
extern void near fn_da222(void);

void far far_d9fe6(int arg_0)
{
    int ax;
    int t1;

    outp(-0x3fff, (char)3);
    outpw(-0x3ffc, W_71A2);
    outp(-0x3ffa, (char)((char)W_71A4 | 48));
    outpw(-0x3ffe, W_71A6);
    outp(-0x3ff6, (char)89);
    fn_da222();
    if (arg_0 == 2) {
        outpw(96, 0);
        outpw(102, W_71B6);
        outpw(100, W_71B8);
        outpw(98, W_71BA);
        outpw(96, 0x100);
        outpw(102, W_71C0);
        outpw(100, W_71C2);
        outpw(98, 0x1000);
        outpw(96, 0x200);
        outpw(100, W_71BC);
        outpw(98, W_71BE);
        outpw(96, 0x700);
        outpw(108, 0);
        outpw(96, 16);
        outpw(102, W_71C4);
        outpw(100, W_71C6);
        outpw(98, W_71C8);
        outpw(96, 0x110);
        outpw(102, W_71CE);
        outpw(100, W_71D0);
        outpw(98, 0x1000);
        outpw(96, 0x210);
        outpw(100, W_71CA);
        outpw(98, W_71CC);
        outpw(96, 0x710);
        outpw(108, 0);
        ax = 88;
        outpw(104, ax);
    } else {
        outpw(96, 0);
        outpw(102, W_71A8);
        outpw(100, W_71AA);
        outpw(98, W_71AC);
        outpw(96, 0x100);
        outpw(102, W_71B2);
        outpw(100, W_71B4);
        outpw(98, 0x1000);
        outpw(96, 0x200);
        outpw(100, W_71AE);
        outpw(98, W_71B0);
        outpw(96, 0x700);
        outpw(108, 0);
        ax = 64;
        outpw(104, ax);
    }
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)inp(104));
    } while (((char)ax & -128) != 0);
    return;
}
void near fn_da222(void) { }
