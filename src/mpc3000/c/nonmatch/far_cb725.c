/* differs: 308 at +3, 29 bytes; 311 at +3, 29 bytes; 312 at +3, 29 bytes */
void far far_cb725(char arg_0)
{
    arg_0 = (char)(arg_0 & 7);
    outp(250, (char)(inp(250) & -8 | arg_0));
    return;
}
