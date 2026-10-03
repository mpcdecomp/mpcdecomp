/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_W_0160E[1];
void __far handler_set_install(char far *);

void __far far_49ADA(void)
{
	handler_set_install(C2_W_0160E);
}
