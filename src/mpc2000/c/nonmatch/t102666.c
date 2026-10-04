/* differs: 150 size 330, image 328; +4 image `mov cx, 3` CL `mov bx, 0x9adc`; 172 size 330, image 336; +4 image `mov cx, 3` CL `mov bx, 0x9d1e` */
void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern int SMEM_SIZE;
extern int SMEM_SIZE_HI;
extern char W_9D1E[1];
void __far __fastcall port_c2_write(int);
int __far __pascal smem_alloc(int, int);
int __near __pascal smem_block_init(long, long, int);
void __far string_copy_cmd(void);

int __far X_025D8(void)
{
	int si_;

	memset(W_9D1E, 0, 6);
	string_copy_cmd();
	port_c2_write(0);
	switch (smem_block_init(0x10000L, 0x100001L, 0x1001)) { case 0: goto X_0260F; }
	*(int *)W_9D1E = 1;
X_0260F:
	port_c2_write(7);
	switch (smem_block_init(0x10000L, 0x100010L, 0x1001)) { case 0: goto br_02630; }
	si_ = 0x10;
	goto br_026FF;
br_02630:
	port_c2_write(5);
	switch (smem_block_init(0x10000L, 0x10000aL, 0x1001)) { case 0: goto br_02654; }
loop_0264A:
	si_ = *(int *)W_9D1E;
	si_ += 0xa;
	goto br_026FF;
br_02654:
	port_c2_write(2);
	if (smem_block_init(0x10000L, 0x10000aL, 0x1001)) goto loop_0264A;
	port_c2_write(6);
	switch (smem_block_init(0x10000L, 0x100008L, 0x1001)) { case 0: goto br_02692; }
loop_02688:
	si_ = *(int *)W_9D1E;
	si_ += 8;
	goto br_026FF;
br_02692:
	port_c2_write(4);
	if (smem_block_init(0x10000L, 0x100008L, 0x1001)) goto loop_02688;
	port_c2_write(3);
	switch (smem_block_init(0x10000L, 0x100004L, 0x1001)) { case 0: goto br_026D0; }
	si_ = *(int *)W_9D1E;
	si_ += 4;
	goto br_026FF;
br_026D0:
	port_c2_write(1);
	switch (smem_block_init(0x10000L, 0x100002L, 0x1001)) { case 0: goto br_026F4; }
	si_ = *(int *)W_9D1E;
	si_ += 2;
	goto br_026FF;
br_026F4:
	port_c2_write(0);
	si_ = *(int *)W_9D1E;
br_026FF:
	SMEM_SIZE = 0;
	SMEM_SIZE_HI = si_ << 4;
	if (!si_) goto L_0271B;
	smem_alloc(1, 0x2680);
L_0271B:
	return si_;
}
