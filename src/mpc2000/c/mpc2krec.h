/* MPC2000 SYS and MPC2000XL for C/C++ 8.00c: the far-pointer macros and
   the records of the includes both images share. */
#ifndef MPC2KREC_H
#define MPC2KREC_H

#define UNDEF 0
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))

#pragma pack(1)
/* sound record from its name on, 36h bytes (sound_record.inc); the XL's
   has 12h bytes in front.  The 2K's 128 at DS:6C7Ah are a doubly linked
   list between the PTR_SAMPLE_DATA and PTR_DMA_STATE sentinels */
struct SND {
	char name[16];
	char name_nul;
	unsigned char level;		/* init 100 */
	char tune;
	unsigned char stereo;		/* 0 mono */
	long start;
	long end;
	long length;			/* rounded to a paragraph by the allocator */
	long loop;
	char field_24;			/* also read as a word, 400h */
	char field_25;
	unsigned rate;			/* 44100 */
	struct SND __far *next;
	struct SND __far *prev;
	int pool_idx;			/* SMEM_POOL index, 7FFFh none */
	int field_32;
	int field_34;
};

/* program mixer entry, 6 bytes */
struct PGM_MIX {
	unsigned char vol;
	unsigned char pan;
	unsigned char ivol;
	unsigned char iout;		/* low nibble output, bit 7 follow stereo */
	unsigned char fx_level;
	unsigned char fx_bus;		/* -- M1 M2 R1 R2 */
};

/* EB-16 multi-FX section, 48h bytes */
struct FXS {
	char field_00[5];
	unsigned char enable;
	char field_06[4];
	unsigned char field_0a[12];	/* to the ASIC register window */
	unsigned char mod_type;
	unsigned char field_17;
	unsigned char mod_speed;
	unsigned char mod_depth;
	char mod_feedback;
	unsigned char field_1b[5];
	unsigned char field_20[6];
	int field_26;
	int field_28;
	int field_2a;
	int field_2c;
	unsigned char field_2e;
	unsigned char field_2f;
	unsigned char echo_type;
	char echo_lr_ofs;
	int echo_delay;			/* ms, 0..29Eh */
	int echo_delay2;		/* ms, 0..14Fh when echo_type is 2 */
	unsigned char echo_feedback;
	unsigned char echo_hfdamp;
	int field_38;
	unsigned char field_3a;
	unsigned char field_3b;
	int field_3c;
	unsigned char field_3e[7];
	unsigned char field_45;
	unsigned char field_46;
	unsigned char field_47;
};

/* EB-16 reverb, 0Ch bytes */
struct FXR {
	unsigned char type;
	char field_01;
	int predelay;			/* ms */
	int field_04;
	int field_06;
	int field_08;
	unsigned char field_0a;
	char field_0b;
};

/* DSP/DMA voice parameter block, 2Ch bytes, one word a register group half */
struct DSPV {
	unsigned g0_lo, g0_hi, addr;
	unsigned g1_lo, g1_hi, addr2;
	unsigned g2_hi, g2_lo;
	unsigned g3_lo, g3_hi, g4_lo, g4_hi, g5_lo, g5_hi;
	unsigned g6_lo, g6_hi, g7_lo, g7_hi, g8_lo, g8_hi, g9_lo, g9_hi;
};
#pragma pack()

#endif
