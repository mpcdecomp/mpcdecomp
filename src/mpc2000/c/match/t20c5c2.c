void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
#pragma intrinsic(_fmemcpy)
int __far __pascal bcd_display_calc(char far *, int);
int __far __pascal ctrl_port_48_B8_3(char far *);
int __far __pascal ctrl_port_48_read(char far *, int);
int __far __pascal envelope_process_2(char far *);
int __far __pascal smem_ctrl_setup_2(char far *, int);

int __far __pascal pgm_file_write(char far *p0)
{
	char l30[30];

	_fmemcpy((char far *)l30, p0, 0x1e);
	l30[29] = 0x23;
	*(int *)l30 = 0x1e;
	switch (bcd_display_calc(l30, 0x1e)) { case 0: goto br_0CA82; }
	switch (ctrl_port_48_B8_3(p0)) { case 0: goto br_0CA82; }
	switch (smem_ctrl_setup_2(p0 + 0x75e, 0x40)) { case 0: goto br_0CA82; }
	switch (ctrl_port_48_read(p0 + 0x8de, 0x40)) { case 0: goto br_0CA82; }
	switch (envelope_process_2(p0)) { case 0: goto br_0CA82; }
	return 1;
br_0CA82:
	return 0;
}
