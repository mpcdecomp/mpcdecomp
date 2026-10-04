/* differs: XL v1.20 +0, 43 bytes */
extern char C0_B_0D7BC;
char far * __far ivt_get_vector(int);

char far * __far pgm_fx_section_ptr(int p0)
{
	int si_;

	if (p0 < 2) goto br_3F6CE;
	si_ = 0;
br_3F6CE:
	return ivt_get_vector(C0_B_0D7BC + 0x5c) + si_ * 0x48 + 0x8de;
}
