extern char C1_W_00AD6[1];
extern long C1_W_08B0E;
void __far disp_request_flush(void);
void __far handler_set_install(char far *);

void __far far_44982(long p0)
{
	C1_W_08B0E = p0;
	handler_set_install(C1_W_00AD6);
	disp_request_flush();
}
