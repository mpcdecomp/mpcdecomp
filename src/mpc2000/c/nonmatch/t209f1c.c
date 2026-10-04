/* differs: 150 size 6, image 26; +5 image `pop si` CL `retf`; 172 size 6, image 26; +5 image `pop si` CL `retf` */
void __far err_msg_report(void);
void __far int2F_dispatch_10(void);
void __far range_seq_caller(void);

int __far tgt_0A308(void)
{
	return range_seq_caller();
	int2F_dispatch_10();
	err_msg_report();
	return 0;
}
