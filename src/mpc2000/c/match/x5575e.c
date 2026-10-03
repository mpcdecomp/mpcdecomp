void __far far_55788(unsigned char, char);
char far * __far pgm_fx_reverb_ptr(int);

void __far far_5575E(unsigned char p0)
{
	if (p0 >= 4) goto br_55786;
	far_55788(p0, pgm_fx_reverb_ptr(p0)[1]);
br_55786:
	;
}
