extern char C1_W_00EFA[1];
void __far handler_set_install(char far *);

void __far far_469A8(void)
{
	handler_set_install(C1_W_00EFA);
}
