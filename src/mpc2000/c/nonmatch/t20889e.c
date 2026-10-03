/* differs: 150 size 276, image 294; +1 image `enter 0x10, 0` CL `enter 0xc, 0`; 172 size 276, image 294; +1 image `enter 0x10, 0` CL `enter 0xc, 0` */
extern char G_EDIT_FIELD_VAL[1];
extern char LOOP_LEN_FIX;
extern char SAMPLE_DATA_FAR_1[1];
extern char SAMPLE_STR_SCAN_1[1];
extern char far *SND_CURRENT;
extern char TRIM_LEN_FIX;
void __far L_08B5E(void);
void __far sample_data_far_1(void);
void __far sample_data_far_2(void);
void __far sample_str_scan_1(void);
int __far __pascal sample_check_active(char far *);
void __far __pascal ui_field_edit(char far *, long, long, long, char far *, long);

void __far __pascal sample_active_check_1(long p2, long p0)
{
	long l4;
	char far *l8;
	long l12;
	long l16;

	if (sample_check_active(SND_CURRENT)) goto br_08D4E;
	if (!TRIM_LEN_FIX) goto br_08D16;
	l16 = *(long far *)(SND_CURRENT + 20) - *(long far *)(SND_CURRENT + 24);
	l12 = l16 + *(long far *)(SND_CURRENT + 28);
	if (!LOOP_LEN_FIX) {
		l4 = 0L;
		l8 = sample_data_far_2;
	} else {
		l4 = l16 + *(long far *)(SND_CURRENT + 32);
		if (l4 >= 0L) goto br_08D0A;
		l4 = 0L;
br_08D0A:
		l8 = sample_str_scan_1;
		goto L_08D6E;
br_08D16:
		l12 = *(long far *)(SND_CURRENT + 28);
		l4 = 0L;
		if (!LOOP_LEN_FIX) {
			l8 = sample_data_far_1;
		} else {
			l8 = L_08B5E;
			goto L_08D6E;
br_08D4E:
			l12 = *(long far *)(SND_CURRENT + 20);
			l4 = l12;
			l8 = 0L;
		}
	}
L_08D6E:
	*(long *)G_EDIT_FIELD_VAL = *(long far *)(SND_CURRENT + 20);
	ui_field_edit(G_EDIT_FIELD_VAL, p2, l4, l12, l8, p0);
}
