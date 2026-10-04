/* differs: 150 size 280, image 273; +0 image `mov ax, 7` CL `push si`; 172 +0 image `mov ax, 7` CL `push si` */
extern int SMEM_SIZE;
extern int SMEM_SIZE_HI;
extern int W_9D1E;
void __far __fastcall port_c2_write(int);
int __far __pascal smem_alloc(int, int);
int __near __pascal smem_block_init(int, int, int, int, int);

int __far X_0260F(void)
{
	int si_;

	port_c2_write(7);
	switch (smem_block_init(1, 0, 0x10, 0x10, 0x1001)) { case 0: goto br_02630; }
	si_ = 0x10;
	goto br_026FF;
br_02630:
	port_c2_write(5);
	switch (smem_block_init(1, 0, 0x10, 0xa, 0x1001)) { case 0: goto br_02654; }
loop_0264A:
	si_ = W_9D1E;
	si_ += 0xa;
	goto br_026FF;
br_02654:
	port_c2_write(2);
	if (smem_block_init(1, 0, 0x10, 0xa, 0x1001)) goto loop_0264A;
	port_c2_write(6);
	switch (smem_block_init(1, 0, 0x10, 8, 0x1001)) { case 0: goto br_02692; }
loop_02688:
	si_ = W_9D1E;
	si_ += 8;
	goto br_026FF;
br_02692:
	port_c2_write(4);
	if (smem_block_init(1, 0, 0x10, 8, 0x1001)) goto loop_02688;
	port_c2_write(3);
	switch (smem_block_init(1, 0, 0x10, 4, 0x1001)) { case 0: goto br_026D0; }
	si_ = W_9D1E;
	si_ += 4;
	goto br_026FF;
br_026D0:
	port_c2_write(1);
	switch (smem_block_init(1, 0, 0x10, 2, 0x1001)) { case 0: goto br_026F4; }
	si_ = W_9D1E;
	si_ += 2;
	goto br_026FF;
br_026F4:
	port_c2_write(0);
	si_ = W_9D1E;
br_026FF:
	SMEM_SIZE = 0;
	SMEM_SIZE_HI = si_ << 4;
	if (!si_) goto L_0271B;
	smem_alloc(1, 0x2680);
L_0271B:
	return si_;
}
