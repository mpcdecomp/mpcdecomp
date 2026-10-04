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
/* a section the ASIC's index window must not be interrupted in: the flags
   saved around a _disable(), so a caller with interrupts off keeps them off */
#define PUSHF() _asm pushf
#define POPF() _asm popf

/* ports.inc */
#define DMA_CTRL	0x80	/* (group << 8) | voice */
#define DMA_DATA_LO	0x82
#define DMA_DATA_HI	0x84
#define DMA_ADDR_HI	0x86
#define DMA_STATUS	0x88
#define DMA_STATUS2	0x8A
#define DMA_MODE	0x8C
#define DMA_GROUP(g)	((g) << 8)
#define DMA_ST_BUSY	0x80
#define DMA_ST_GO	0x100
#define ASIC_DATA	0xA0
#define ASIC_REG	0xA2
#define FLASH_CTL	0xC0
#define FLASH_CTL_VPP	0x01
#define FLASH_CTL_ENABLE 0x02
#define PORT_C2		0xC2
#define PORT_C002	0xC002
#define ASIC_DMA_MODE	0xC030
#define ASIC_DMA_C031	0xC031
#define ASIC_DMA_COUNT	0xC032	/* byte count minus one */
#define ASIC_DMA_ADDR	0xC034
#define ASIC_DMA_ADDR_HI 0xC036
#define ASIC_DMA_C038	0xC038
#define ASIC_DMA_DIR	0xC039
#define ASIC_DMA_C03A	0xC03A
#define ASIC_DMA_STATUS	0xC03B
#define ASIC_DMA_C03F	0xC03F

/* flash.inc: the 28F016SA */
#define FLASH_CMD_READ_ARRAY	0xFF
#define FLASH_CMD_READ_ID	0x90
#define FLASH_CMD_READ_STATUS	0x70
#define FLASH_CMD_READ_XSTATUS	0x71
#define FLASH_CMD_CLEAR_STATUS	0x50
#define FLASH_CMD_ERASE		0x20
#define FLASH_CMD_CONFIRM	0xD0
#define FLASH_CMD_PAGE_WRITE	0xE0
#define FLASH_CMD_PAGE_COMMIT	0x0C
#define FLASH_SR_READY		0x80
#define FLASH_SR_ERASE_ERR	0x20
#define FLASH_SR_PROGRAM_ERR	0x10
#define FLASH_SR_ERRORS		0x78
#define FLASH_ID_INTEL		0x89
#define FLASH_ID_28F016SA	0x66A0

/* midi.inc */
#define MS_NOTE_OFF	0x80
#define MS_NOTE_ON	0x90
#define MS_POLY_PRESSURE 0xA0
#define MS_CONTROL	0xB0
#define MS_PROGRAM	0xC0
#define MS_CHAN_PRESSURE 0xD0
#define MS_PITCH_BEND	0xE0
#define MS_STATUS_MASK	0xF0
#define MS_CHAN_MASK	0x0F
#define MS_DATA_MASK	0x7F
#define MS_SYSEX	0xF0
#define MS_EOX		0xF7
#define MCC_VOLUME	0x07
#define MCC_ALL_SOUND_OFF 0x78
#define MCC_RESET_CTRLS	0x79
#define MCC_ALL_NOTES_OFF 0x7B
#define MCC_OMNI_OFF	0x7C
#define MCC_OMNI_ON	0x7D
#define MCC_MONO_ON	0x7E
#define MCC_POLY_ON	0x7F
#define SYSEX_NONRT	0x7E
#define SYSEX_ALL_DEVICES 0x7F
#define SDS_DUMP_HEADER	0x01
#define SDS_DATA_PACKET	0x02
#define SDS_DUMP_REQUEST 0x03
#define SDS_WAIT	0x7C
#define SDS_CANCEL	0x7D
#define SDS_NAK		0x7E
#define SDS_ACK		0x7F
#define SDS_HEADER_LEN	21
#define SDS_PACKET_LEN	127
#define SDS_REQUEST_LEN	7
#define SDS_HANDSHAKE_LEN 6
#define SDS_WORDS_3BYTE	40
#define SDS_WORDS_2BYTE	60
#define SYSEX_DEVICE	2
#define SYSEX_SUB_ID	3
#define SDS_MSG_PACKET	4
#define SDS_MSG_SAMPLE	4
#define SDS_HDR_BITS	6
#define SDS_HDR_PERIOD	7
#define SDS_HDR_LENGTH	0x0A
#define SDS_HDR_LOOP_START 0x0D
#define SDS_HDR_LOOP_END 0x10
#define SDS_HDR_LOOP_TYPE 0x13
#define SDS_ST_SEND	1
#define SDS_ST_TX	2
#define SDS_ST_RX	4
#define SDS_ST_BUSY	(SDS_ST_SEND | SDS_ST_TX | SDS_ST_RX)
#define MIDI_7BIT3(p)	((unsigned long)(p)[2] << 14 | (unsigned)((p)[1] << 7 | (p)[0]))

