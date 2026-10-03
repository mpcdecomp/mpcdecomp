/* differs: 150 size 32, image 38; +0 image `push word ptr [0x9a6e]` CL `push ds`; 172 size 32, image 38; +0 image `push word ptr [0x9cb0]` CL `push ds` */
extern char SND_CURRENT[1];
void __far X_07C12(void);
void __far __pascal int44_wrapper(int);
void __far __fastcall __loadds trim_screen_enter(void);
void __far __pascal voice_buffer_init(long);
void __far zone_range_clamp(void);

void __far X_0860E(void)
{
	voice_buffer_init(SND_CURRENT);
	zone_range_clamp();
	X_07C12();
	int44_wrapper(0);
	trim_screen_enter();
}
