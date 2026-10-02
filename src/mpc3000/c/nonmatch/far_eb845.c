/* differs: 308 at +3, 46 bytes; 311 at +3, 46 bytes; 312 at +3, 45 bytes */
extern char B_D60B;

void far far_eb845(int arg_0)
{
    _disable();
    B_D60B = (char)0;
    outp(246, (char)-74);
    if (arg_0 != 0) {
        outp(244, (char)10);
        outp(244, (char)26);
        B_D60B = (char)1;
    }
    _enable();
    return;
}
