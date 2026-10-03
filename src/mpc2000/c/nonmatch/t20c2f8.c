/* differs: 150 size 226, image 84; +54 image `jmp +D9` CL `lea ax, [bp - 2]`; 172 size 226, image 84; +54 image `jmp +D9` CL `lea ax, [bp - 2]` */
#if FW_VERSION == 150
extern char B_9D5A[1];
extern char B_9D6F;
extern char P_8F78[1];
extern char P_9D5F[1];
extern char P_9DA0[1];
void __far __fstrncpy(char far *, char far *, int);
int __far __pascal bcd_display_calc(char far *, int);
int __far __pascal ctrl_port_48_B8(int);
int __far __pascal ctrl_port_48_read(char far *, int);
void __far int2F_dispatch_10(void);
int __far __pascal mem_block_process(long, int);
int __far sample_index_rebuild(void);
int __far smem_ctrl_setup_1(void);
int __far __pascal smem_ctrl_setup_2(char far *, int);

int __far __pascal smem_access_handler_3(char far *p0)
{
	char l2[2];
	int l4;
	int l6;
	long l10;
	int si_;

	l2[0] = 0xa;
	l2[1] = 4;
	si_ = sample_index_rebuild();
	l6 = 0x32;
	l4 = 0x40;
	l10 = p0;
	__fstrncpy(P_9D5F, p0, 0x10);
	B_9D6F = 0;
	switch (mem_block_process(l10, 0)) { case 0: goto br_0C809; }
	switch (bcd_display_calc(l2, 2)) { case 0: goto br_0C804; }
	switch (ctrl_port_48_B8(si_)) { case 0: goto br_0C804; }
	switch (bcd_display_calc(&l6, 2)) { case 0: goto br_0C804; }
	switch (bcd_display_calc(B_9D5A, 0x32)) { case 0: goto br_0C804; }
	switch (bcd_display_calc(&l4, 2)) { case 0: goto br_0C804; }
	switch (smem_ctrl_setup_2(P_9DA0, l4)) { case 0: goto br_0C804; }
	switch (ctrl_port_48_read(P_8F78, 0x40)) { case 0: goto br_0C804; }
	switch (smem_ctrl_setup_1()) { case 0: goto br_0C804; }
	int2F_dispatch_10();
	return 1;
br_0C804:
	int2F_dispatch_10();
br_0C809:
	return 0;
}
#else
extern char B_9D5A[1];
extern char B_9D6F;
extern char P_8F78[1];
extern char P_9D5F[1];
extern char P_9DA0[1];
void __far __fstrncpy(char far *, char far *, int);
int __far __pascal bcd_display_calc(char far *, int);
int __far __pascal ctrl_port_48_B8(int);
int __far __pascal ctrl_port_48_read(char far *, int);
void __far int2F_dispatch_10(void);
int __far __pascal mem_block_process(long, int);
int __far sample_index_rebuild(void);
int __far smem_ctrl_setup_1(void);
int __far __pascal smem_ctrl_setup_2(char far *, int);

int __far __pascal smem_access_handler_3(char far *p0)
{
	char l2[2];
	int l4;
	int l6;
	long l10;
	int si_;

	l2[0] = 0xa;
	l2[1] = 4;
	si_ = sample_index_rebuild();
	l6 = 0x33;
	l4 = 0x40;
	l10 = p0;
	__fstrncpy(P_9D5F, p0, 0x10);
	B_9D6F = 0;
	switch (mem_block_process(l10, 0)) { case 0: goto br_0C809; }
	switch (bcd_display_calc(l2, 2)) { case 0: goto br_0C804; }
	switch (ctrl_port_48_B8(si_)) { case 0: goto br_0C804; }
	switch (bcd_display_calc(&l6, 2)) { case 0: goto br_0C804; }
	switch (bcd_display_calc(B_9D5A, 0x33)) { case 0: goto br_0C804; }
	switch (bcd_display_calc(&l4, 2)) { case 0: goto br_0C804; }
	switch (smem_ctrl_setup_2(P_9DA0, l4)) { case 0: goto br_0C804; }
	switch (ctrl_port_48_read(P_8F78, 0x40)) { case 0: goto br_0C804; }
	switch (smem_ctrl_setup_1()) { case 0: goto br_0C804; }
	int2F_dispatch_10();
	return 1;
br_0C804:
	int2F_dispatch_10();
br_0C809:
	return 0;
}
#endif
