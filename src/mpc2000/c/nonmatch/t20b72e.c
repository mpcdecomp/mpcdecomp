/* differs: 150 size 60, image 56; +0 image `lcall 0, 0x1e22` CL `enter 2, 0`; 172 size 60, image 56; +0 image `lcall 0, 0x1e22` CL `enter 2, 0` */
extern char G_SMEM_STATE_B;
extern char P_63B9[1];
extern char TBL_6459[1];
int __far int2F_call_fn5(void);
void __far int2F_dispatch_10(void);
void __far __pascal sample_io_handler(char far *, char far *, int);

int __far L_0BB66(void)
{
	int l18;

	int2F_call_fn5();
	sample_io_handler(&l18, P_63B9, 0xa0);
	if (!G_SMEM_STATE_B) goto br_0BB93;
	sample_io_handler(&l18, TBL_6459, 0x60);
br_0BB93:
	int2F_dispatch_10();
	return 1;
}
