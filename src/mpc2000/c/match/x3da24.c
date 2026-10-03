extern char P_64BC[1];
void __far handler_set_install(char far *);

void __near fn_3DA24(void)
{
	handler_set_install(P_64BC);
}
