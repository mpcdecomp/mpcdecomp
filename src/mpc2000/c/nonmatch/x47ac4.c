/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_W_01196[1];
void __far disp_request_flush(void);
void __far handler_set_install(char far *);

void __far tgt_47AC4(void)
{
	handler_set_install(C2_W_01196);
	disp_request_flush();
}
