/* differs: 150 size 42, image 56; +B image `or si, 0x20` CL `mov ax, si`; 172 size 42, image 56; +B image `or si, 0x20` CL `mov ax, si` */
void __far __fastcall delay_ticks(int);
int __far port_c0_read(void);
void __far __fastcall port_c0_write(int);

void __far far_000DE(void)
{
	int si_;

	si_ = port_c0_read();
	si_ &= -0x19;
	si_ |= 0x20;
	port_c0_write(si_);
	port_c0_write(si_ & 0xffdf);
	delay_ticks(0x5d);
}
