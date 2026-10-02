/* differs: 308 at +0, 35 bytes; 311 at +0, 35 bytes; 312 at +0, 35 bytes */
#define UNDEF 0
void near fn_f95cf(void)
{
    unsigned int dx;

    __insn("popf", __flags(dx >> 1));
    if (CC("<u", UNDEF)) {
        return;
    }
    return;
}