/* fx_record.inc: FXS sections bits, sys_data.inc counts */
#define FXS_SEC_DIST	0x20
#define FXS_SEC_FILTER	0x10
#define FXS_SEC_MOD	0x08
#define FXS_SEC_ECHO	0x04
#define FXS_SEC_REVERB	0x02
#define FXS_SEC_MIX	0x01
#define FXS_ECHO_DELAY_MAX 0x29E	/* 670 ms */
#define FXS_ECHO_DELAY2_MAX 0x14F	/* echo_type 2 */
#define FX_TYPE_COUNT	4	/* MULTI FX1, MULTI FX2, REVERB 1, REVERB 2 */
#define FX_MULTI_COUNT	2	/* below it an FXS, from it an FXR */
#define FX_MOD_PITCH_FDBK 6
#define FX_SECTION_COUNT 10
#define FX_MOD_TYPE_COUNT 7
#define FX_PAN_COUNT	4
#define FX_OUT_MODE_COUNT 4
#define FX_REVERB_COUNT	7
#define FX_ROUTE_COUNT	3
#define FX_OUT_PAIR_COUNT 5

/* window_macros.inc */
#define WIN_K_F1	0x02
#define WIN_K_F2	0x03
#define WIN_K_F3	0x04
#define WIN_K_F4	0x05
#define WIN_K_F5	0x06
#define WIN_K_F6	0x07
#define WIN_K_OPEN	0x15
#define WIN_K_LEFT	0x16
#define WIN_K_RIGHT	0x17
#define WIN_K_UP	0x18
#define WIN_K_DOWN	0x19
#define WIN_K_PAINT	0x32	/* enter / repaint */
#define WIN_K_REFRESH	0x34
#define WIN_K_PAD	0x37
#define WIN_K_END_ALL	0xFF
#define SK_PLAIN	0
#define SK_BOX		1
#define SK_FILL		2
#define SK_BLANK	3
#define WIN_RECT_DIALOG	0x0c, 2, 0xe0, 0x3a
#define WIN_RECT_CONFIRM 0x30, 6, 0xc3, 0x36
#define WIN_RECT_ALERT	0x10, 2, 0xd8, 0x3a

/* dspv.inc */
#define DSPV_VOICES	32
#define DSPV_ALL_FIELDS	0x7FFF
#define DSPV_F_ADDR	0x0001
#define DSPV_F_G0	0x0002
#define DSPV_F_G1_LO	0x0004
#define DSPV_F_G4_LO	0x0008
#define DSPV_F_G4_HI	0x0010
#define DSPV_F_G6_LO	0x0020
#define DSPV_F_G6_HI	0x0040
#define DSPV_F_G5	0x0080
#define DSPV_F_G3	0x0100
#define DSPV_F_G7_LO	0x0200
#define DSPV_F_G7_HI	0x0400
#define DSPV_F_G2	0x0800
#define DSPV_F_G1_HI	0x1000
#define DSPV_F_G8	0x2000
#define DSPV_F_G9	0x4000
#define VOICE_MON_L	0x15
#define VOICE_MON_R	0x17

#define PARA_ROUND(n)	((n) + 15 & ~15L)
#define XY(x, y)	(((long)(y) << 16) | (x))
#define LO_WORD(l)	((unsigned)(l))
#define HI_WORD(l)	((unsigned)((unsigned long)(l) >> 16))
typedef void (__far *VFN)(void);

/* the 2K SYS: sys_data.inc: G_ERRNO, the error message index */
enum {
	ERR_UNKNOWN, ERR_NO_MEMORY, ERR_DISK_READ, ERR_DISK_WRITE, ERR_FILE_DAMAGED,
	ERR_INTERNAL, ERR_NEWER_OS, ERR_UNKNOWN_FILE_TYPE, ERR_NAME_IN_USE,
	ERR_SOUND_DIR_FULL, ERR_PROG_DIR_FULL, ERR_NO_DIGITAL_CARRIER, ERR_CANT_OPEN,
	ERR_FILE_EXISTS, ERR_CANT_REMOVE, ERR_WRITE_PROTECTED, ERR_NO_DISK_SPACE,
	ERR_WRONG_DISK_FORMAT, ERR_UNKNOWN_FILE_FORMAT, ERR_UNKNOWN_19
};
#define ERR_MSG_COUNT	20
#define ERR_MSG_LAST	(ERR_MSG_COUNT - 1)

/* the EXE's INT 2Fh disk services: fn7/fn9 results, fn4/fn14 failure */
enum { DISK_OK, DISK_WRPROT, DISK_FULL, DISK_FULL2, DISK_BADFMT };
#define DISK_FAIL	(-1)
#define SND_NAMES_LEN	(128 * 17)

