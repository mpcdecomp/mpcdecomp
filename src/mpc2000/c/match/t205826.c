int __far __pascal int38_call_pair(long);
void __far smem_io_helper(void);

int __far __pascal smem_access_handler_2(long p0)
{
	volatile int l2;

	l2 = int38_call_pair(p0);
	smem_io_helper();
	if (l2 != -1)
		return 1;
	return 0;
}
