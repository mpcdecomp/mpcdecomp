/* differs: 150 size 6, image 24; +5 image `pop di` CL `retf`; 172 size 6, image 24; +5 image `pop di` CL `retf` */
void __far err_msg_report(void);
void __far int2F_dispatch_10(void);
void __far smem_init_handler(void);

int __far tgt_0AA60(void)
{
	return smem_init_handler();
	int2F_dispatch_10();
	err_msg_report();
	return 0;
}
