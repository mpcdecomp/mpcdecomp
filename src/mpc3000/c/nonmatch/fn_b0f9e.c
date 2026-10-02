/* differs: 308 at +7, 83 bytes; 311 at +7, 83 bytes; 312 at +7, 83 bytes */
void far fn_b0f9e(char far *arg_0, int arg_2)
{
    char far *loc_4;
    int loc_2;

    loc_2 = arg_2;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&arg_0 + 0);
    while (*loc_4 == 32) {
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    }
    while (*loc_4 != 0) {
        arg_2 = ((char)(arg_2 >> 8) << 8 | (unsigned char)*loc_4);
        *arg_0 = (char)arg_2;
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
        *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
    }
    *arg_0 = (char)0;
    return;
}
