#include "mpc2k.h"

void __far lcd_area_wrapper_1(long p0)
{
	lcd_clear_wrapper(p0, 0x96);
}
