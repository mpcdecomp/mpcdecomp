/* differs: 308 absent; 311 at +0, 78 bytes; 312 at +0, 78 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern int near fn_f93bd(void);
int near fn_f93bd(void) { return 0; }

int near fn_f948b(void)
{
    int ax;
    int ax2;
    int si;

    __movs1(MK_FP(SEG_DATA, (ax << 5) + 0x24d), MK_FP(SEG_DATA, si), 32);
    ax2 = fn_f93bd();
    if (CC(">=u", UNDEF)) {
        ax2 = (unsigned char)(char)ax2;
    } else {
        *(char *)0x1a = (char)(*(char *)0x1a - 1);
    }
    return ax2;
}
