/* differs: 150 size 134, image 126; +1B image `ja +77` CL `ja +80`; 172 size 134, image 126; +1B image `ja +77` CL `ja +80` */
extern char far *PTR_TRACK_DATA;
extern char P_2B6A[1];
extern char P_2B6C[1];
void __far __pascal cmd_build_params(int, int, int, int, int);
void __far __pascal cmd_caller_setup(int, int, int, int);
char far * __far __pascal note_clamp_flag(int);

void __far __pascal note_pitch_calc_cmd(int p1, int p0)
{
	int l6;
	int di_;
	char far *v0;

	l6 = PTR_TRACK_DATA[p0];
	if ((unsigned)(l6 - 0x23) > 0x3f) goto br_06A7D;
	di_ = p1;
	v0 = note_clamp_flag(l6);
	cmd_build_params(0x12, di_ + 7, -((*v0 + 2) / 3 - 0x31), 4, (*v0 + 2) / 3);
	cmd_caller_setup(di_, 1, *(int *)(P_2B6C + (v0[1] - 0x32) / 7 * 4), *(int *)(P_2B6A + (v0[1] - 0x32) / 7 * 4));
br_06A7D:
	;
}
