/* differs: 150 +3A image `mov al, byte ptr [bp - 6]` CL `push 1`; 172 +3A image `mov al, byte ptr [bp - 6]` CL `push 1` */
extern char far *PTR_TRACK_DATA;
char far * __far __pascal note_clamp_flag(int);
void __far __pascal note_clamp_multi(int, int, int);

void __far __pascal note_pitch_calc_1(int p0)
{
	int l6;
	int si_;
	char far *v0;

	si_ = PTR_TRACK_DATA[p0];
	if ((unsigned)(si_ - 0x23) > 0x3f) goto br_068D0;
	v0 = note_clamp_flag(si_);
	l6 = (*v0 + 2) / 3;
	if (l6 >= 0x22) goto br_068D0;
	*v0 = (char)l6 * 3 + 1;
	note_clamp_multi(1, p0, *v0);
br_068D0:
	;
}
