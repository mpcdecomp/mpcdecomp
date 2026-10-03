/* differs: 150 size 102, image 188; +0 image `push bp` CL `enter 4, 0`; 172 size 102, image 188; +0 image `push bp` CL `enter 4, 0` */
extern char P_4CF9[1];
extern char P_9D89;
extern char STR_DB_2[1];
void __far __pascal cmd_caller_setup(int, int, char far *);
void __far __pascal cmd_dispatch_1E(int, int, char far *);
void __far __pascal draw_signed_value(int, int, long, int);

void __far __pascal cmd_dispatch_handler_3(int p1, int p0)
{
	int si_;
	int di_;

	if (P_9D89 + 0xd <= 0) {
		di_ = p1;
		si_ = p0;
		cmd_caller_setup(di_, si_ + 1, P_4CF9);
	} else {
		di_ = p1;
		si_ = p0;
		draw_signed_value(di_, si_, (long)(P_9D89 * 6), 2);
	}
	cmd_dispatch_1E(di_ + 0x12, si_, STR_DB_2);
}
