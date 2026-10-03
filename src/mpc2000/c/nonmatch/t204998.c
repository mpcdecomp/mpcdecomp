/* differs: 150 size 86, image 76; +3 image `push di` CL `mov al, byte ptr [bp + 6]`; 172 size 86, image 82; +3 image `push di` CL `mov al, byte ptr [bp + 6]` */
extern char P_4CF9[1];
extern char STR_DB[1];
void __far __pascal cmd_caller_setup(int, unsigned, char far *);
void __far __pascal cmd_dispatch_1E(int, int, char far *);
void __far __pascal draw_signed_value(char far *, long, int);

void __far __pascal cmd_dispatch_handler_2(char far *p1, char p0)
{
	if (p0 > 0xdb) {
		draw_signed_value(p1, (long)p0, 2);
	} else {
		cmd_caller_setup(((int *)&p1)[1], FP_OFF(p1 + 1), P_4CF9);
	}
	cmd_dispatch_1E(((int *)&p1)[1] + 0x12, *(int *)&p1, STR_DB);
}
