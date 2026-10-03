struct s2 { char b[2]; };
void __far flash_vpp_on(void);
struct s2 __far __pascal mem_op_wrapper_3(long);

struct s2 __far __pascal mem_op_handler(long p0)
{
	int l4;

L_01479:
	*(struct s2 *)&l4 = mem_op_wrapper_3(p0);
	if ((char)l4 & 8) goto L_01479;
	flash_vpp_on();
	return *(struct s2 *)&l4;
}
