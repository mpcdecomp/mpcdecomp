/* differs: 150 size 66, image 312; +F image `je +1E` CL `jne +26`; 172 size 66, image 312; +F image `je +1E` CL `jne +26` */
extern char P_9D40;
extern char SAMPLE_INPUT;
int __far L_00106(void);
void __near __pascal ctrl_port_18_write(int);
void __near fn_06786(void);
int __near fn_067C2(void);
void __far mpc_rate_caller(void);
void __near rec_arm_field(void);

void __far __fastcall __loadds lcd_port_handler(int a0)
{
	if (!P_9D40) goto br_07502;
	switch (fn_067C2()) { case 0: goto L_07515; }
	rec_arm_field();
	return;
br_07502:
	if (!SAMPLE_INPUT) goto L_07515;
	if (L_00106()) goto L_07515;
	fn_06786();
L_07515:
	mpc_rate_caller();
	ctrl_port_18_write(a0);
}
