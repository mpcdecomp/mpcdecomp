/* differs: 150 +0 image `enter 2, 0` CL `push bp`; 172 +0 image `enter 2, 0` CL `push bp` */
int __far __pascal int38_call_pair(long);
void __far smem_io_helper(void);

int __far __pascal smem_access_handler_2(long p0)
{
	int l2;

	l2 = int38_call_pair(p0);
	smem_io_helper();
	if (l2 == -1) goto br_059B6;
	return 1;
br_059B6:
	return 0;
}
