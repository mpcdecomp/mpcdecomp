/* differs: XL v1.20 +16, 10 bytes */
extern char C1_B_0045A[1];
extern long C1_W_0045B;
void __far handler_set_install(char __near *);

void __far handler_install_one(char p0, long p1)
{
	C1_B_0045A[0] = p0;
	C1_W_0045B = p1;
	handler_set_install(C1_B_0045A);
}
