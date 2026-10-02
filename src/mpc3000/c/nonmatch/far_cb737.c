/* differs: 308 at +3, 35 bytes; 311 at +3, 35 bytes; 312 at +3, 35 bytes */
void far far_cb737(char arg_0)
{
    arg_0 = (char)(arg_0 & 15);
    outp(248, arg_0);
    outp(252, (char)0);
    outp(252, (char)1);
    return;
}
