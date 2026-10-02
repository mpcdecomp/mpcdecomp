/* differs: 308 at +0, 134 bytes; 311 at +0, 135 bytes; 312 at +0, 135 bytes */
#define UNDEF 0
extern void near fn_f98ca(void);

long near fn_f989c(void)
{
    unsigned int ax;
    int ax2;
    int ax3;
    int cx;
    int cx2;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int p2;
    int t1;

    dx = ((char)(dx2 >> 8) << 8 | (unsigned char)(4 - (char)cx));
    dx3 = ((char)(dx >> 8) << 8 | (unsigned char)((char)dx << 1));
    dx4 = ((char)(dx3 >> 8) << 8 | (unsigned char)((char)dx3 << 1));
    ax = ax2 << (unsigned char)(char)dx4;
    cx2 = cx;
    while ((char)cx2 != 0) {
        p2 = cx2;
        ax3 = ax << 4 | ax >> 12;
        fn_f98ca();
        dx4 = UNDEF;
        ax = ax3;
        cx2 = ((char)(p2 >> 8) << 8 | (unsigned char)((char)p2 - 1));
    }
    return ((long)dx4 << 16 | (unsigned)ax);
}
void near fn_f98ca(void) { }