/* pgm_record.inc */
#define PGM_NOTE_BASE	0x23
#define PGM_NOTE_COUNT	64
#define PGM_NOTE_MAX	0x62
#define PGM_PADS_PER_BANK 16
#define PGM_PAD_STRIDE	0x1D
#define PGM_HDR_LEN	0x1E
#define PGM_PAD_BIAS	0x3D9
#define PGM_FX_SECTIONS	0x91E
#define PGM_FX_REVERBS	0x9AE
#define PGM_PADMAP	0x8DE
#define PGM_ALLOC_PARA	0x9E
#define PGM_BLK_FREE	2
#define PGM_NAME_LEN	16
#define PGM_COUNT	24
#define PGM_NOTE_OK(n)	((unsigned)((n) - PGM_NOTE_BASE) <= PGM_NOTE_COUNT - 1)
#define PAD_OF(bank, i)	(((bank) << 4) + (i))
#define BANK_OF(pad)	((unsigned char)(pad) >> 4)
enum { PAD_MODE_NORMAL, PAD_MODE_SIMULT, PAD_MODE_VEL_SW, PAD_MODE_DCY_SW };
enum { PAD_VOICE_POLY, PAD_VOICE_MONO, PAD_VOICE_NOTE_OFF };
enum { DCY_MODE_END, DCY_MODE_START };
#define PGM_MIX_IOUT_MASK 0x0F
#define PGM_MIX_IOUT_FOLLOW 0x80

/* sys_data.inc: the sample screen, pad input, field widths */
enum { REC_INPUT_ANALOG, REC_INPUT_DIGITAL };
enum { REC_MODE_MONO_L, REC_MODE_MONO_R, REC_MODE_STEREO };
enum { SAMPLE_ST_IDLE, SAMPLE_ST_ARMED, SAMPLE_ST_RECORDING, SAMPLE_ST_DONE };
enum { PADIN_OFF, PADIN_ON, PADIN_LOCAL };
enum { WF_U8, WF_S8, WF_U16, WF_S16, WF_S32 };
#define CREDITS_COUNT	35

/* sys_records.inc */
#define SMEM_POOL_COUNT	0x82
#define SND_POOL_NONE	0x7FFF
#define SMEM_REQ_LOOP	0x01
#define SMEM_REQ_CHAN_MASK 0x60
#define SMEM_REQ_A_ONLY	0x20
#define SMEM_REQ_B_ONLY	0x40
#define SND_COUNT	128
#define WAVE_COLS	245

/* INT 2Eh display-list opcodes (window_macros.inc, data.asm) */
enum {
	WOP_END = 0x00, WOP_CLEAR = 0x01, WOP_PLANE_A = 0x02, WOP_PLANE_B = 0x03,
	WOP_PLANE_C = 0x04, WOP_FLUSH = 0x05, WOP_SET_FLAG = 0x06, WOP_LABEL = 0x07,
	WOP_LABEL_FC = 0x08, WOP_RULE_0B = 0x0B, WOP_RULE_0E = 0x0E,
	WOP_OP4_11 = 0x11, WOP_OP4_12 = 0x12, WOP_OP4_13 = 0x13, WOP_OP4_14 = 0x14,
	WOP_HEX8 = 0x15, WOP_HEX16 = 0x16, WOP_NUMBER = 0x17, WOP_PRINT = 0x18,
	WOP_SOFTKEY = 0x1A, WOP_PIXEL1 = 0x1B, WOP_TEXT_FAR = 0x1E, WOP_TEXT_FAR_FC = 0x1F,
	WOP_SOFTKEYS_REDRAW = 0x20, WOP_SOFTKEY_STYLES = 0x21, WOP_FRAME = 0x22,
	WOP_MESSAGE = 0x23, WOP_LINE = 0x24, WOP_BITMAP = 0x25, WOP_SUBLIST = 0x26
};
enum { PLANE_A, PLANE_B, PLANE_C };	/* cmd_exec_0E_wrapper: op WOP_PLANE_A + n */

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
	char loopon;			/* also read as a word, 400h */
	char field_25;
	unsigned rate;			/* 44100 */
	struct SND __far *next;
	struct SND __far *prev;
	int pool_idx;			/* SMEM_POOL index, 7FFFh none */
	long field_32;
};
#define SND_NAME_LEN	16
#define SIZEOF_SND	0x36

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
	unsigned char fmod_speed;
	unsigned char fmod_depth;
	unsigned char fmod_feedback;
	unsigned char apan_speed;
	unsigned char apan_depth;
	unsigned char apan_mode;
	int pitch_tune_l;
	int pitch_tune_r;
	int pitch_delay_l;
	int pitch_delay_r;
	unsigned char pitch_fdbk_l;
	unsigned char pitch_fdbk_r;
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
	unsigned char sections;		/* FXS_SEC_* bits */
	unsigned char route;		/* FX_ROUTE_LABELS */
	unsigned char field_47;
};

/* EB-16 reverb, 0Ch bytes */
struct FXR {
	unsigned char type;
	char field_01;
	int predelay;			/* ms */
	unsigned char field_04;
	unsigned char field_05;
	unsigned char field_06;
	unsigned char field_07;
	unsigned char field_08;
	unsigned char field_09;
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
