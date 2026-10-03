/* differs: 150 size 122, image 118; +1B image `ja +70` CL `ja +73`; 172 size 122, image 118; +1B image `ja +70` CL `ja +73` */
extern char far *PTR_TRACK_DATA;
extern char TBL_FX_BUS_LABELS[1];
void __far __pascal cmd_build_params(int, int, int, int, int);
void __far __pascal cmd_dispatch_1E(int, int, char far *);
char far * __far __pascal note_range_clamp(int);

void __far __pascal note_range_calc_cmd(int p1, int p0)
{
	int l6;
	char far *l10;
	int di_;
	char far *v0;

	l6 = PTR_TRACK_DATA[p0];
	if ((unsigned)(l6 - 0x23) > 0x3f) goto br_06ECC;
	di_ = p1;
	v0 = note_range_clamp(l6);
	cmd_build_params(0x12, di_ + 7, -((v0[4] + 2) / 3 - 0x31), 4, (v0[4] + 2) / 3);
	cmd_dispatch_1E(di_, 3, l10[5] * 3 + TBL_FX_BUS_LABELS);
br_06ECC:
	;
}
