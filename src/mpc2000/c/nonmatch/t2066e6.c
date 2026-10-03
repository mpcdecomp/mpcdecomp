/* differs: 150 +1 image `enter 6, 0` CL `enter 8, 0`; 172 +1 image `enter 6, 0` CL `enter 8, 0` */
extern char far *PTR_TRACK_DATA;
void __far __pascal note_clamp_multi(int, int, int);
char far * __far __pascal note_range_clamp(int);

void __far __pascal note_range_calc_1(int p0)
{
	int l6;
	int si_;
	char far *v0;

	si_ = PTR_TRACK_DATA[p0];
	if ((unsigned)(si_ - 0x23) > 0x3f) goto br_06B1B;
	v0 = note_range_clamp(si_);
	l6 = (*(v0 + 2) + 2) / 3;
	if (l6 >= 0x22) goto br_06B1B;
	*(v0 + 2) = *(char *)&l6 * 3 + 1;
	note_clamp_multi(5, p0, *(v0 + 2));
br_06B1B:
	;
}
