/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_W_01336[1];
void __far handler_set_install(char far *);

void __far far_48A12(void)
{
	handler_set_install(C2_W_01336);
}
