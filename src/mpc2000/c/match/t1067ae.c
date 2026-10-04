#include "mpc2k.h"


int __near io_near_stub(void)
{
	char l1;

	l1 = G_SAMPLE_MODE;
	if (G_SAMPLE_MODE == G_SAMPLE_MODE_PREV) {
		return 0;
	}
	switch (l1) { case 0: goto br_06772; case 1: goto midi_port_read2; case 2: goto br_06766; case 3: goto br_0676C; }
	G_ERRNO = ERR_INTERNAL;
	err_msg_report();
	goto br_06772;
midi_port_read2:
	X_0769E();
	goto br_06775;
br_06766:
	fn_076E2();
	goto br_06775;
br_0676C:
	lcd_block_copy();
	goto br_06775;
br_06772:
	fn_0761C();
br_06775:
	G_SAMPLE_MODE_PREV = l1;
	cmd_far_stub2();
	return 1;
}
