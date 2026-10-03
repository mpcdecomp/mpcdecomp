/* differs: 150 size 102, image 104; +C image `je +52` CL `jne +1A`; 172 size 102, image 104; +C image `je +52` CL `jne +1A` */
extern char STR_NO_SOUND_PADDED[1];
extern char STR_OFF_PADDED[1];
extern char STR_ST_SUFFIX[1];
extern char STR_ST_SUFFIX_BLANK[1];
void __far __pascal cmd_dispatch_1E(int, int, char far *);
long __far far_078E4(void);

void __far __pascal timer_value_read_4(char far *p2, int p1, int p0)
{
	int di_;

	if (!far_078E4()) goto br_03A22;
	if (!p2) goto br_03A16;
	di_ = p1;
	cmd_dispatch_1E(di_, p0, p2);
	cmd_dispatch_1E(di_ + 0x60, p0, p2[19] ? STR_ST_SUFFIX : STR_ST_SUFFIX_BLANK);
	return;
br_03A16:
	cmd_dispatch_1E(p1, p0, STR_OFF_PADDED);
	return;
br_03A22:
	cmd_dispatch_1E(p1, p0, STR_NO_SOUND_PADDED);
}
