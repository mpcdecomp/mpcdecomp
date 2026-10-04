/* differs: 150 size 24, image 38; +0 image `call +F3E` CL `enter 2, 0`; 172 size 24, image 38; +0 image `call +F3E` CL `enter 2, 0` */
extern char G_SAMPLE_MODE_PREV;
void __near X_0769E(void);
void __far cmd_far_stub2(void);
void __near fn_0761C(void);
void __near fn_076E2(void);
void __near lcd_block_copy(void);

int __near midi_port_read2(void)
{
	char l1;

	X_0769E();
	goto br_06775;
	fn_076E2();
	goto br_06775;
	lcd_block_copy();
	goto br_06775;
	fn_0761C();
br_06775:
	G_SAMPLE_MODE_PREV = l1;
	cmd_far_stub2();
	return 1;
}
