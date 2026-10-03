/* differs: 150 size 212, image 208; +2C image `jmp +C2` CL `jmp +C7`; 172 size 212, image 208; +2C image `jmp +C2` CL `jmp +C7` */
extern char far *SND_CURRENT;
extern char STR_ROM_3[1];
extern char STR_SND_3[1];
extern char TBL_OFF_ON_LABELS[1];
void __far __pascal cmd_dispatch_1E(int, int, char far *);
void __far __pascal cmd_exec_caller(long, long);
void __far cmd_ratio_calc(void);
void __far __pascal display_draw_coord(long, int, int);
void __far field_redraw(void);
void __far __pascal mode_dispatch_index(int, int);
int __far __pascal sample_check_active(char far *);
void __far __pascal timer_value_read_4(char far *, int, int);

void __far __fastcall __loadds X_0991C(void)
{
	timer_value_read_4(SND_CURRENT, 0x1a, 2);
	mode_dispatch_index(0xc7, 1);
	if (!SND_CURRENT) goto br_099DE;
	switch (sample_check_active(SND_CURRENT)) { case 0: goto L_09964; }
	cmd_dispatch_1E(2, 2, STR_ROM_3);
	display_draw_coord(*(long far *)(SND_CURRENT + 24) - *(long far *)(SND_CURRENT + 32), 0x14, 0xc);
	display_draw_coord(*(long far *)(SND_CURRENT + 32), 0x7a, 0xc);
	cmd_dispatch_1E(0xda, 0xc, SND_CURRENT[36] * 4 + TBL_OFF_ON_LABELS);
	cmd_exec_caller(*(long far *)(SND_CURRENT + 24) - *(long far *)(SND_CURRENT + 32), *(long far *)(SND_CURRENT + 24));
	goto br_099DE;
L_09964:
	cmd_dispatch_1E(2, 2, STR_SND_3);
	display_draw_coord(*(long far *)(SND_CURRENT + 24) - *(long far *)(SND_CURRENT + 32), 0x14, 0xc);
	display_draw_coord(*(long far *)(SND_CURRENT + 32), 0x7a, 0xc);
	cmd_dispatch_1E(0xda, 0xc, SND_CURRENT[36] * 4 + TBL_OFF_ON_LABELS);
	cmd_exec_caller(*(long far *)(SND_CURRENT + 24) - *(long far *)(SND_CURRENT + 32), *(long far *)(SND_CURRENT + 24));
br_099DE:
	field_redraw();
	cmd_ratio_calc();
}
