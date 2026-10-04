/* differs: XL v1.20 +F, 8 bytes */
void __near __fastcall disp_list_op_2str(int, long, long);

void __far disp_message_window(long p0, long p2)
{
	disp_list_op_2str(0x18, p0, p2);
}
