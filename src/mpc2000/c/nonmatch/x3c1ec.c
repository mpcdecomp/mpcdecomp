/* differs: XL v1.20 +1D, 11 bytes */
extern char C0_W_01274[1];
extern long FE_DESC;
extern long FE_VALUE;
void __far handler_set_install(char __near *);

void __near ui_field_engine_4100(long p0, long p2)
{
	FE_DESC = p0;
	FE_VALUE = p2;
	handler_set_install(C0_W_01274);
}
