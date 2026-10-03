#include "mpc2k.h"

void __far __pascal sysex_sub_dispatch(unsigned char far *msg, int len)
{
	unsigned i;

	if (msg[1] != 0x7e) return;
	if (msg[2] != SDS_EXCL_CH && msg[2] != 0x7f) return;
	switch (msg[3]) {
	case 1:
		if (len != 0x15) break;
		if ((*(unsigned char *)&SDS_STATE) & 2) break;
		if (msg[6] < 8) break;
		if (msg[6] > 0x15) break;
		(*(unsigned *)&SDS_RX_PACKET) = 0;
		if (lcd_clear_buffer(msg)) {
			field_edit_disable();
			int4A_proc_caller(0x7f);
			(*(unsigned char *)&SDS_STATE) |= 4;
		} else {
			int4A_proc_caller(0x7d);
		}
		cmd_far_stub2();
		return;
	case 2:
		if (len != 0x7f) break;
		if (!((*(unsigned char *)&SDS_STATE) & 4)) break;
		for (i = 0; i < SDS_PKT_WORDS; i++) {
			if (SDS_PKT_WORDS == 0x28)
				((unsigned *)BUF_XFER)[i] = msg[i * 3 + 7] >> 5 | msg[i * 3 + 5] << 9 | msg[i * 3 + 6] << 2;
			else
				((unsigned *)BUF_XFER)[i] = msg[i * 2 + 5] << 9 | msg[i * 2 + 6] << 2;
			((unsigned *)BUF_XFER)[i] += 0x8000;
		}
		flash_write_words(SDS_RX_ADDR, ((unsigned *)BUF_XFER), SDS_PKT_WORDS);
		SDS_RX_ADDR += SDS_PKT_WORDS;
		int4A_proc_caller(0x7f);
		if (++(*(unsigned *)&SDS_RX_PACKET) < SDS_PACKET_COUNT) break;
		(*(unsigned char *)&SDS_STATE) &= 0xfb;
		fn_0B53E();
		cmd_far_stub2();
		return;
	case 3:
		if (len != 7) break;
		if ((*(unsigned char *)&SDS_STATE) & 5) break;
		SDS_SAMPLE_NUM = msg[5] << 7 | msg[4];
		(*(unsigned char *)&SDS_STATE) |= 1;
		return;
	case 0x7c:
		if (len != 6) break;
		SDS_TX_TIMEOUT = 0xffff;
		return;
	case 0x7d:
		if (len != 6) break;
		if ((*(unsigned char *)&SDS_STATE) & 2) (*(unsigned char *)&SDS_STATE) &= 0xfd;
		if ((*(unsigned char *)&SDS_STATE) & 4) {
			(*(unsigned char *)&SDS_STATE) &= 0xfb;
			smem_free(SDS_RX_SND_SLOT);
		}
		cmd_far_stub2();
		midi_txrx_arm_field();
		return;
	case 0x7e:
		if (len != 6) break;
		if (!((*(unsigned char *)&SDS_STATE) & 2)) break;
		if (!(SDS_TX_PACKET - 1 & (msg[4] == 0x7f))) break;
		SDS_TX_ADDR -= 0x28;
		SDS_TX_PACKET = SDS_TX_PACKET - 1;
		SDS_TX_TIMEOUT = 0;
		break;
	case 0x7f:
		if (len != 6) break;
		if (!((*(unsigned char *)&SDS_STATE) & 2)) break;
		if (SDS_TX_PACKET && msg[4] != (unsigned char)(SDS_TX_PACKET - 1 & 0x7f)) break;
		SDS_TX_TIMEOUT = 0;
		break;
	}
}
