struct s2 { char b[2]; };
void __far __pascal io_delay_wait2(long);
struct s2 __far __pascal mem_op_handler(long);
void __far __pascal mem_op_wrapper_4(long, long, int);
void __far __pascal mem_op_wrapper_5(long, int);

int __far __pascal system_call_handler(long p3, long p1, int p0)
{
	int l4;
	int si_;

L_01525:
	*(struct s2 *)&l4 = mem_op_handler(p3);
	if (!((char)l4 & 2)) goto L_01525;
	if (!((char)l4 & 4)) goto L_01525;
	si_ = p0;
	mem_op_wrapper_4(p3, p1, si_);
	mem_op_wrapper_5(p3, si_);
	return io_delay_wait2(p3);
}
