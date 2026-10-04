/* differs: XL v1.20 +10, 16 bytes */
extern char C2_B_WAVE_MEM_ERR_MASK;
extern char C2_W_062C4[1];
extern long C2_W_08DB8;
void __far handler_set_install(char __near *);

void __far X_54E74(long p0)
{
	C2_W_08DB8 = p0;
	handler_set_install(C2_W_062C4);
	C2_B_WAVE_MEM_ERR_MASK = 0;
}
