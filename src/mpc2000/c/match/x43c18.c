extern int C1_W_08B04;
extern int C1_W_08B06;
extern char far *C1_W_08B08;
extern int C1_W_08B0A;
void __far fn_4323E(int, char far *);

void __far __fastcall __loadds cant_find_file_skip(void)
{
	C1_W_08B08[C1_W_08B04 * 17] = 0;
	fn_4323E(C1_W_08B06, C1_W_08B08);
}
