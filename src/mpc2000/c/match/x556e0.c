void __far far_5570A(unsigned char, char);
char far * __far pgm_fx_section_ptr(int);

void __far far_556E0(unsigned char p0)
{
	if (p0 >= 2) goto br_55708;
	far_5570A(p0, pgm_fx_section_ptr(p0)[69]);
br_55708:
	;
}
