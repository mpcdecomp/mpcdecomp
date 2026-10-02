/* differs: 308 at +0, 77 bytes; 311 at +0, 77 bytes; 312 at +0, 77 bytes */
extern unsigned char B_7ACE;
extern unsigned char B_7ACF;
extern int W_7AD1;
extern int W_7AD3;

long near fn_d4f60(void)
{
    int ax;
    unsigned int ax2;
    int cx;
    int dx;

    ax = (B_7ACE * (unsigned char)(char)(cx >> 8) + (unsigned char)(char)(dx >> 8)) * B_7ACF + (unsigned char)(char)cx;
    ax2 = ax - 1 + W_7AD1;
    return ((long)(W_7AD3 + (ax2 < (unsigned int)(ax - 1))) << 16 | (unsigned)ax2);
}
