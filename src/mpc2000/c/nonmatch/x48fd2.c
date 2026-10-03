/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */

int __far io_ctrl_setup(int p0)
{
	if (p0 <= -0x23) {
		return p0 / 4 + 0xf;
	}
	if (p0 <= -0x11) {
		return p0 / 2 + 0x19;
	}
	return p0 + 0x21;
}
