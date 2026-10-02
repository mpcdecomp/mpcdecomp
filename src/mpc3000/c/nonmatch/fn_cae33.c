/* differs: 308 at +3, 82 bytes; 311 at +3, 82 bytes; 312 at +3, 82 bytes */
#define SEG_DATA _DS
#define UNDEF 0
int far fn_cae33(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_10, char arg_12)
{
    int ax;
    int di;
    int si;

    if (CC("<u", UNDEF)) {
        goto L1;
    }
    ax = (unsigned char)(char)__insn("int 0x40", (*(char *)((char *)&arg_0 + 0) << 8 | (unsigned char)arg_12), arg_2, (*(char *)((char *)&arg_8 + 0) << 8 | (unsigned char)*(char *)((char *)&arg_10 + 0)), (*(char *)((char *)&arg_6 + 0) << 8 | (unsigned char)0), si, di, arg_4, SEG_DATA);
    goto L2;
L1:
    ax = 0;
L2:
    return ax;
}
