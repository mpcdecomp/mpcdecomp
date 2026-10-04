/* differs: 150 size 194, image 184; +7 image `mov si, word ptr [bp + 6]` CL `mov di, word ptr [bp + 6]`; 172 size 194, image 184; +7 image `mov si, word ptr [bp + 6]` CL `mov di, word ptr [bp + 6]` */
extern char far *PGM_CURRENT;
extern char far *PTR_TRACK_DATA;
extern char TBL_NOTE_GLYPHS[1];
void __far __pascal cmd_build_params(int, int, int, int, int);
void __far __pascal cmd_caller_setup(int, int, long);
char far * __far __pascal note_range_clamp(int);

void __far __pascal note_cmd_helper(int p1, int p0)
{
	char far *l4;
	int l6;
	int di_;
	char far *v0;

	di_ = PTR_TRACK_DATA[p0];
	if ((unsigned)(di_ - 0x23) > 0x3f) goto br_06CD6;
	l4 = note_range_clamp(di_);
	di_ = di_ * 29;
	v0 = *(long far *)(PGM_CURRENT + di_ + -985);
	cmd_build_params(0x12, p1 + 7, -((l4[2] + 2) / 3 - 0x31), 4, (l4[2] + 2) / 3);
	if (v0) {
		l6 = v0[19];
	} else {
		l6 = 1;
	}
	cmd_caller_setup(p1, 1, ((long *)TBL_NOTE_GLYPHS)[(l4[3] & 0xf) + l6 * 10]);
br_06CD6:
	;
}
