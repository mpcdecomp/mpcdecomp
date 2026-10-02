/* differs: 308 absent; 311 at +3, 47 bytes; 312 at +3, 47 bytes */
#define UNDEF 0
extern long far far_fb71b(void);

int far far_d7aa3(char far *arg_0)
{
    int ax;

    ax = -1;
    if (*(int *)(0x12d8) != 0) {
        ax = (int)far_fb71b();
        if (!CC("s", UNDEF)) {
            *arg_0 = (char)UNDEF;
        }
    }
    return ax;
}
