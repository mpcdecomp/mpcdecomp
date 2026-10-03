/* differs: 150 size 180, image 178; +1 image `enter 0x5e, 0` CL `enter 0x5c, 0`; 172 size 180, image 178; +1 image `enter 0x5e, 0` CL `enter 0x5c, 0` */
struct s54 { char b[54]; };
extern int G_ERRNO;
void __far __pascal _memcpy_5(char far *, char far *);
int __far int2F_call_fn6(char far *, int);
int __far __pascal midi_calc_timing(int, int, int);
void __far __pascal sample_data_copy(char far *, char far *);
long __far __pascal sample_pool_add(struct s54);

int __near __pascal sample_block_copy(int p0)
{
	char l36[36];
	int l40;
	char l94[54];

	if (p0 == 2) {
		if (int2F_call_fn6(l36, 0x24) != 0x24) goto br_08F99;
		sample_data_copy(l94, l36);
	} else {
		if (p0 != 4) goto br_08FEE;
		if (int2F_call_fn6(&l40, 0x28) == 0x28) goto br_08FA2;
br_08F99:
		G_ERRNO = 4;
		goto lcd_screen_helper_8FF4;
br_08FA2:
		_memcpy_5(l94, &l40);
	}
	*(int *)(l36 + 34) = midi_calc_timing(*(int *)(l94 + 30), *(int *)(l94 + 28), l94[19]);
	switch (*(int *)(l36 + 34)) { case -1: goto lcd_screen_helper_8FF4; }
	*(int *)(l94 + 48) = *(int *)(l36 + 34);
	return (int)sample_pool_add(*(struct s54 *)l94);
br_08FEE:
	G_ERRNO = 5;
lcd_screen_helper_8FF4:
	return 0;
}
