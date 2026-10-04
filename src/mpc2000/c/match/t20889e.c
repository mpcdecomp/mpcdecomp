#include "mpc2krec.h"
typedef void (__far *FN)(void);
extern struct SND __far *SND_CURRENT;
extern long G_EDIT_FIELD_VAL;
extern char TRIM_LEN_FIX[1];
extern char LOOP_LEN_FIX[1];
int __far __pascal sample_check_active(struct SND __far *);
void __far __pascal ui_field_edit(long __far *, int, int, long, long, FN, FN);
void __far sample_data_far_2(void);
void __far __pascal sample_str_scan_1(void);
void __far __pascal sample_data_far_1(void);
void __far L_08B5E(void);

/* the START field's edit: its range and change handler follow TRIM and LOOP's length fixes */
void __far __pascal sample_active_check_1(int x, int y, FN draw)
{
	long max;
	long min;
	FN fn;

	if (!sample_check_active(SND_CURRENT)) {
		if (TRIM_LEN_FIX[0]) {
			max = SND_CURRENT->start - SND_CURRENT->end + SND_CURRENT->length;
			if (!LOOP_LEN_FIX[0]) {
				min = 0;
				fn = sample_data_far_2;
			} else {
				min = SND_CURRENT->start - SND_CURRENT->end + SND_CURRENT->loop;
				if (min < 0) min = 0;
				fn = (FN)sample_str_scan_1;
			}
		} else {
			max = SND_CURRENT->length;
			min = 0;
			if (!LOOP_LEN_FIX[0])
				fn = (FN)sample_data_far_1;
			else
				fn = L_08B5E;
		}
	} else {
		min = max = SND_CURRENT->start;
		fn = 0;
	}
	G_EDIT_FIELD_VAL = SND_CURRENT->start;
	ui_field_edit(&G_EDIT_FIELD_VAL, x, y, min, max, fn, draw);
}
