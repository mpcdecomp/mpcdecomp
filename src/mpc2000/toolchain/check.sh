# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# Run in mpcdecomp-msc by `make mpc2000-msc-check`, with the repository at /s
# and the build directory at /r: takes the runtime library modules the 2K SYS
# and XL images link out of Visual C++ 1.52's LLIBCE.LIB, compiles
# src/mpc2000/c/match with its C/C++ 8.00c, links both with its LINK against
# stubs that put the images' names at their offsets, and compares the bytes.
set -e
# omf.awk prints bytes: a UTF-8 locale would print some as two
export LC_ALL=C
cd "$(mktemp -d)"
# Outside the container (make mpc2000-msc-check-host): S, R, CACHE and
# MSVC, the toolchain's directory, from the environment, and dosbox-x.
S=${S:-/s} R=${R:-/r} V=${MSVC:-/opt/msvc} fail=0 T0=$(date +%s)
# where the time goes, on standard error
ph() { echo "check: $* at $(($(date +%s) - T0))s" >&2; }
# MSC=2k: the 2K SYS's library and C only, without the XL's builds and links
case ${MSC:-} in 2k) only2k=1;; *) only2k=;; esac

# image:runtime block's file offset:_ldiv's buffer (DS)
LIB="xl-v107:34C1A:77C6 xl-v110:3511A:77CC xl-v111:3521A:77CC xl-v112:3531A:77CC
     xl-v114:3551A:77CC xl-v120:35B1A:77CC 2k-v150-sys:261C:4322 2k-v172-sys:281C:455E"
[ -z "$only2k" ] || LIB=$(echo $LIB | tr ' ' '\n' | grep '^2k-')
# the modules, in the images' order, and the public each starts with; the
# 2K links no aFN/aFF stubs but aFFalmul, and no strupr
XL="afuldiv:__aFuldiv aflmul:__aFlmul afldiv:__aFldiv aflrem:__aFlrem afnaldiv:__aFNaldiv
    affalmul:__aFFalmul affaldiv:__aFFaldiv div:_div longdiv:_ldiv setjmp:__setjmp
    fstricmp:__fstricmp fstrncpy:__fstrncpy fstrupr:__fstrupr"
K=$(echo $XL | tr ' ' '\n' | grep -v -e afnaldiv -e affaldiv -e fstrupr)
# The XL's names at their DS offsets.
APPX="A0_B_PAD_BANK=4D5 B_0494=0494 C0_B_03EDC=3EDC C0_B_08B02=8B02
      C0_B_08D86=8D86 C0_B_09603=9603 C0_B_09604=9604 C0_B_098B8=98B8
      C0_B_0D7C7=D7C7 C0_B_0D7C9=D7C9 C0_B_0D7E2=D7E2 C0_B_0D7F8=D7F8
      C0_B_0D7F9=D7F9 C0_FP_0087C=87C C0_FP_03762=3762 C0_FP_0D7C2=D7C2
      C0_TBL_03EDE=3EDE C0_TBL_03EE0=3EE0 C0_TBL_03EE2=3EE2 C0_TBL_03EE4=3EE4
      C0_TBL_065C2=65C2 C0_TBL_09160=9160 C0_TBL_09163=9163
      C0_TBL_FX_DELAY_FIELD_THUNK=52DE C0_W_007CA=7CA C0_W_050DC=50DC
      C0_W_05106=5106 C0_W_06484=6484 C0_W_08DC4=8DC4 C0_W_08DC6=8DC6
      C0_W_09600=9600 C0_W_098C2=98C2 C0_W_098DC=98DC C0_W_0D7C2=D7C2
      C0_W_0D7E8=D7E8 C1_B_08B02=8B02 C1_B_0D775=D775 C1_B_0D7BA=D7BA
      C1_B_0D7BF=D7BF C1_SEG=3E19 C1_TBL_00A90=A90 C1_TBL_00BE6=BE6
      C1_TBL_0D7FE=D7FE C1_W_00418=418 C1_W_0086E=86E C1_W_0098A=98A
      C1_W_009B4=9B4 C1_W_009CE=9CE C1_W_00A26=A26 C1_W_00AD6=AD6
      C1_W_00AF4=AF4 C1_W_00B7C=B7C C1_W_00D54=D54 C1_W_00D7E=D7E
      C1_W_00DA2=DA2 C1_W_08174=8174 C1_W_081FA=81FA C1_W_08AFA=8AFA
      C1_W_08B04=8B04 C1_W_08B06=8B06 C1_W_08B08=8B08 C1_W_08B0E=8B0E
      C1_W_SAVE_APS_CURSOR=8B12 C1_W_SAVE_PGM_CURSOR=8B0C
      C1_W_SAVE_SND_CURSOR=8B14 C2_B_03EDC=3EDC C2_B_060B8=60B8
      C2_B_0647D=647D C2_B_08D90=8D90 C2_B_09604=9604 C2_B_09606=9606
      C2_B_098B9=98B9 C2_B_CUR_PAD=D7C1 C2_B_FX_MOD_TYPE=8E70
      C2_B_FX_UPDATE_MASK=8DC2 C2_B_MIXER_DRUM=D7BC
      C2_B_PAD_ASSIGN_MASTER=D777 C2_B_PAD_DRUM=D7BE C2_B_PAD_NOTE=D7C0
      C2_B_RECORD_MIX_CHANGES=D7BB C2_FP_036E0=36E0 C2_FP_08DA0=8DA0
      C2_FP_08DAA=8DAA C2_FP_MIDI_IN_BLOCK=6480 C2_SEG=4E16 C2_TBL_031AA=31AA
      C2_TBL_0392C=392C C2_TBL_03A86=3A86 C2_TBL_03BF4=3BF4 C2_TBL_0408C=408C
      C2_TBL_0555C=555C C2_TBL_05908=5908 C2_TBL_CHANSET_FIELD_THUNK=424E
      C2_TBL_FILTER4_FIELD_THUNK=494A C2_TBL_MIXER_FIELD_ENTER=44EE
      C2_TBL_MIXER_FIELD_ENTER_SEG=44F0 C2_TBL_MIXER_FIELD_THUNK=44D6
      C2_TBL_PARAMS_FIELD_THUNK=2F78 C2_TBL_SDUMP_FIELD_ENTER=65DA
      C2_W_02F94=2F94 C2_W_03632=3632 C2_W_03686=3686 C2_W_036D2=36D2
      C2_W_03754=3754 C2_W_03948=3948 C2_W_03972=3972 C2_W_0399C=399C
      C2_W_03AA2=3AA2 C2_W_03ACC=3ACC C2_W_03AF6=3AF6 C2_W_03B20=3B20
      C2_W_03C10=3C10 C2_W_03C3A=3C3A C2_W_040BA=40BA C2_W_0410E=410E
      C2_W_04138=4138 C2_W_04294=4294 C2_W_042E8=42E8 C2_W_04366=4366
      C2_W_04390=4390 C2_W_04804=4804 C2_W_04F20=4F20 C2_W_055F6=55F6
      C2_W_05620=5620 C2_W_0564A=564A C2_W_05726=5726 C2_W_0594E=594E
      C2_W_05962=5962 C2_W_05972=5972 C2_W_06366=6366 C2_W_06458=6458
      C2_W_06470=6470 C2_W_0647C=647C C2_W_065DC=65DC C2_W_065DE=65DE
      C2_W_06686=6686 C2_W_066B0=66B0 C2_W_08D6A=8D6A C2_W_08D72=8D72
      C2_W_08D82=8D82 C2_W_08D84=8D84 C2_W_08D9C=8D9C C2_W_08DA6=8DA6
      C2_W_08DB8=8DB8 C2_W_08DBE=8DBE C2_W_08DC4=8DC4 C2_W_095F8=95F8
      C2_W_09888=9888 C2_W_098BA=98BA C2_W_AUTO_CHROMATIC_CURSOR=8D80
      C2_W_CHANSET_CURSOR=8D8E C2_W_COPY_FX_CURSOR=8D92
      C2_W_COPY_NOTE_CURSOR=8D76 C2_W_DIST_RINGMOD_CURSOR=8D94
      C2_W_FILTER4_CURSOR=8D96 C2_W_FX_DELAY_CURSOR=8D98
      C2_W_FX_MIXER_CURSOR=8DA4 C2_W_FX_MOD_CURSOR=9600
      C2_W_FX_REVERB_CURSOR=8D9A C2_W_MIXER_CURSOR=95F2
      C2_W_MIXER_SETUP_CURSOR=8D88 C2_W_MUTE_ASSIGN_CURSOR=8D7E
      C2_W_NEW_PGM_CURSOR=8D70 C2_W_PARAMS_CURSOR=8D66
      C2_W_PARAM_HOOK_OFF=98BE C2_W_PARAM_HOOK_SEG=98C0
      C2_W_PGM_ASSIGN_CURSOR=8D5E C2_W_PGM_MIDI_CURSOR=8D68
      C2_W_SAMPLE_DUMP_CURSOR=8E50 C2_W_SND_DEBUG_CURSOR=8DBC
      C2_W_VELOCITY_MOD_CURSOR=8D78 C2_W_VELO_ENV_FILTER_CURSOR=8D7A
      C2_W_VELO_PITCH_CURSOR=8D7C D_8EC0=8EC0 D_98D8=98D8
      EP_FAR_4A026_OFF=CDD0 EP_FAR_4EC12_OFF=AB2 EP_FAR_4EC12_SEG=4E16
      EP_FAR_5277C_OFF=461C EP_FAR_5277C_SEG=4E16 EP_FAR_52C28_OFF=4AC8
      EP_FAR_52C28_SEG=4E16 EP_FAR_53236_OFF=50D6 EP_FAR_53236_SEG=4E16
      EP_FAR_55416_OFF=72B6 EP_FAR_55416_SEG=4E16
      EP_LOAD_SOUND_EXISTS_REFRESH_OFF=822C
      EP_LOAD_SOUND_EXISTS_REFRESH_SEG=3E19 EP_L_3A7C4_OFF=4CC4
      EP_L_3A7C4_SEG=35B0 EP_L_3D1F0_OFF=76F0 EP_L_3D1F0_SEG=35B0
      EP_L_3F9AC_OFF=214C EP_L_3F9AC_SEG=3E19 EP_L_4303E_OFF=5DBA
      EP_L_44132_OFF=68D6 EP_L_44132_SEG=3E19 EP_L_46436_OFF=82A6
      EP_MIXER_SETUP_F6_OFF=3DCA EP_MIXER_SETUP_F6_SEG=4E16
      EP_MSG_CHANGE_DISK_OFF=5BC4 EP_MSG_CHANGE_DISK_SEG=3E19
      EP_MSG_FILE_EXISTS_OFF=82D4 EP_MSG_FILE_EXISTS_SEG=3E19
      EP_MSG_SOFTKEY_WIPE_OFF=67EC EP_MSG_SOFTKEY_WIPE_SEG=3E19
      EP_MSG_SOUND_DIR_FULL_OFF=3462 EP_MSG_SOUND_DIR_FULL_SEG=3E19
      EP_PGM_PARAMS_ENTER_OFF=55A EP_PGM_PARAMS_ENTER_SEG=4E16
      MUTE_FIELDS=3CF8 POW10_TABLE=0464 P_4E74=4E74 P_57F6=57F6 P_647E=647E
      P_64BC=64BC P_64DA=64DA P_8DC3=8DC3 P_9A4E=D7FE TBL_073C=073C
      TBL_574E=8F44 TBL_578E=8F84 VOICE_HOLD=8EC4 VOICE_TABLE=9609
      VOICE_TIMER=8F04 W_98A4=98A4 W_D762=D762 W_D7E6=D7E6"
# The code the x files call, at its frame:offset in the flash.
XCODE="L_01D18=4E16:779A L_3614A=35B0:64A L_36604=35B0:B04 L_37431=35B0:1931
       L_37683=35B0:1B83 L_37E7C=35B0:237C L_391F8=35B0:36F8
       L_395FC=35B0:3AFC L_3B2B8=35B0:57B8 L_3D1F0=35B0:76F0 L_3E92C=3E19:79C
       L_3E954=3E19:7C4 L_3E95E=3E19:7CE L_4F180=4E16:1020 L_54DE4=4E16:7674
       __fstrncpy=35B0:3CA _aFldiv=35B0:AC _aFlmul=35B0:7A _setjmp=35B0:330
       audition_stop=4E16:86C copy_note_close=4E16:194C
       copy_note_params_body=3E19:12F2 disk_file_close=35B0:2370
       disk_last_error=35B0:2388 disk_media_ready_check=35B0:2376
       disk_progress_msg=3E19:4F48 disp_alert_wait_key=35B0:2552
       disp_clear_all=3E19:83A disp_list_op_2b_str=35B0:23E4
       disp_list_op_xy2b=35B0:23B6 disp_list_op_xyn=35B0:238E
       disp_list_run=3E19:662 disp_message_window=35B0:2568
       disp_request_flush=3E19:86A disp_select_plane=3E19:81E
       dma_field_write=3E19:46C draw_bitmap_ptr=3E19:958
       draw_char_at=35B0:2526 draw_confirm_window=3E19:BEE
       draw_erase_rect=35B0:250E draw_frame_window=3E19:B68
       draw_hline=35B0:24BA draw_softkey_label=35B0:253C
       draw_string_at=3E19:988 draw_unsigned_value=3E19:9B8
       draw_vline=35B0:24CE dsp_chan_reg_clear=4E16:7680
       effect_mixer_refresh=4E16:69A6 far_37E82=35B0:2382 far_3E32A=3E19:19A
       far_3E59A=3E19:40A far_3E884=3E19:6F4 far_3E8C8=3E19:738
       far_3E99C=3E19:80C far_3ED98=3E19:C08 far_3EE00=3E19:C70
       far_3F084=3E19:EF4 far_3F46E=3E19:12DE far_3FE9E=3E19:1D0E
       far_3FF18=3E19:1D88 far_40138=3E19:1FA8 far_41C08=3E19:3A78
       far_42A32=3E19:48A2 far_42AFE=3E19:496E far_4400A=3E19:5E7A
       far_444F6=3E19:6366 far_4510E=3E19:6F7E far_46126=3E19:7F96
       far_46178=3E19:7FE8 far_46340=3E19:81B0 far_4EC12=4E16:AB2
       far_4EF20=4E16:DC0 far_4EFE4=4E16:E84 far_4EFFA=4E16:E9A
       far_4F296=4E16:1136 far_4FA52=4E16:18F2 far_50972=4E16:2812
       far_50EE2=4E16:2D82 far_50EF8=4E16:2D98 far_51016=4E16:2EB6
       far_51F38=4E16:3DD8 far_5277C=4E16:461C far_52A4C=4E16:48EC
       far_52ADE=4E16:497E far_52C28=4E16:4AC8 far_531E0=4E16:5080
       far_53236=4E16:50D6 far_54172=4E16:6012 far_54566=4E16:6406
       far_54CC0=4E16:6B60 far_54CD4=4E16:6B74 far_55112=4E16:6FB2
       far_5545E=4E16:72FE far_556E0=4E16:7580 far_5570A=4E16:75AA
       far_55752=4E16:75F2 far_5575E=4E16:75FE far_55788=4E16:7628
       field_handler_nop=3E19:C22 fn_039E2=0:39E2 fn_05AFF=0:5AFF
       fn_05B31=0:5B31 fn_05B4D=0:5B4D fn_05D3D=0:5D3D fn_05FFE=0:5FFE
       fn_06E45=0:6E45 fn_06EA2=0:6EA2 fn_06FDB=0:6FDB fn_07BAD=0:7BAD
       fn_07D98=0:7D98 fn_07E83=0:7E83 fn_08328=0:8328 fn_20246=1A9B:5896
       fn_219DA=1A9B:702A fn_28082=267B:18D2 fn_37C3A=35B0:213A
       fn_395E2=35B0:3AE2 fn_3A7FA=35B0:4CFA fn_3A892=35B0:4D92
       fn_3A90E=35B0:4E0E fn_3C244=35B0:6744 fn_3C4FE=35B0:69FE
       fn_3C656=35B0:6B56 fn_3C6CC=35B0:6BCC fn_3D170=35B0:7670
       fn_3D256=35B0:7756 fn_3D3AE=35B0:78AE fn_3D3DC=35B0:78DC
       fn_3D510=35B0:7A10 fn_3D91E=35B0:7E1E fn_3DA24=35B0:7F24
       fn_4323E=3E19:50AE fn_45864=3E19:76D4 fs_close=3E19:48CE
       fs_error_msg=3E19:46A0 fs_open=3E19:46BC
       fx_delay_field1_thunk=4E16:5D88 fx_delay_field5_thunk=4E16:5E0C
       fx_dsp_update_request=4E16:7468 fx_edit_refresh=4E16:4A4C
       fx_mixer_refresh=4E16:65FC fx_not_installed_f5=4E16:353C
       fx_reverb_field1_thunk=4E16:6272 fx_reverb_field2_thunk=4E16:629E
       fx_reverb_field3_thunk=4E16:62D6 fx_section_field_notify=4E16:48D6
       handler_install_one=3E19:C42 handler_set_install=3E19:724
       init_pad_assign_open=4E16:14C2 int4a_sysex_wrapper=35B0:7892
       ivt_get_vector=35B0:418 lcd_clear_line=35B0:54DC
       lcd_init_setup=35B0:763A lcd_write_data=4E16:7398
       mixer_refresh=4E16:3F48 mixer_setup_f6=4E16:3DCA
       mixer_setup_key_46=4E16:6AB2 mute_assign_refresh=4E16:2748
       pad_assign_master_set=3E19:1640 pad_audition_note_off=4E16:4D6
       pad_route_mode_set=3E19:158A pgm_delete_slot=3E19:10B6
       pgm_file_read=3E19:55E4 pgm_fx_reverb_ptr=3E19:155A
       pgm_fx_section_ptr=3E19:1530 pgm_indiv_fx_mix_ptr=3E19:144C
       pgm_midi_refresh=4E16:CA4 pgm_params_enter=4E16:55A
       pgm_replace_sound_ref=3E19:1E14 pgm_stereo_mix_ptr=3E19:13F8
       sample_dump_cancel=35B0:7C86 sample_dump_field3_thunk=4E16:7A98
       sample_dump_refresh=35B0:7C40 sound_list_contains=3E19:1C7E
       sound_list_renumber=3E19:2166 sound_list_unlink=3E19:18E2
       sound_record_alloc=3E19:1826 string_scan_sysex=35B0:7B34
       ui_field_engine=35B0:62BE velo_env_filter_refresh=4E16:208A
       velo_pitch_refresh=4E16:241E velocity_mod_refresh=4E16:1D72
       voice_release_full=3E19:3A02 voices_release_all=3E19:39EE"
# name:file offset, in leaf.c's order: LINK's map gives a COMDAT's place and
# length but not its name
FN120="voice_release:41BC6 L_3E4EE:3E4EE far_3F46E:3F46E far_3F556:3F556 L_3F9AC:402DC
       fs_error_msg:42830 far_41A9E:41A9E pow10_lookup:3EEB8 far_4610A:4610A"
# The XL's other C, c/x*.c, one function a file: file:function:flash offset:
# COMDAT length:frame.
FNX="x04412:pad_bank_b:4412:6:0 x0534a:fn_0534A:534A:4:0
       x05352:fn_05352:5352:4:0 x053f8:fn_053F8:53F8:A:0
       x05950:fn_05950:5950:1C:0 x1f638:d_p_4c88:1F638:4:1A9B
       x20242:far_20242:20242:4:1A9B x219d6:L_219D6:219D6:4:1A9B
       x27666:d_a3_w_00eb6:27666:4:267B
       x37c32:wave_mem_size_probe:37C32:8:35B0
       x37fba:draw_hline:37FBA:14:35B0 x37fce:draw_vline:37FCE:14:35B0
       x37fe2:draw_hdots:37FE2:14:35B0 x37ff6:draw_fill_rect:37FF6:18:35B0
       x3800e:draw_erase_rect:3800E:18:35B0 x38026:draw_char_at:38026:16:35B0
       x3803c:draw_softkey_label:3803C:16:35B0
       x3807e:draw_invert_box:3807E:2E:35B0 x389fe:fn_389FE:389FE:12:35B0
       x391b0:fn_391B0:391B0:48:35B0 x395b6:fn_395B6:395B6:18:35B0
       x395ce:L_395CE:395CE:A:35B0 x395d8:L_395D8:395D8:A:35B0
       x395e2:fn_395E2:395E2:1A:35B0 x3a76c:file_exists_f3:3A76C:58:35B0
       x3a862:X_3A862:3A862:30:35B0 x3a8fa:L_3A8FA:3A8FA:A:35B0
       x3a904:L_3A904:3A904:A:35B0 x3af9e:L_3AF9E:3AF9E:3E:35B0
       x3c214:far_3C214:3C214:18:35B0 x3c22c:L_3B8F2:3C22C:18:35B0
       x3c4ce:L_3C4CE:3C4CE:10:35B0 x3c4de:far_3C4DE:3C4DE:10:35B0
       x3c4ee:far_3C4EE:3C4EE:10:35B0 x3c646:L_3C646:3C646:10:35B0
       x3c678:L_3C678:3C678:2A:35B0 x3c6a2:X_3C6A2:3C6A2:2A:35B0
       x3ced6:fn_3CED6:3CED6:9E:35B0 x3d06e:L_3D06E:3D06E:36:35B0
       x3d0a4:L_3D0A4:3D0A4:30:35B0 x3d0d4:L_3D0D4:3D0D4:36:35B0
       x3d10a:L_3D10A:3D10A:30:35B0 x3d23e:L_3D23E:3D23E:18:35B0
       x3d356:fn_3D356:3D356:3C:35B0 x3d6f4:fn_3D6F4:3D6F4:30:35B0
       x3d724:L_3D724:3D724:1C:35B0 x3d740:sample_dump_refresh:3D740:24:35B0
       x3d764:sample_dump_request:3D764:22:35B0 x3d91e:fn_3D91E:3D91E:50:35B0
       x3d96e:fn_3D96E:3D96E:B6:35B0 x3da24:fn_3DA24:3DA24:E:35B0
       x3da32:fn_3DA32:3DA32:E:35B0 x3e1b8:detect_memory:3E1B8:C:3E19
       x3e58a:far_3E58A:3E58A:6:3E19 x3e590:far_3E590:3E590:A:3E19
       x3e59a:far_3E59A:3E59A:38:3E19 x3e5d2:dma_0162d:3E5D2:2A:3E19
       x3e7ec:L_3E7EC:3E7EC:6:3E19 x3eb7e:draw_signed_value:3EB7E:4A:3E19
       x3ed64:smem_proc_wrapper:3ED64:1A:3E19
       x3ed7e:draw_confirm_window:3ED7E:1A:3E19
       x3ed98:far_3ED98:3ED98:1A:3E19 x3edca:field_handler_nop_2:3EDCA:8:3E19
       x3fcfe:size_para_round_mul:3FCFE:20:3E19
       x403a6:far_403A6:403A6:6C:3E19 x41a78:voice_buf_helper_1:41A78:26:3E19
       x41b7e:voices_release_all:41B7E:14:3E19 x42182:L_42182:42182:10:3E19
       x4275c:far_4275C:4275C:46:3E19 x427a2:far_427A2:427A2:46:3E19
       x42a32:far_42A32:42A32:2C:3E19 x42a5e:fs_close:42A5E:20:3E19
       x42af6:L_42AF6:42AF6:8:3E19 x42faa:filename_split:42FAA:58:3E19
       x43aaa:load_set_clear:43AAA:26:3E19
       x43ad0:load_set_cancel:43AD0:E:3E19 x43b62:L_43B62:43B62:12:3E19
       x43c0a:cant_find_file_al_skp:43C0A:E:3E19
       x43c18:cant_find_file_skip:43C18:2C:3E19
       x43c44:far_43C44:43C44:36:3E19 x43cd8:far_43CD8:43CD8:18:3E19
       x43efe:far_43EFE:43EFE:E:3E19 x43f0c:load_aps_cancel:43F0C:E:3E19
       x43f1a:load_aps_load:43F1A:E:3E19 x43f28:load_aps_paint:43F28:22:3E19
       x43fa8:far_43FA8:43FA8:62:3E19 x446a4:far_446A4:446A4:2A:3E19
       x4474e:save_a_program_cancel:4474E:E:3E19
       x44914:save_pgm_field0_thunk:44914:18:3E19
       x4492c:save_pgm_field1_thunk:4492C:18:3E19
       x44982:far_44982:44982:22:3E19 x449e2:X_449E2:449E2:38:3E19
       x44a1a:disk_full_cancel:44A1A:E:3E19
       x44a28:disk_full_paint:44A28:3E:3E19 x44e40:far_44E40:44E40:2A:3E19
       x44ed8:save_aps_cancel:44ED8:E:3E19
       x45074:save_aps_field0_thunk:45074:18:3E19
       x4508c:save_aps_field1_thunk:4508C:18:3E19
       x450a4:save_aps_field2_thunk:450A4:18:3E19
       x450d4:far_450D4:450D4:3A:3E19 x4582a:far_4582A:4582A:3A:3E19
       x4615e:L_45818:4615E:1A:3E19 x46178:far_46178:46178:1A:3E19
       x46192:load_sound_discard:46192:22:3E19
       x46240:load_sound_refresh:46240:1E:3E19 x46320:far_46320:46320:12:3E19
       x46340:far_46340:46340:E:3E19
       x4634e:load_sound_exists_replace:4634E:50:3E19
       x4639e:load_sound_exists_cancel:4639E:1E:3E19
       x463bc:load_sound_exists_refresh:463BC:18:3E19
       x463d4:load_sound_exists_paint:463D4:22:3E19
       x463f6:load_sound_exists_rename:463F6:40:3E19
       x46436:L_46436:46436:2E:3E19 x46758:save_a_sound_cancel:46758:E:3E19
       x468a0:save_snd_field0_thunk:468A0:18:3E19
       x468b8:save_snd_field1_thunk:468B8:18:3E19
       x468f8:file_exists_f4:468F8:E:3E19 x46956:file_exists_f5:46956:2E:3E19
       x4e1a0:PGM_ASSIGN_FOCUS_PGM:4E1A0:18:4E16 x4e234:L_4E234:4E234:22:4E16
       x4e2b2:L_4E2B2:4E2B2:10:4E16
       x4e2c2:pgm_assign_focus_note:4E2C2:18:4E16
       x4e2da:L_4E2DA:4E2DA:10:4E16 x4e966:L_4E966:4E966:12:4E16
       x4e978:L_4E018:4E978:12:4E16 x4e98a:tgt_4E98A:4E98A:1C:4E16
       x4e9cc:audition_stop:4E9CC:1E:4E16 x4e9ea:L_4E9EA:4E9EA:10:4E16
       x4ea3a:far_4E0DA:4EA3A:18:4E16 x4ed9e:pgm_midi_f2:4ED9E:12:4E16
       x4ee04:pgm_midi_refresh:4EE04:1A:4E16 x4ee1e:L_4EE1E:4EE1E:10:4E16
       x4ee2e:pgm_midi_focus_pgm:4EE2E:18:4E16 x4ee46:L_4EE46:4EE46:C:4E16
       x4ee8c:L_4EE8C:4EE8C:1E:4E16 x4efe4:far_4EFE4:4EFE4:16:4E16
       x4f10c:program_close:4F10C:C:4E16 x4f296:far_4F296:4F296:E:4E16
       x4f2a4:far_4F2A4:4F2A4:26:4E16 x4f392:new_pgm_cancel:4F392:E:4E16
       x4f45c:delete_pgm_field0_thunk:4F45C:18:4E16
       x4f474:delete_pgm_field1_thunk:4F474:18:4E16
       x4f4c2:copy_pgm_cancel:4F4C2:E:4E16 x4f5d0:L_4F5D0:4F5D0:12:4E16
       x4f610:L_4F610:4F610:12:4E16 x4f630:init_pad_assign_f5:4F630:28:4E16
       x4f6a4:L_4F6A4:4F6A4:18:4E16 x4f6bc:far_4F6BC:4F6BC:10:4E16
       x4f968:assign_view_refresh:4F968:1A:4E16 x4f982:L_4F982:4F982:A:4E16
       x4f98c:far_4F98C:4F98C:28:4E16 x4faac:copy_note_close:4FAAC:C:4E16
       x4fab8:copy_note_f5:4FAB8:34:4E16
       x4fca0:copy_note_field0_thunk:4FCA0:18:4E16
       x4fcb8:copy_note_field1_thunk:4FCB8:18:4E16
       x4fcd0:copy_note_field2_thunk:4FCD0:18:4E16
       x4fec0:velocity_mod_open:4FEC0:12:4E16
       x4fed2:velocity_mod_refresh:4FED2:1E:4E16 x4fef0:L_4FEF0:4FEF0:10:4E16
       x4ff00:velocity_mod_field0_thunk:4FF00:18:4E16
       x4ff18:velocity_mod_field1_thunk:4FF18:3C:4E16
       x4ff54:velocity_mod_field2_thunk:4FF54:3C:4E16
       x4ff90:velocity_mod_field3_thunk:4FF90:3C:4E16
       x4ffcc:velocity_mod_field4_thunk:4FFCC:18:4E16
       x501d8:velo_env_filter_open:501D8:12:4E16
       x501ea:velo_env_filter_refresh:501EA:1E:4E16
       x50208:L_4F8A8:50208:10:4E16
       x50218:velo_env_filter_field0_thunk:50218:18:4E16
       x50230:velo_env_filter_field1_thunk:50230:3C:4E16
       x5026c:velo_env_filter_field2_thunk:5026C:3C:4E16
       x502a8:velo_env_filter_field3_thunk:502A8:3C:4E16
       x502e4:velo_env_filter_field4_thunk:502E4:3C:4E16
       x50320:velo_env_filter_field5_thunk:50320:18:4E16
       x5056c:velo_pitch_close:5056C:12:4E16
       x5057e:velo_pitch_refresh:5057E:1E:4E16 x5059c:L_4FC3C:5059C:10:4E16
       x505ac:velo_pitch_field0_thunk:505AC:18:4E16
       x505c4:velo_pitch_field1_thunk:505C4:3C:4E16
       x50600:far_4FCA0:50600:3C:4E16
       x5063c:velo_pitch_field3_thunk:5063C:18:4E16
       x50896:mute_assign_open:50896:12:4E16
       x508a8:mute_assign_refresh:508A8:1E:4E16 x508c6:L_508C6:508C6:10:4E16
       x508d6:mute_assign_field0_thunk:508D6:18:4E16
       x50a40:auto_chromatic_cancel:50A40:C:4E16
       x50ce4:auto_chromatic_field0_thunk:50CE4:18:4E16
       x50d30:auto_chromatic_field1_thunk:50D30:28:4E16
       x50d58:auto_chromatic_field2_thunk:50D58:28:4E16
       x50d80:auto_chromatic_field3_thunk:50D80:28:4E16
       x50da8:auto_chromatic_field4_thunk:50DA8:18:4E16
       x50ee2:far_50EE2:50EE2:16:4E16 x50f82:far_50F82:50F82:E:4E16
       x50f90:far_50F90:50F90:E:4E16 x50f9e:L_50F9E:50F9E:E:4E16
       x50fac:L_50FAC:50FAC:E:4E16 x50ff2:L_50FF2:50FF2:12:4E16
       x51004:far_51004:51004:12:4E16 x51016:far_51016:51016:1A:4E16
       x51030:L_51030:51030:6:4E16 x51036:far_51036:51036:1A:4E16
       x51050:L_51050:51050:12:4E16 x51294:L_51294:51294:12:4E16
       x5149c:L_5149C:5149C:12:4E16 x516ce:mixer_setup_f1:516CE:12:4E16
       x516e0:mixer_setup_f2:516E0:12:4E16
       x516f2:mixer_setup_f3:516F2:12:4E16
       x51704:mixer_setup_f4:51704:12:4E16
       x51858:mixer_setup_open:51858:28:4E16
       x51880:mixer_setup_field0_thunk:51880:18:4E16
       x51898:mixer_setup_field1_thunk:51898:18:4E16
       x518b0:mixer_setup_field2_thunk:518B0:1E:4E16
       x518ce:far_5098E:518CE:C:4E16
       x518da:mixer_setup_field3_thunk:518DA:18:4E16
       x518f2:mixer_setup_field4_thunk:518F2:1E:4E16
       x51910:L_51910:51910:E:4E16
       x5191e:mixer_setup_field5_thunk:5191E:1E:4E16
       x5193c:L_5193C:5193C:14:4E16 x51c10:L_51C10:51C10:1A:4E16
       x51c2a:L_51C2A:51C2A:10:4E16
       x51c3a:mixer_chan_field0_thunk:51C3A:18:4E16
       x51c80:mixer_chan_field2_thunk:51C80:36:4E16
       x51cb6:L_51CB6:51CB6:22:4E16
       x51d08:mixer_chan_field4_thunk:51D08:36:4E16
       x51dc8:mixer_chan_field7_thunk:51DC8:3C:4E16
       x51e72:far_51E72:51E72:E:4E16 x51ee2:fx_not_installed_f1:51EE2:12:4E16
       x51ef4:fx_not_installed_f2:51EF4:12:4E16
       x51f06:fx_not_installed_f3:51F06:12:4E16
       x51f18:fx_not_installed_f4:51F18:12:4E16
       x51f2a:mixer_setup_f6:51F2A:E:4E16 x51fb2:mixer_f6:51FB2:5E:4E16
       x52010:mixer_f1:52010:18:4E16 x52028:mixer_drum_2:52028:18:4E16
       x52040:mixer_drum_3:52040:18:4E16 x52058:mixer_drum_4:52058:18:4E16
       x52070:mixer_open:52070:26:4E16 x52096:mixer_f5:52096:12:4E16
       x520a8:mixer_refresh:520A8:10:4E16 x520b8:L_520B8:520B8:10:4E16
       x520ee:L_520EE:520EE:1C:4E16 x5210a:mixer_field1_thunk:5210A:1C:4E16
       x52126:L_52126:52126:10:4E16 x52178:L_52178:52178:10:4E16
       x52188:mixer_field3_thunk:52188:1C:4E16
       x521a4:mixer_field4_thunk:521A4:1C:4E16
       x52324:mixer_field8_thunk:52324:1C:4E16
       x52370:mixer_field9_thunk:52370:18:4E16
       x52388:mixer_drum_field_notify:52388:14:4E16
       x526d4:copy_fx_open:526D4:E:4E16
       x526e2:copy_fx_field0_thunk:526E2:18:4E16
       x526fa:copy_fx_field1_thunk:526FA:18:4E16
       x52712:copy_fx_field2_thunk:52712:18:4E16
       x5272a:copy_fx_field3_thunk:5272A:18:4E16
       x52758:fx_dist_ringmod_enter:52758:24:4E16
       x527d6:fx_dist_ringmod_f2:527D6:12:4E16
       x527e8:fx_dist_ringmod_f3:527E8:12:4E16
       x528a2:fx_dist_ringmod_f5:528A2:20:4E16
       x528c2:fx_dist_ringmod_open:528C2:12:4E16 x528d4:L_528D4:528D4:2C:4E16
       x52a36:fx_section_field_notify:52A36:16:4E16
       x52bac:fx_edit_refresh:52BAC:2A:4E16 x52c04:far_52C04:52C04:24:4E16
       x52c82:filter4_f2:52C82:12:4E16 x52c94:filter4_f3:52C94:12:4E16
       x52e22:filter4_f5:52E22:20:4E16 x52e42:filter4_open:52E42:12:4E16
       x52e54:L_52E54:52E54:2C:4E16 x531e0:far_531E0:531E0:56:4E16
       x532be:fx_chorus_f2:532BE:12:4E16 x532d0:fx_chorus_f3:532D0:12:4E16
       x53394:fx_chorus_f5:53394:20:4E16 x533b4:fx_chorus_open:533B4:12:4E16
       x533c6:L_533C6:533C6:C:4E16
       x53456:fx_chorus_field0_thunk:53456:18:4E16
       x5346e:L_5346E:5346E:40:4E16 x53546:fx_rotary_f2:53546:12:4E16
       x53558:fx_rotary_f3:53558:12:4E16 x53652:fx_rotary_f5:53652:20:4E16
       x53672:fx_rotary_open:53672:12:4E16 x53684:L_53684:53684:C:4E16
       x5376c:fx_rotary_field0_thunk:5376C:18:4E16
       x53784:far_53784:53784:40:4E16 x537c4:far_537C4:537C4:36:4E16
       x537fa:fx_fmod_autopan_f2:537FA:12:4E16
       x5380c:fx_fmod_autopan_f3:5380C:12:4E16 x53924:X_53924:53924:20:4E16
       x53944:copy_pgm_refresh:53944:12:4E16 x53956:L_53956:53956:C:4E16
       x53a6a:fx_fmod_autopan_field0_thunk:53A6A:18:4E16
       x53a82:far_53A82:53A82:40:4E16 x53b0a:fx_pitch_shift_f2:53B0A:12:4E16
       x53b1c:fx_pitch_shift_f3:53B1C:12:4E16
       x53b2e:fx_pitch_shift_f5:53B2E:20:4E16
       x53b4e:fx_pitch_shift_open:53B4E:12:4E16 x53b60:L_53B60:53B60:C:4E16
       x53c4c:fx_pitch_shift_field0_thunk:53C4C:18:4E16
       x53c64:far_53C64:53C64:40:4E16 x53ca4:L_53CA4:53CA4:30:4E16
       x53cd4:fx_delay_f2:53CD4:12:4E16 x53ce6:fx_delay_f3:53CE6:12:4E16
       x53e8a:fx_delay_f5:53E8A:20:4E16 x53eaa:fx_delay_open:53EAA:12:4E16
       x540dc:L_540DC:540DC:24:4E16 x54130:L_54130:54130:42:4E16
       x541cc:fx_reverb_f2:541CC:12:4E16 x541de:fx_reverb_f3:541DE:12:4E16
       x5434c:fx_reverb_open:5434C:12:4E16 x5435e:L_5435E:5435E:4C:4E16
       x54462:fx_reverb_field4_thunk:54462:36:4E16
       x54498:fx_reverb_field5_thunk:54498:36:4E16
       x544ce:fx_reverb_field6_thunk:544CE:36:4E16
       x54504:fx_reverb_field_notify:54504:12:4E16
       x5474a:fx_mixer_close:5474A:12:4E16
       x5475c:fx_mixer_refresh:5475C:44:4E16 x547a0:L_547A0:547A0:36:4E16
       x54962:fx_mixer_field2_thunk:54962:18:4E16
       x54af4:effect_mixer_close:54AF4:12:4E16
       x54b06:effect_mixer_refresh:54B06:44:4E16 x54b4a:L_54B4A:54B4A:36:4E16
       x54c12:mixer_setup_key_46:54C12:14:4E16
       x54ca2:build_info_f6:54CA2:1E:4E16 x54cd4:far_54CD4:54CD4:3A:4E16
       x54f3c:wave_mem_padchk:54F3C:E:4E16
       x550ba:wave_mem_return:550BA:C:4E16 x550fa:far_550FA:550FA:18:4E16
       x55112:far_55112:55112:5C:4E16 x55318:snd_debug_open:55318:12:4E16
       x5532a:snd_debug_create:5532A:3E:4E16
       x55368:snd_debug_id_sort:55368:30:4E16
       x553be:snd_debug_ver:553BE:E:4E16 x553e2:snd_debug_return:553E2:C:4E16
       x553ee:far_553EE:553EE:18:4E16
       x5544a:asic_reg1_bank_clear:5544A:14:4E16 x55584:L_55584:55584:22:4E16
       x555c8:fx_dsp_update_request:555C8:1A:4E16
       x556b2:fx_dsp_reload_all:556B2:2E:4E16 x556e0:far_556E0:556E0:2A:4E16
       x5570a:far_5570A:5570A:48:4E16 x55752:far_55752:55752:C:4E16
       x5575e:far_5575E:5575E:2A:4E16 x55788:far_55788:55788:4C:4E16
       x557d4:L_54DE4:557D4:C:4E16 x559be:sample_dump_open:559BE:26:4E16
       x55a14:sample_dump_send:55A14:22:4E16
       x55ba8:sample_dump_field0_thunk:55BA8:18:4E16
       x55bc0:sample_dump_field1_thunk:55BC0:20:4E16
       x55be0:sample_dump_field2_thunk:55BE0:18:4E16
       x55bf8:sample_dump_field3_thunk:55BF8:18:4E16
       x55c10:L_55C10:55C10:14:4E16
       x55c34:sample_dump_field4_thunk:55C34:18:4E16
       x55c4c:sample_dump_field5_thunk:55C4C:40:4E16
       x55cc2:L_55CC2:55CC2:14:4E16"
# The 2K SYS's C, c/t1*.c and c/t2*.c for text1 and text2: file:function:
# file offset:length with its pad, in image order.  A file is one run of the
# image: LINK places a segment's COMDATs in object order, then definition order.
FN150="t10240a:mpc_mode_setup:4A0A:6E t102478:system_setup_2:4A78:50
       t1024c8:L_02420:4AC8:1A t1024e2:smem_pool_insert:4AE2:52
       t102534:smem_pool_remove:4B34:8E t1025c2:smem_alloc:4BC2:5C
       t10261e:midi_status_process:4C1E:3A t102658:smem_free:4C58:E
       t1028a6:buffer_init:4EA6:4A t1029b0:dsp_0292A:4FB0:3C
       t102a7e:pad_note_trigger:507E:20A t102c88:note_voice_prepare:5288:236
       t102f52:voice_pitch_ratio:5552:56 t103132:mpc_status_read:5732:D0
       t103202:mpc_status_wait:5802:3E t103582:field_register:5B82:98
       t10361a:far_call_wrapper_1:5C1A:5E t103678:far_035F2:5C78:44
       t1036bc:mixer_arm_field:5CBC:62 t10371e:L_03698:5D1E:16
       t1mixer:X_036AE:5D34:16 t1mixer:X_036C4:5D4A:18
       t1mixer:X_036DC:5D62:18 t1mixer:mixer_setup:5D7A:22
       t10379c:X_03716:5D9C:E t1037aa:fn_03724:5DAA:72
       t1fxmod:X_03796:5E1C:20 t1fxmod:X_037B6:5E3C:1C
       t1fxmod:X_037D2:5E58:16 t1fxmod:X_037E8:5E6E:16
       t1fxmod:X_037FE:5E84:38 t103916:X_03890:5F16:6
       t1fxedit:X_03896:5F1C:24 t1fxedit:X_038BA:5F40:1C
       t1fxedit:X_038D6:5F5C:16 t1fxedit:X_038EC:5F72:16
       t103988:fn_03902:5F88:60 t1039e8:ui_screen_enter:5FE8:46
       t103a2e:X_039A8:602E:1E t103a4c:L_039C6:604C:86
       t103ad2:fx_dist_arm_field:60D2:9E t1fxdist:X_03AEA:6170:16
       t1fxdist:X_03B00:6186:16 t1fxdist:X_03B16:619C:18
       t1fxdist:X_03B2E:61B4:18 t1fxdist:X_03B46:61CC:1E
       t103bea:filter4_paint:61EA:134 t103d1e:midi_note_handler:631E:19A
       t103eb8:filter4_up:64B8:3A t103f2e:filter4_left:652E:28
       t103f56:filter4_right:6556:36
       t103f8c:ctrl_change_table_dispatch:658C:38 t103fc4:X_03F3E:65C4:1E
       t103fe2:fx_mod_arm_field:65E2:A0 t1fxchor:fx_chorus_up:6682:16
       t1fxchor:fx_chorus_down:6698:16 t1fxchor:fx_chorus_left:66AE:18
       t1fxchor:fx_chorus_right:66C6:18 t1fxchor:X_04058:66DE:1E
       t1040fc:fx_rotary_arm_field:66FC:BE t1041ba:fx_rotary_up:67BA:24
       t1041de:fx_rotary_down:67DE:1E t1041fc:fx_rotary_left:67FC:2C
       t104228:fx_rotary_right:6828:2C t104254:X_041CE:6854:1E
       t104272:fx_autopan_arm_field:6872:D8 t10434a:X_042C4:694A:24
       t10436e:X_042E8:696E:1E t10438c:X_04306:698C:20
       t1043ac:L_04326:69AC:2C t1043d8:X_04352:69D8:1E
       t1043f6:fx_pitch_arm_field:69F6:E8 t1044de:fx_pitch_shift_up:6ADE:24
       t104502:fx_pitch_shift_down:6B02:2C
       t10452e:fx_pitch_shift_left:6B2E:2A
       t104558:fx_pitch_shift_right:6B58:20
       t104578:ui_screen_enter_chan:6B78:4E
       t1045c6:midi_dispatch_table:6BC6:4A t104706:X_04680:6D06:16
       t10471c:X_04696:6D1C:24 t104740:X_046BA:6D40:18
       t104758:X_046D2:6D58:18 t104770:fx_echo_st_arm_field:6D70:F4
       t104864:X_047DE:6E64:24 t104888:X_04802:6E88:1E
       t1048a6:X_04820:6EA6:2C t1048d2:X_0484C:6ED2:2A
       t1048fc:X_04876:6EFC:1E t10491a:int2E_read_caller:6F1A:116
       t104b6e:X_04AE8:716E:24 t104b92:X_04B0C:7192:1E
       t104bb0:L_04B2A:71B0:18 t104bc8:L_04B42:71C8:3C
       t104c04:audio_dispatch_table:7204:3E t104c42:midi_status_read:7242:120
       t104d62:fx_mixer_up:7362:2E t104d90:fx_mixer_down:7390:2C
       t104dbc:fx_mixer_left:73BC:30 t104dec:fx_mixer_right:73EC:38
       t104e24:ui_screen_enter_edit:7424:3E
       t104e62:fx_mixer_arm_field:7462:76 t104ed8:fx_mixer_lr_left:74D8:18
       t104ef0:fx_mixer_lr_right:74F0:18 t104f08:L_04E88:7508:34
       t104f3c:fx_copy_arm_field:753C:5C t1copyfx:copy_fx_up:7598:16
       t1copyfx:copy_fx_down:75AE:16 t104fc4:track_calc_offset:75C4:16
       t104fda:X_04F5A:75DA:1C t104ff6:X_04F76:75F6:24
       t10501a:X_04F9A:761A:34 t10504e:X_04FCE:764E:24
       t105072:X_04FF2:7672:20 t105092:L_05012:7692:26
       t1050b8:timer_poll_wait_1:76B8:3C t1050f4:L_05074:76F4:22
       t105116:pad_sw2_clamp:7716:24 t10513a:L_050BA_1:773A:2A
       t105164:X_050E4:7764:32 t105196:X_05116:7796:2A
       t1051c0:X_05140:77C0:32 t1051f2:X_05172:77F2:1C
       t10520e:L_0518E:780E:1C t105276:assign_view_key_up:7876:38
       t1052e6:assign_view_key_left:78E6:38
       t10531e:assign_view_key_right:791E:38 t105356:L_052D6:7956:28
       t1054f8:pgm_assign_enter:7AF8:64 t105648:timer_poll_wait_2:7C48:42
       t10568a:L_0560A:7C8A:36 t1057f6:X_05776:7DF6:3E
       t105834:track_calc_offset2:7E34:16 t10584a:timer_dma_sync:7E4A:186
       t1059d0:X_05950:7FD0:18 t1059e8:L_05968:7FE8:18
       t105a00:L_05980:8000:18 t105a18:L_05998:8018:18
       t105a30:pad_note_select:8030:46 t105a76:timer_poll_wait_3:8076:14A
       t105bc0:pgm_params_enter:81C0:24 t105be4:velo_mod_arm_field:81E4:92
       t105c76:X_05BF6:8276:16 t105c8c:X_05C0C:828C:16
       t105ca2:timer_status_handler:82A2:4C t105daa:L_05D2A:83AA:26
       t105dd0:timer_poll_wait_4:83D0:BA t105e8a:X_05E0A:848A:24
       t105eae:X_05E2E:84AE:16 t105ec4:X_05E44:84C4:18
       t105edc:X_05E5C:84DC:2A t105f06:pad_note_select_2:8506:4C
       t106040:L_05FC0:8640:26 t106066:velo_pitch_arm_field:8666:98
       t1060fe:T1_L_0607E:86FE:18 t106116:L_06096:8716:18
       t10612e:L_060AE:872E:18 t106146:L_060C6:8746:18
       t10615e:pad_note_select_3:875E:4C t1061aa:timer_status_check_3:87AA:E4
       t10628e:L_0620E:888E:26 t1062b4:mute_assign_row_dispatch:88B4:52
       t106306:X_06286:8906:16 t10631c:L_0629C:891C:16
       t106332:pad_note_select_4:8932:46 t106378:track_calc_multi_2:8978:E6
       t10645e:L_063DE:8A5E:1A t106478:program_arm_field:8A78:66
       t1064de:pgm_midi_up:8ADE:1E t1064fc:pgm_midi_down:8AFC:24
       t106520:pgm_midi_left:8B20:18 t106538:t1_copy_pgm_cancel:8B38:18
       t106550:purge_midi:8B50:24 t106574:L_064F4:8B74:4C
       t1065c0:X_06540:8BC0:18 t1065d8:program_down:8BD8:18
       t1065f0:L_06570:8BF0:20 t106610:copy_program_arm_field:8C10:3E
       t10664e:X_065CE:8C4E:18 t106666:L_065E6:8C66:18
       t10667e:program_new:8C7E:38 t1066b6:X_06636:8CB6:18
       t1066ce:t1_program_copy:8CCE:32 t106700:fn_06680:8D00:56
       t106756:X_066D6:8D56:16 t10676c:X_066EC:8D6C:16
       t1067ae:io_near_stub:8DAE:58 t106806:fn_06786:8E06:20
       t106826:far_067A6:8E26:1C t106842:fn_067C2:8E42:3E
       t106880:io_ctrl_setup:8E80:3A t1068ba:fn_0683A:8EBA:30
       t1068ea:fn_0686A:8EEA:10 t106ae2:X_06A62:90E2:50
       t106f1a:dma_06E9A:951A:34 t106f4e:fn_06ECE:954E:24
       t106f72:fn_06EF2:9572:1A t10706c:dma_06FEC:966C:44
       t1070b0:fn_07030:96B0:1C t1070cc:fn_0704C:96CC:2A
       t107136:fn_070B6:9736:16 t10714c:fn_070CC:974C:16
       t107162:lcd_update_handler_70E2:9762:1E
       t1072e8:lcd_clear_display:98E8:98 t1072e8:L_07300:9980:26
       t1073a6:tgt_07326:99A6:C t1073b2:X_07332:99B2:C
       t107406:L_07386:9A06:12 t107418:L_07398:9A18:10 t107428:L_073A8:9A28:8
       t107488:X_07408:9A88:20 t1074ec:X_0746C:9AEC:1C t1rec:X_07488:9B08:18
       t1rec:X_074A0:9B20:18 t1rec:X_074B8:9B38:16 t1rec:X_074CE:9B4E:16
       t107564:lcd_port_handler:9B64:40 t1075a4:L_07524:9BA4:2A
       t1075ce:L_0754E:9BCE:CE t10769c:fn_0761C:9C9C:42
       t1076de:X_0765E:9CDE:C t1076ea:ctrl_stub_init:9CEA:28
       t107712:X_07692:9D12:C t10771e:X_0769E:9D1E:20 t10773e:X_076BE:9D3E:12
       t107750:X_076D0:9D50:12 t107762:fn_076E2:9D62:1E
       t107780:lcd_block_copy_7700:9D80:22 t1077a2:lcd_block_copy:9DA2:4C
       t1077ee:X_0776E:9DEE:C t1078c6:trim_start_fine_arm_field:9EC6:62
       t107928:X_078A8:9F28:2A t107952:X_078D2:9F52:26
       t107978:X_078F8:9F78:16 t10798e:X_0790E:9F8E:16
       t1079a4:trim_screen_enter:9FA4:2C t1079d0:start_fine_arm_field:9FD0:4E
       t107a1e:X_0799E:A01E:16 t107a34:X_079B4:A034:16
       t107a4a:L_079CA:A04A:14 t107a5e:end_fine_arm_field:A05E:4E
       t107aac:X_07A2C:A0AC:16 t107ac2:X_07A42:A0C2:16
       t107ad8:L_07A58:A0D8:14 t107aec:string_byte_scan:A0EC:CA
       t107bb6:X_07B36:A1B6:2A t107be0:X_07B60:A1E0:26
       t107c06:X_07B86:A206:16 t107c1c:X_07B9C:A21C:16
       t107c32:fit_to_length_cancel:A232:2C t107c5e:L_07BDE:A25E:54
       t107cb2:L_07C32:A2B2:16 t107cc8:X_07C48:A2C8:16
       t107cde:L_07C5E:A2DE:1A t107cf8:zone_start_fine_arm_field:A2F8:66
       t107d5e:zone_start_fine_up:A35E:2A
       t107d88:zone_start_fine_down:A388:26
       t107dae:zone_start_fine_right:A3AE:16
       t107dc4:zone_start_fine_left:A3C4:16 t107dda:zone_screen_enter:A3DA:2C
       t107e06:zone_end_fine_arm_field:A406:42 t107e48:X_07DC8:A448:16
       t107e5e:X_07DDE:A45E:16 t107e74:L_07DF4:A474:1A
       t107e8e:zone_edit_arm_field:A48E:42 t107ed0:X_07E50:A4D0:16
       t107ee6:X_07E66:A4E6:16 t107efc:L_07E7C:A4FC:1A
       t108086:zone_action_insert_start:A686:348
       t1084c2:zone_action_delete:AAC2:226 t108878:zone_edit_do_it:AE78:104
       t10897c:trim_arm_field:AF7C:110 t108a8c:X_08A0C:B08C:18
       t108aa4:X_08A24:B0A4:18 t108abc:X_08A3C:B0BC:16
       t108ad2:X_08A52:B0D2:16 t108ae8:snd_params_screen_enter:B0E8:1E
       t108b06:X_08A86:B106:62 t108c04:X_08B84:B204:66
       t108c6a:tgt_08BEA:B26A:62 t108d2a:fn_08CAA:B32A:24
       t108d4e:file_exists_rename:B34E:C t108d5a:file_exists_refresh:B35A:C
       t108d66:X_08CE6:B366:1C t108d82:X_08D02:B382:C t108d8e:L_08D0E:B38E:2E
       t108dbc:X_08D3C:B3BC:C t108dc8:X_08D48:B3C8:18 t108de0:L_08D60:B3E0:1E
       t108dfe:L_08D7E:B3FE:1E t1090f4:lcd_area_setup:B6F4:3C
       t109310:lcd_clear_area:B910:2B6 t1095c6:lcd_clear_wrapper:BBC6:3A
       t109600:lcd_area_wrapper_1:BC00:12 t109612:lcd_area_wrapper_2:BC12:12
       t1096fa:status_read_multi:BCFA:BA t1097b4:status_poll_delay:BDB4:2E
       t1097e2:int2F_fn5_caller:BDE2:32 t109814:status_poll_handler:BE14:34
       t109848:pad_velocity_handler:BE48:4C
       t109a90:voice_play_request:C090:9A t109b2a:midi_realtime_start:C12A:A4
       t109bce:midi_realtime_continue:C1CE:74 t109d6e:X_09FE0:C36E:4A
       t109db8:X_0A02A:C3B8:52 t109eb8:seq_init_navigation:C4B8:22
       t109eda:seq_next_track:C4DA:2C t109f06:seq_prev_track:C506:2C
       t109f32:seq_event_handler:C532:A2 t109fd4:track_event_handler:C5D4:E8
       t10a0bc:lcd_clear_line:C6BC:119 t10a0bc:smem_access_handler_1:C7D6:A2
       t10a278:status_poll_delay2:C878:2E t10a2a6:status_smem_read:C8A6:32
       t10a33c:smem_access_setup:C93C:29A t10a79a:fn_0AA0C:CD9A:38
       t10a7d2:fn_0AA44:CDD2:14 t10aa5a:int4A_proc_caller:D05A:32
       t10aac8:fn_0AD3A:D0C8:3A t10ab02:far_0AD74:D102:32
       t10ab34:midi_txrx_arm_field:D134:B2 t10abe6:X_0AE58:D1E6:34
       t10ac1a:L_0AE8C:D21A:2E t10ac48:tgt_0AEBA:D248:36
       t10ac7e:X_0AEF0:D27E:40 t10acbe:X_0AF30:D2BE:1C
       t10acda:X_0AF4C:D2DA:3C t10aeae:sysex_sub_dispatch:D4AE:274
       t10b122:lcd_clear_buffer:D722:1AA t10b328:L_0B5DC:D928:A
       t10b332:ui_enter_sound_dialog:D932:4C t10b37e:fn_0B642:D97E:E
       t10b38c:tgt_0B650:D98C:1A t10b440:ui_sound_dialog_draw:DA40:62
       t10b4a2:keep_or_retry_up:DAA2:14 t10b4b6:keep_or_retry_down:DAB6:14
       t200026:L_00026:DB26:10 t2000ce:port_c0_write:DBCE:6
       t2000d4:port_c0_read:DBD4:4 t2000d8:L_000D8:DBD8:6
       t200106:L_00106:DC06:10 t200116:L_00116:DC16:10
       t2disp:cmd_dispatch_1E:DC6A:32 t2disp:cmd_ratio_setup:DC9C:2E
       t2disp:cmd_far_stub:DCCA:16 t2disp:draw_unsigned_value:DCE0:38
       t2dlist:ratio_calc_divide:DD58:6A t2dlist:cmd_dispatch_setup:DDC2:2C
       t2dlist:cmd_param_setup:DDEE:3A t2dlist:string_copy_scan:DE28:5C
       t2dlist:cmd_build_params:DE84:34 t2dlist:display_coord_setup:DEB8:20
       t2dlist:cmd_far_stub2:DED8:16 t2dlist:string_copy_setup:DEEE:2E
       t2dlist:string_copy_movsb:DF1C:3E t2dlist:cmd_exec_0E_wrapper:DF5A:16
       t2dlist:cmd_track_setup:DF70:2C t2dlist:cmd_dispatch_0E:DF9C:2C
       t2dlist:string_fill_stosb:DFC8:3A t2dlist:cmd_build_dispatch:E002:44
       t2inst:cmd_caller_setup:E082:32 t2inst:install_handler:E0B4:28
       t2inst:install_handler_15:E0DC:26 t2inst:X_00610:E102:A
       t2inst:delay_ticks:E10C:1E t2inst:install_text2_vectors:E12A:32
       t20067e:mem_block_process:E17E:66 t2006e4:bcd_display_calc:E1E4:46
       t2009a6:bcd_convert:E4A6:32 t200aa2:err_msg_report:E5A2:22
       t2flash:X_00AF2:E5E4:28 t2flash:L_00B1A:E60C:24
       t2flash:X_00B3E:E630:46 t2flash:cmd_dispatch_handler_1:E676:66
       t200dc8:L_00DE8:E8C8:E t200dd6:X_00DF6:E8D6:42
       t200e18:string_copy_cmd:E918:3E t200e56:X_00E76:E956:16
       t200fb6:port_c2_write:EAB6:6 t200fda:smem_read_words:EADA:1E
       t201216:samples_to_tenths:ED16:18 t2fcmd:flash_board_idle:EDA6:E
       t2fcmd:flash_vpp_on:EDB4:E t2fcmd:far_012E2:EDC2:E
       t2fcmd:far_012F0:EDD0:C t2fcmd:flash_read_identifier:EDDC:48
       t2fcmd:mem_op_wrapper_2:EE24:40 t2fpage:io_delay_wait:EEB4:20
       t2fpage:mem_op_wrapper_4:EED4:42 t2fpage:mem_op_wrapper_5:EF16:3E
       t201454:mem_op_handler:EF54:3A t201500:system_call_handler:F000:5A
       t20155a:string_memop_setup:F05A:3E t2015e0:dma_01600:F0E0:6
       t2015e6:dma_status_rearm:F0E6:A t2015f0:L_01610:F0F0:1A
       t20160a:L_0162A:F10A:28 t2017e6:X_01806:F2E6:E t201852:L_01872:F352:14
       t201890:L_018D0:F390:14 t2018a4:dma_018ee:F3A4:62
       t201906:lcd_write_data:F406:86 t2timer:L_01A0C:F48C:20
       t2timer:timer_system:F4AC:36 t2timer:pending_ops_set:F4E2:E
       t2timer:L_01A70:F4F0:5E t2timer:X_01AD4:F54E:22
       t201a70:smem_dma_channel_01:F570:2A
       t201a9a:lcd_clear_region_impl:F59A:4C t201ae6:far_01B6C:F5E6:C
       t201af2:smem_dma_channel_23:F5F2:2A t201b1c:lcd_clear_rect:F61C:50
       t201b6c:lcd_write_block_D3B2:F66C:C t201d12:far_01D98:F812:10
       t201d22:sound_event_dispatch:F822:94
       t201db6:smem_addr_data_ctrl:F8B6:54 t201e7a:far_01F00:F97A:26
       t201ea0:smem_addr_data_status:F9A0:16 t201eb6:pad_note_release:F9B6:46
       t201efc:note_off_voices:F9FC:6A t201f66:sample_dma_setup_large:FA66:12
       t201f78:string_scan_status:FA78:4A t201fc2:pad_event_dispatch:FAC2:66
       t202028:X_020AE:FB28:36 t20205e:voice_buf_helper_1:FB5E:24
       t202082:voice_buf_helper_2:FB82:1C t2020c8:voice_timer_expire:FBC8:66
       t20218e:voice_alloc:FC8E:19A t202514:voice_release_by_note:10014:28
       t20253c:voice_start:1003C:20A t2voice:voice_release_all:10246:12
       t2voice:voice_release_full:10258:32 t2voice:voice_release:1028A:44
       t2027ce:lcd_set_cursor:102CE:22A t2029f8:voice_release_all_if:104F8:14
       t202a0c:voice_start_sample:1050C:1C0 t202bcc:midi_note_io:106CC:14
       t202cc4:X_02D4A:107C4:A t202cce:X_02D54:107CE:22
       t202cf0:X_02D76:107F0:2A t202d1a:X_02DA0:1081A:E
       t202d28:field_edit_disable:10828:1A t202d42:far_02DC8:10842:A
       t202d4c:far_02DD2:1084C:14 t202d60:win_keys_merge_disable:10860:A
       t202d6a:field_redraw:1086A:6 t202ddc:field_value_store:108DC:6E
       t203242:status_read_6A:10D42:3A t20327c:status_read_6A_2:10D7C:3C
       t2032b8:status_read_6A_3:10DB8:3E t2032f6:field_register_s8:10DF6:3E
       t2033ac:X_03432:10EAC:58 t203404:voice_port_read:10F04:4E
       t203452:voice_port_read2:10F52:4E
       t2034a0:midi_channel_handler:10FA0:A0 t203540:midi_msg_io:11040:26
       t203566:X_035EC:11066:28 t20358e:L_03614:1108E:18
       t2035a6:X_0362C:110A6:2A t2035d0:T2_X_03656:110D0:24
       t2035f4:X_0367A:110F4:22 t203616:far_0369C:11116:24
       t20363a:X_036C0:1113A:30 t2036c0:L_03746:111C0:64
       t203724:T2_L_037AA:11224:1E t203742:timer_dma_ch2:11242:40
       t2037f2:voice_trigger_full:112F2:42
       t203834:timer_value_read_1:11334:3C
       t203870:timer_value_read_2:11370:3C
       t20390c:timer_value_read_3:1140C:3E
       t20394a:timer_value_read_4:1144A:68
       t2039fe:timer_value_read_5:114FE:38
       t203a36:name_edit_change_default:11536:20 t203a9e:X_03B24:1159E:3E
       t203ae6:show_dev_credits_scroll:115E6:C4 t203baa:L_03C30:116AA:26
       t203bd0:L_03C56:116D0:16 t203be6:voice_block_copy:116E6:5C
       t203c42:L_03CF8:11742:16 t203c58:X_03D0E:11758:16
       t203cca:tgt_03D80:117CA:14 t203cde:far_03DAA:117DE:2A
       t203d08:L_03DD4:11808:2A t203e7c:voice_param_proc:1197C:A6
       t203f22:note_clamp_flag:11A22:44 t203f66:note_range_clamp:11A66:44
       t203faa:L_040F4:11AAA:C t203fb6:read_io_chain:11AB6:38
       t203fee:X_04138:11AEE:8C t20407a:channel_validate:11B7A:1E
       t204098:channel_get_ptr:11B98:24 t204110:X_0425A:11C10:10
       t204120:L_0426A:11C20:6 t204126:L_04270:11C26:24
       t20414a:track_select_setup:11C4A:8A t204298:L_043E2:11D98:C
       t2042a4:L_043EE:11DA4:34 t2042d8:L_04422:11DD8:6
       t2042de:X_04428:11DDE:1C t2042fa:voice_process_setup:11DFA:5A
       t204354:X_0449E:11E54:18 t204404:L_0454E:11F04:C
       t204410:X_0455A:11F10:2E t20443e:L_04588:11F3E:22
       t204460:L_045AA:11F60:10 t204470:L_045BA:11F70:E0
       t204550:track_process_full:12050:E0
       t204630:track_process_ext:12130:10E t20473e:X_04888:1223E:40
       t2047c8:cmd_exec_pair:122C8:68 t204890:X_049DA:12390:2C
       t2048bc:cmd_exec_1E:123BC:60 t20491c:cmd_dispatch_caller2:1241C:7C
       t204998:cmd_dispatch_handler_2:12498:4C t2049e4:fx_redraw:124E4:E
       t2049f2:far_04B42:124F2:E t204a6e:voice_dispatch_table:1256E:6A
       t204ad8:fx_type_load:125D8:40 t204b18:tgt_04C68:12618:22
       t204b3a:far_04C8A:1263A:26 t204b60:L_04CB0:12660:12
       t204b72:X_04CC2:12672:2C t204b9e:L_04CEE:1269E:C
       t204baa:L_04CFA:126AA:10 t204bba:L_04D0A:126BA:10
       t204bca:L_04D1A:126CA:C t204bd6:filter4_f2:126D6:10
       t204be6:filter4_f3:126E6:10 t204bf6:far_04D46:126F6:38
       t204c2e:L_04D7E:1272E:3A t204c68:fx_type_load_select:12768:C
       t204c74:L_04DC4:12774:10 t204c84:L_04DD4:12784:10
       t204c94:L_04DE4:12794:40 t204cd4:X_04E24:127D4:18
       t204cec:fx_chorus_paint:127EC:70 t204d5c:fx_rotary_paint:1285C:98
       t204df4:L_04F44:128F4:B8 t204f0e:lcd_init_display:12A0E:4C
       t204f5a:L_050AA:12A5A:1A t204f74:cmd_exec_multi:12A74:48
       t204fbc:status_read_6A_4:12ABC:CE t20508a:L_051DA:12B8A:14
       t20509e:L_051EE:12B9E:C t2050aa:L_051FA:12BAA:10
       t2050ba:L_0520A:12BBA:10 t2050ca:L_0521A:12BCA:12
       t2050dc:L_0522C:12BDC:26 t205102:cmd_exec_2:12C02:96
       t205198:L_052E8:12C98:A6 t20523e:L_0538E:12D3E:C
       t20524a:L_0539A:12D4A:10 t20525a:L_053AA:12D5A:10
       t20526a:L_053BA:12D6A:14 t20527e:cmd_exec_7:12D7E:FC
       t20537a:L_054E4:12E7A:14 t20538e:fx_mixer_lr_paint:12E8E:72
       t205522:copy_fx_close:13022:E t205530:copy_fx_paint:13030:66
       t205596:far_05700:13096:C t2055a2:int38_call_9e:130A2:14
       t2055b6:int38_call_02:130B6:14 t2055ca:int38_call_pair:130CA:14
       t2055f6:L_05760:130F6:26 t205658:cmd_exec_1E_ext:13158:28
       t205680:cmd_dispatch_handler_3:13180:58 t2056d8:L_05844:131D8:64
       t20573c:program_select:1323C:88
       t2057c4:program_select_wrapper:132C4:2E t2057f2:smem_dma_init:132F2:14
       t205806:X_05972:13306:20 t205850:far_059BC:13350:24
       t205874:_memcpy_2:13374:3C t20598c:_memset_2:1348C:44
       t2059d0:far_memop_str_1:134D0:30 t205a00:_memcpy_3:13500:32
       t205a94:timer_io_setup:13594:38 t205b36:smem_proc_wrapper:13636:16
       t205b4c:smem_transfer_io:1364C:3E t205b8a:seq_select_setup_1:1368A:14
       t205b9e:seq_select_setup_2:1369E:14 t205bb2:L_05D1E:136B2:C
       t205bbe:loop_seq_handler:136BE:28 t205be6:smem_loop_proc:136E6:28
       t205c0e:L_05C0E:1370E:1C t205c2a:smem_rep_str:1372A:40
       t205c6a:L_05DD6:1376A:2C t205c96:L_05E02:13796:32
       t205cc8:L_05E34:137C8:8 t205d82:L_05EEE:13882:C
       t205d8e:L_05EFA:1388E:1C t205daa:pgm_midi_key_33:138AA:1A
       t205dc4:pgm_midi_refresh:138C4:18 t205ddc:pgm_midi_paint:138DC:68
       t205e44:pgm_assign_key:13944:38 t205e7c:seq_port_io:1397C:36
       t205eb2:seq_port_io2:139B2:34 t205ee6:note_release_latched:139E6:24
       t205ffa:seq_write_data:13AFA:3E t206038:program_close:13B38:22
       t20605a:copy_pgm_refresh:13B5A:24 t20607e:program_paint:13B7E:5C
       t2060da:t2_copy_pgm_cancel:13BDA:14 t2060ee:X_064CC:13BEE:C
       t2060fa:delete_pgm_do_it:13BFA:46 t206140:delete_pgm_paint:13C40:24
       t206164:program_delete:13C64:3E t2061a2:L_06580:13CA2:1C
       t2061be:delete_all_pgms_do_it:13CBE:12
       t2061d0:delete_all_pgms_paint:13CD0:12
       t2061e2:delete_pgm_allpgm:13CE2:12 t20628c:L_0666A:13D8C:50
       t2062dc:copy_pgm_do_it:13DDC:42 t20631e:copy_pgm_paint:13E1E:32
       t20640a:X_067E8:13F0A:4C t206456:far_06834:13F56:16
       t20646c:L_0684A:13F6C:E t20647a:mixer_stereo_page:13F7A:24
       t20649e:note_pitch_calc_1:13F9E:5A t2064f8:note_pitch_calc_2:13FF8:6C
       t206628:note_pitch_calc_cmd:14128:7E
       t2066a6:dispatch_handler_2:141A6:1C t2066c2:mixer_indiv_page:141C2:24
       t2066e6:note_range_calc_1:141E6:5E t206744:note_range_calc_2:14244:68
       t2067ac:bcd_arithmetic_2:142AC:4E t2067fa:bcd_arithmetic_3:142FA:4C
       t2068fe:dispatch_handler_1:143FE:16 t206914:mixer_fxsend_page:14414:24
       t206938:note_range_calc_3:14438:5E t206996:note_range_calc_4:14496:68
       t2069fe:timer_dma_setup:144FE:40 t206a3e:timer_dma_setup2:1453E:40
       t206a7e:note_range_calc_cmd:1457E:76 t206af4:timer_dma_setup3:145F4:16
       t206b0a:sample_dispatch_table:1460A:92 t206d1c:L_070FA:1481C:1C
       t206d38:mix_pan_store:14838:20 t206d58:L_07136:14858:1E
       t206d76:L_07154:14876:26 t206d9c:timer_poll_wait_5:1489C:34
       t206dd0:L_071AE:148D0:1E t206dee:L_071CC:148EE:1E
       t206e0c:timer_str_handler:1490C:1DA t2mix:channel_settings_up:14AE6:2E
       t2mix:channel_settings_down:14B14:26
       t2mix:channel_settings_left:14B3A:2C
       t2mix:channel_settings_right:14B66:2A t2mix:pad_note_select_5:14B90:4E
       t2mix:channel_settings_close:14BDE:32
       t2072c0:sample_data_load_1:14DC0:5C t2074d4:sample_desc_init:14FD4:32
       t207506:far_078E4:15006:1C t207522:far_07900:15022:3C
       t20755e:sample_caller_setup:1505E:30
       t2075fc:sample_data_load_2:150FC:7A t207676:sample_ptr_helper:15176:5A
       t2076d0:sample_check_active:151D0:36
       t20781c:fdc_port_90_access:1531C:18 t207834:X_07C12:15334:C
       t207840:timer_fdc_sync:15340:76 t2079b4:X_07D92:154B4:20
       t2079d4:tgt_07DB2:154D4:12 t207b36:X_07F14:15636:1E
       t207b54:mode_dispatch_index:15654:22
       t207b76:voice_trigger_caller:15676:34 t207baa:ui_field_edit:156AA:46
       t207bf0:snd_window_refresh_key:156F0:14 t207c32:far_08010:15732:12
       t207c44:cmd_exec_caller:15744:AA t207e2c:cmd_ratio_calc:1592C:74
       t207fde:sample_name_search:15ADE:60 t208208:X_085E6:15D08:4E
       t208256:sample_load_wrapper:15D56:2C t208358:X_08736:15E58:9E
       t2083f6:tgt_087D4:15EF6:4A t208440:snd_edit_page_return:15F40:44
       t208484:sample_voice_init:15F84:90 t2sdel:delete_sound_paint:16014:48
       t2sdel:L_0855C:1605C:22 t2sdel:delete_all_sounds_do_it:1607E:4E
       t2sdel:delete_all_sounds_paint:160CC:12
       t2sdel:delete_sound_all:160DE:22 t2sdel:voice_init_caller:16100:5E
       t2sdel:L_0865E:1615E:2C t2sdel:L_0868A:1618A:62
       t208780:L_08B5E:16280:36 t208a60:L_08E48:16560:36
       t208caa:L_09092:167AA:20 t2wave:X_090B2:167CA:22
       t2wave:L_090D4:167EC:12 t2wave:L_090E6:167FE:E t2wave:X_090F4:1680C:22
       t2wave:L_09116:1682E:E t208d3c:X_09124:1683C:BA
       t2zoom:wave_zoom_double:168F6:14 t2zoom:wave_zoom_halve:1690A:1E
       t2zoom:L_09210:16928:82 t2zoom:L_09292:169AA:16
       t2zoom:X_092A8:169C0:1A t2zoom:L_092C2:169DA:82
       t2zoom:L_09344:16A5C:16 t2zoom:X_0935A:16A72:1A
       t2trim:discard_do_it:16BFE:48 t2trim:discard_paint:16C46:12
       t2trim:L_09544:16C58:2C t2091e4:sample_str_scan_4:16CE4:48
       t20940a:sample_str_scan_6:16F0A:44 t209514:L_09900:17014:E
       t209522:L_0990E:17022:E t209530:X_0991C:17030:D0
       t209600:display_draw_pair:17100:86 t209686:L_09A72:17186:16
       t20969c:X_09A88:1719C:1A t2096b6:fit_to_length_paint:171B6:12
       t209734:X_09B20:17234:2C t2097d4:zone_range_clamp:172D4:82
       t209856:tgt_09C42:17356:52 t2098a8:ui_edit_zone_start:173A8:54
       t209954:ui_edit_zone_end:17454:54
       t2099a8:zone_start_fine_key_33:174A8:E
       t2099b6:zone_start_fine_paint:174B6:AC t209a62:L_09E4E:17562:6C
       t209ace:L_09EBA:175CE:16 t209ae4:X_09ED0:175E4:1A
       t209afe:X_09EEA:175FE:6C t209b6a:X_09F56:1766A:16
       t209b80:X_09F6C:17680:1A t209b9a:zone_edit_paint:1769A:A8
       t209c42:zone_edit_up:17742:4C t209c8e:L_0A07A:1778E:42
       t209cd0:zone_edit_cancel:177D0:E t209cde:X_0A0CA:177DE:4E
       t209f36:range_seq_caller:17A36:8A t20a154:range_proc_setup:17C54:1C
       t20a170:range_process:17C70:90 t20a296:far_0A682:17D96:78
       t20a30e:far_0A6FA:17E0E:8C t20a8ec:lcd_line_copy:183EC:32
       t20a91e:_memcpy_1650C:1841E:30 t20a94e:lcd_region_helper:1844E:2A
       t20ac58:X_0B090:18758:2E t20ac86:L_0B0BE:18786:3E
       t20acc4:sample_proc_helper:187C4:72 t20ad36:sample_data_copy:18836:44
       t20ad7a:_memcpy_5:1887A:4C t20adc6:sample_access_caller:188C6:44
       t20ae0a:file_exists_paint:1890A:38 t20ae42:X_0B27A:18942:16
       t20ae58:X_0B290:18958:16 t20ae6e:X_0B2A6:1896E:1A
       t20ae88:X_0B2C0:18988:36 t20aebe:ui_enter_pad_assign:189BE:40
       t20aefe:sample_ptr_caller:189FE:6C t20b0d0:midi_out_io2:18BD0:32
       t20b63c:sample_io_handler:1913C:30 t20b66c:midi_string_setup:1916C:FA
       t20b7ee:tgt_0BC26:192EE:A t20b7f8:far_0BC30:192F8:24
       t20b81c:sample_calc_position:1931C:6E t2ldsnd:load_sound_up:1938A:1E
       t2ldsnd:load_sound_down:193A8:1E t2ldsnd:load_sound_refresh:193C6:8
       t2ldsnd:smem_read_handler:193CE:80 t20b94e:sample_load_entry:1944E:3DE
       t20bd2c:sample_load_step:1982C:C4 t20bdf0:far_0C228:198F0:E
       t20bdfe:X_0C236:198FE:22 t2chdisk:change_disk_refresh:19920:E
       t2chdisk:change_disk_paint:1992E:1E
       t2chdisk:change_disk_do_it:1994C:62 t20c028:smem_block_alloc:19B28:70
       t20c192:ctrl_port_caller:19C92:6E t20c528:smem_ctrl_setup_1:1A028:68
       t20c590:ctrl_port_48_B8:1A090:32 t20c5c2:pgm_file_write:1A0C2:90
       t20c652:ctrl_port_48_B8_3:1A152:6A t20c6bc:smem_ctrl_setup_2:1A1BC:3C
       t20c6f8:ctrl_port_48_read:1A1F8:32 t20c72a:envelope_process_2:1A22A:A0
       t20c7ca:_memcpy_6:1A2CA:20 t20c7ea:ctrl_port_48_read2:1A2EA:72
       t20c958:far_0CDBA:1A458:1E t20c9d4:sample_access_short:1A4D4:32
       t20ca06:sample_access_triple:1A506:50 t20ca78:smem_block_skip:1A578:32
       t20cc9c:data_far_write:1A79C:150 t2rcv:L_0CDEC:1A8EC:12
       t2rcv:L_0CDFE:1A8FE:12 t20ce20:keep_or_retry_paint:1A920:4A
       t20ce6a:X_0D332:1A96A:12 t20ce7c:X_0D344:1A97C:12
       t20ce8e:X_0D356:1A98E:20 t20ceae:string_far_access:1A9AE:58
       t20cf06:mono_to_stereo_paint:1AA06:48
       t20cf4e:mono_to_stereo_up:1AA4E:26
       t20cf74:mono_to_stereo_down:1AA74:16
       t20cf8a:sample_string_access:1AA8A:21C
       t20d1fc:stereo_to_mono_paint:1ACFC:44
       t20d240:stereo_to_mono_up:1AD40:16
       t20d256:stereo_to_mono_down:1AD56:16
       t20d26c:sample_process_large:1AD6C:29A"
FN172="t10240a:mpc_mode_setup:4B62:6E t102478:system_setup_2:4BD0:50
       t1024c8:L_02420:4C20:34 t1024e2:smem_pool_insert:4C54:52
       t102534:smem_pool_remove:4CA6:8E t1025c2:smem_alloc:4D34:5C
       t10261e:midi_status_process:4D90:3A t102658:smem_free:4DCA:E
       t1028a6:buffer_init:5020:4A t1029b0:dsp_0292A:512A:3C
       t102a7e:pad_note_trigger:51F8:20A t102c88:note_voice_prepare:5402:236
       t102f52:voice_pitch_ratio:56CC:56 t103132:mpc_status_read:58AC:D0
       t103202:mpc_status_wait:597C:3E t103582:field_register:5CFC:98
       t10361a:far_call_wrapper_1:5D94:5E t103678:far_035F2:5DF2:44
       t1036bc:mixer_arm_field:5E36:62 t10371e:L_03698:5E98:16
       t1mixer:X_036AE:5EAE:16 t1mixer:X_036C4:5EC4:18
       t1mixer:X_036DC:5EDC:18 t1mixer:mixer_setup:5EF4:22
       t10379c:X_03716:5F16:E t1037aa:fn_03724:5F24:72
       t1fxmod:X_03796:5F96:20 t1fxmod:X_037B6:5FB6:1C
       t1fxmod:X_037D2:5FD2:16 t1fxmod:X_037E8:5FE8:16
       t1fxmod:X_037FE:5FFE:38 t103916:X_03890:6090:6
       t1fxedit:X_03896:6096:24 t1fxedit:X_038BA:60BA:1C
       t1fxedit:X_038D6:60D6:16 t1fxedit:X_038EC:60EC:16
       t103988:fn_03902:6102:60 t1039e8:ui_screen_enter:6162:46
       t103a2e:X_039A8:61A8:1E t103a4c:L_039C6:61C6:86
       t103ad2:fx_dist_arm_field:624C:9E t1fxdist:X_03AEA:62EA:16
       t1fxdist:X_03B00:6300:16 t1fxdist:X_03B16:6316:18
       t1fxdist:X_03B2E:632E:18 t1fxdist:X_03B46:6346:1E
       t103bea:filter4_paint:6364:134 t103d1e:midi_note_handler:6498:19A
       t103eb8:filter4_up:6632:3A t103f2e:filter4_left:66A8:28
       t103f56:filter4_right:66D0:36
       t103f8c:ctrl_change_table_dispatch:6706:38 t103fc4:X_03F3E:673E:1E
       t103fe2:fx_mod_arm_field:675C:A0 t1fxchor:fx_chorus_up:67FC:16
       t1fxchor:fx_chorus_down:6812:16 t1fxchor:fx_chorus_left:6828:18
       t1fxchor:fx_chorus_right:6840:18 t1fxchor:X_04058:6858:1E
       t1040fc:fx_rotary_arm_field:6876:BE t1041ba:fx_rotary_up:6934:24
       t1041de:fx_rotary_down:6958:1E t1041fc:fx_rotary_left:6976:2C
       t104228:fx_rotary_right:69A2:2C t104254:X_041CE:69CE:1E
       t104272:fx_autopan_arm_field:69EC:D8 t10434a:X_042C4:6AC4:24
       t10436e:X_042E8:6AE8:1E t10438c:X_04306:6B06:20
       t1043ac:L_04326:6B26:2C t1043d8:X_04352:6B52:1E
       t1043f6:fx_pitch_arm_field:6B70:E8 t1044de:fx_pitch_shift_up:6C58:24
       t104502:fx_pitch_shift_down:6C7C:2C
       t10452e:fx_pitch_shift_left:6CA8:2A
       t104558:fx_pitch_shift_right:6CD2:20
       t104578:ui_screen_enter_chan:6CF2:4E
       t1045c6:midi_dispatch_table:6D40:4A t104706:X_04680:6E80:16
       t10471c:X_04696:6E96:24 t104740:X_046BA:6EBA:18
       t104758:X_046D2:6ED2:18 t104770:fx_echo_st_arm_field:6EEA:F4
       t104864:X_047DE:6FDE:24 t104888:X_04802:7002:1E
       t1048a6:X_04820:7020:2C t1048d2:X_0484C:704C:2A
       t1048fc:X_04876:7076:1E t10491a:int2E_read_caller:7094:116
       t104b6e:X_04AE8:72E8:24 t104b92:X_04B0C:730C:1E
       t104bb0:L_04B2A:732A:18 t104bc8:L_04B42:7342:3C
       t104c04:audio_dispatch_table:737E:3E t104c42:midi_status_read:73BC:138
       t104d62:fx_mixer_up:74F4:2E t104d90:fx_mixer_down:7522:2C
       t104dbc:fx_mixer_left:754E:2C t104dec:fx_mixer_right:757A:2A
       t104e24:ui_screen_enter_edit:75A4:3E
       t104e62:fx_mixer_arm_field:75E2:76 t104ed8:fx_mixer_lr_left:7658:18
       t104ef0:fx_mixer_lr_right:7670:18 t104f08:L_04E88:7688:34
       t104f3c:fx_copy_arm_field:76BC:5C t1copyfx:copy_fx_up:7718:16
       t1copyfx:copy_fx_down:772E:16 t104fc4:track_calc_offset:7744:16
       t104fda:X_04F5A:775A:1C t104ff6:X_04F76:7776:24
       t10501a:X_04F9A:779A:34 t10504e:X_04FCE:77CE:24
       t105072:X_04FF2:77F2:20 t105092:L_05012:7812:26
       t1050b8:timer_poll_wait_1:7838:3C t1050f4:L_05074:7874:22
       t105116:pad_sw2_clamp:7896:24 t10513a:L_050BA_1:78BA:2A
       t105164:X_050E4:78E4:32 t105196:X_05116:7916:2A
       t1051c0:X_05140:7940:32 t1051f2:X_05172:7972:1C
       t10520e:L_0518E:798E:1C t105276:assign_view_key_up:79F6:38
       t1052e6:assign_view_key_left:7A66:38
       t10531e:assign_view_key_right:7A9E:38 t105356:L_052D6:7AD6:28
       t1054f8:pgm_assign_enter:7C78:64 t105648:timer_poll_wait_2:7DC8:42
       t10568a:L_0560A:7E0A:36 t1057f6:X_05776:7F76:3E
       t105834:track_calc_offset2:7FB4:16 t10584a:timer_dma_sync:7FCA:186
       t1059d0:X_05950:8150:18 t1059e8:L_05968:8168:18
       t105a00:L_05980:8180:18 t105a18:L_05998:8198:18
       t105a30:pad_note_select:81B0:46 t105a76:timer_poll_wait_3:81F6:14A
       t105bc0:pgm_params_enter:8340:24 t105be4:velo_mod_arm_field:8364:92
       t105c76:X_05BF6:83F6:16 t105c8c:X_05C0C:840C:16
       t105ca2:timer_status_handler:8422:4C t105daa:L_05D2A:852A:26
       t105dd0:timer_poll_wait_4:8550:BA t105e8a:X_05E0A:860A:24
       t105eae:X_05E2E:862E:16 t105ec4:X_05E44:8644:18
       t105edc:X_05E5C:865C:2A t105f06:pad_note_select_2:8686:4C
       t106040:L_05FC0:87C0:26 t106066:velo_pitch_arm_field:87E6:98
       t1060fe:T1_L_0607E:887E:18 t106116:L_06096:8896:18
       t10612e:L_060AE:88AE:18 t106146:L_060C6:88C6:18
       t10615e:pad_note_select_3:88DE:4C t1061aa:timer_status_check_3:892A:E4
       t10628e:L_0620E:8A0E:26 t1062b4:mute_assign_row_dispatch:8A34:52
       t106306:X_06286:8A86:16 t10631c:L_0629C:8A9C:16
       t106332:pad_note_select_4:8AB2:46 t106378:track_calc_multi_2:8AF8:E6
       t10645e:L_063DE:8BDE:1A t106478:program_arm_field:8BF8:66
       t1064de:pgm_midi_up:8C5E:1E t1064fc:pgm_midi_down:8C7C:24
       t106520:pgm_midi_left:8CA0:18 t106538:t1_copy_pgm_cancel:8CB8:18
       t106550:purge_midi:8CD0:24 t106574:L_064F4:8CF4:4C
       t1065c0:X_06540:8D40:18 t1065d8:program_down:8D58:18
       t1065f0:L_06570:8D70:20 t106610:copy_program_arm_field:8D90:3E
       t10664e:X_065CE:8DCE:18 t106666:L_065E6:8DE6:18
       t10667e:program_new:8DFE:38 t1066b6:X_06636:8E36:18
       t1066ce:t1_program_copy:8E4E:32 t106700:fn_06680:8E80:56
       t106756:X_066D6:8ED6:16 t10676c:X_066EC:8EEC:16
       t1067ae:io_near_stub:8F2E:58 t106806:fn_06786:8F86:20
       t106826:far_067A6:8FA6:1C t106842:fn_067C2:8FC2:3E
       t106880:io_ctrl_setup:9000:3A t1068ba:fn_0683A:903A:30
       t1068ea:fn_0686A:906A:10 t106ae2:X_06A62:9262:50
       t106f1a:dma_06E9A:969A:34 t106f4e:fn_06ECE:96CE:24
       t106f72:fn_06EF2:96F2:1A t10706c:dma_06FEC:97EC:44
       t1070b0:fn_07030:9830:1C t1070cc:fn_0704C:984C:2A
       t107136:fn_070B6:98B6:16 t10714c:fn_070CC:98CC:16
       t107162:lcd_update_handler_70E2:98E2:1E
       t1072e8:lcd_clear_display:9A68:98 t1072e8:L_07300:9B00:26
       t1073a6:tgt_07326:9B26:C t1073b2:X_07332:9B32:C
       t107406:L_07386:9B86:12 t107418:L_07398:9B98:10 t107428:L_073A8:9BA8:8
       t107488:X_07408:9C08:20 t1074ec:X_0746C:9C6C:1C t1rec:X_07488:9C88:18
       t1rec:X_074A0:9CA0:18 t1rec:X_074B8:9CB8:16 t1rec:X_074CE:9CCE:16
       t107564:lcd_port_handler:9CE4:40 t1075a4:L_07524:9D24:2A
       t1075ce:L_0754E:9D4E:CE t10769c:fn_0761C:9E1C:42
       t1076de:X_0765E:9E5E:C t1076ea:ctrl_stub_init:9E6A:28
       t107712:X_07692:9E92:C t10771e:X_0769E:9E9E:20 t10773e:X_076BE:9EBE:12
       t107750:X_076D0:9ED0:12 t107762:fn_076E2:9EE2:1E
       t107780:lcd_block_copy_7700:9F00:22 t1077a2:lcd_block_copy:9F22:4C
       t1077ee:X_0776E:9F6E:C t1078c6:trim_start_fine_arm_field:A046:62
       t107928:X_078A8:A0A8:2A t107952:X_078D2:A0D2:26
       t107978:X_078F8:A0F8:16 t10798e:X_0790E:A10E:16
       t1079a4:trim_screen_enter:A124:2C t1079d0:start_fine_arm_field:A150:4E
       t107a1e:X_0799E:A19E:16 t107a34:X_079B4:A1B4:16
       t107a4a:L_079CA:A1CA:14 t107a5e:end_fine_arm_field:A1DE:4E
       t107aac:X_07A2C:A22C:16 t107ac2:X_07A42:A242:16
       t107ad8:L_07A58:A258:14 t107aec:string_byte_scan:A26C:CA
       t107bb6:X_07B36:A336:2A t107be0:X_07B60:A360:26
       t107c06:X_07B86:A386:16 t107c1c:X_07B9C:A39C:16
       t107c32:fit_to_length_cancel:A3B2:2C t107c5e:L_07BDE:A3DE:54
       t107cb2:L_07C32:A432:16 t107cc8:X_07C48:A448:16
       t107cde:L_07C5E:A45E:1A t107cf8:zone_start_fine_arm_field:A478:66
       t107d5e:zone_start_fine_up:A4DE:2A
       t107d88:zone_start_fine_down:A508:26
       t107dae:zone_start_fine_right:A52E:16
       t107dc4:zone_start_fine_left:A544:16 t107dda:zone_screen_enter:A55A:2C
       t107e06:zone_end_fine_arm_field:A586:42 t107e48:X_07DC8:A5C8:16
       t107e5e:X_07DDE:A5DE:16 t107e74:L_07DF4:A5F4:1A
       t107e8e:zone_edit_arm_field:A60E:42 t107ed0:X_07E50:A650:16
       t107ee6:X_07E66:A666:16 t107efc:L_07E7C:A67C:1A
       t108086:zone_action_insert_start:A806:348
       t1084c2:zone_action_delete:AC42:226 t108878:zone_edit_do_it:AFF8:104
       t10897c:trim_arm_field:B0FC:110 t108a8c:X_08A0C:B20C:18
       t108aa4:X_08A24:B224:18 t108abc:X_08A3C:B23C:16
       t108ad2:X_08A52:B252:16 t108ae8:snd_params_screen_enter:B268:1E
       t108b06:X_08A86:B286:62 t108c04:X_08B84:B384:66
       t108c6a:tgt_08BEA:B3EA:62 t108d2a:fn_08CAA:B4AA:24
       t108d4e:file_exists_rename:B4CE:C t108d5a:file_exists_refresh:B4DA:C
       t108d66:X_08CE6:B4E6:1C t108d82:X_08D02:B502:C t108d8e:L_08D0E:B50E:2E
       t108dbc:X_08D3C:B53C:C t108dc8:X_08D48:B548:18 t108de0:L_08D60:B560:1E
       t108dfe:L_08D7E:B57E:1E t1090f4:lcd_area_setup:B874:3C
       t109310:lcd_clear_area:BA90:2B6 t1095c6:lcd_clear_wrapper:BD46:3A
       t109600:lcd_area_wrapper_1:BD80:12 t109612:lcd_area_wrapper_2:BD92:12
       t1096fa:status_read_multi:BE7A:BA t1097b4:status_poll_delay:BF34:2E
       t1097e2:int2F_fn5_caller:BF62:32 t109814:status_poll_handler:BFBA:34
       t109848:pad_velocity_handler:BFEE:4C
       t109a90:voice_play_request:C236:9A t109b2a:midi_realtime_start:C59C:A4
       t109bce:midi_realtime_continue:C640:74 t109d6e:X_09FE0:C7E0:4A
       t109db8:X_0A02A:C82A:52 t109eb8:seq_init_navigation:C92A:22
       t109eda:seq_next_track:C94C:2C t109f06:seq_prev_track:C978:2C
       t109f32:seq_event_handler:C9A4:A2 t109fd4:track_event_handler:CA46:E8
       t10a0bc:lcd_clear_line:CB2E:119 t10a0bc:smem_access_handler_1:CC48:A2
       t10a278:status_poll_delay2:CCEA:2E t10a2a6:status_smem_read:CD18:32
       t10a33c:smem_access_setup:CDAE:29A t10a79a:fn_0AA0C:D20C:38
       t10a7d2:fn_0AA44:D244:14 t10aa5a:int4A_proc_caller:D4CC:32
       t10aac8:fn_0AD3A:D53A:3A t10ab02:far_0AD74:D574:32
       t10ab34:midi_txrx_arm_field:D5A6:B2 t10abe6:X_0AE58:D658:34
       t10ac1a:L_0AE8C:D68C:2E t10ac48:tgt_0AEBA:D6BA:36
       t10ac7e:X_0AEF0:D6F0:40 t10acbe:X_0AF30:D730:1C
       t10acda:X_0AF4C:D74C:3C t10aeae:sysex_sub_dispatch:D920:274
       t10b122:lcd_clear_buffer:DB94:1AA t10b328:L_0B5DC:DDDC:A
       u10b5e6:receive_mode_close:DDE6:10
       t10b332:ui_enter_sound_dialog:DDF6:4C t10b37e:fn_0B642:DE42:E
       t10b38c:tgt_0B650:DE50:1A t10b440:ui_sound_dialog_draw:DF04:62
       t10b4a2:keep_or_retry_up:DF66:14 t10b4b6:keep_or_retry_down:DF7A:14
       t200026:L_00026:DFE6:10 t2000ce:port_c0_write:E08E:6
       t2000d4:port_c0_read:E094:4 t2000d8:L_000D8:E098:6
       t200106:L_00106:E0C6:10 t200116:L_00116:E0D6:10
       t2disp:cmd_dispatch_1E:E12A:32 t2disp:cmd_ratio_setup:E15C:2E
       t2disp:cmd_far_stub:E18A:16 t2disp:draw_unsigned_value:E1A0:38
       t2dlist:ratio_calc_divide:E218:6A t2dlist:cmd_dispatch_setup:E282:2C
       t2dlist:cmd_param_setup:E2AE:3A t2dlist:string_copy_scan:E2E8:5C
       t2dlist:cmd_build_params:E344:34 t2dlist:display_coord_setup:E378:20
       t2dlist:cmd_far_stub2:E398:16 t2dlist:string_copy_setup:E3AE:2E
       t2dlist:string_copy_movsb:E3DC:3E t2dlist:cmd_exec_0E_wrapper:E41A:16
       t2dlist:cmd_track_setup:E430:2C t2dlist:cmd_dispatch_0E:E45C:2C
       t2dlist:string_fill_stosb:E488:3A t2dlist:cmd_build_dispatch:E4C2:44
       t2inst:cmd_caller_setup:E542:32 t2inst:L_005B4:E574:E
       t2inst:install_handler:E582:28 t2inst:install_handler_15:E5AA:26
       t2inst:X_00610:E5D0:A t2inst:delay_ticks:E5DA:1E
       t2inst:install_text2_vectors:E5F8:32 t20067e:mem_block_process:E64C:66
       t2006e4:bcd_display_calc:E6B2:46 t2009a6:bcd_convert:E974:32
       t200aa2:err_msg_report:EA70:22 t2flash:X_00AF2:EAB2:28
       t2flash:L_00B1A:EADA:24 t2flash:X_00B3E:EAFE:46
       t2flash:cmd_dispatch_handler_1:EB44:66 t200dc8:L_00DE8:EDA8:E
       t200dd6:X_00DF6:EDB6:42 t200e18:string_copy_cmd:EDF8:3E
       t200e56:X_00E76:EE36:16 t200fb6:port_c2_write:EF96:6
       t200fda:smem_read_words:EFBA:1E t201216:samples_to_tenths:F1F6:18
       t2fcmd:flash_board_idle:F286:E t2fcmd:flash_vpp_on:F294:E
       t2fcmd:far_012E2:F2A2:E t2fcmd:far_012F0:F2B0:C
       t2fcmd:flash_read_identifier:F2BC:48 t2fcmd:mem_op_wrapper_2:F304:40
       t2fpage:io_delay_wait:F394:20 t2fpage:mem_op_wrapper_4:F3B4:42
       t2fpage:mem_op_wrapper_5:F3F6:3E t201454:mem_op_handler:F434:3A
       t201500:system_call_handler:F4E0:5A t20155a:string_memop_setup:F53A:3E
       t2015e0:dma_01600:F5C0:6 t2015e6:dma_status_rearm:F5C6:A
       t2015f0:L_01610:F5D0:1A t20160a:L_0162A:F5EA:28 t2017e6:X_01806:F7C6:E
       t201852:L_01872:F832:34 t201890:L_018D0:F890:14
       t2018a4:dma_018ee:F8A4:9A t201906:lcd_write_data:F93E:8E
       t2timer:L_01A0C:F9CC:20 t2timer:timer_system:F9EC:36
       t2timer:pending_ops_set:FA22:E t2timer:L_01A70:FA30:64
       t2timer:X_01AD4:FA94:22 t201a70:smem_dma_channel_01:FAB6:2A
       t201a9a:lcd_clear_region_impl:FAE0:4C t201ae6:far_01B6C:FB2C:C
       t201af2:smem_dma_channel_23:FB38:2A t201b1c:lcd_clear_rect:FB62:50
       t201b6c:lcd_write_block_D3B2:FBB2:C t201d12:far_01D98:FD58:10
       t201d22:sound_event_dispatch:FD68:94
       t201db6:smem_addr_data_ctrl:FDFC:54 t201e7a:far_01F00:FEC0:26
       t201ea0:smem_addr_data_status:FEE6:16 t201eb6:pad_note_release:FEFC:46
       t201efc:note_off_voices:FF42:6A t201f66:sample_dma_setup_large:FFAC:12
       t201f78:string_scan_status:FFBE:4A t201fc2:pad_event_dispatch:10008:66
       t202028:X_020AE:1006E:36 t20205e:voice_buf_helper_1:100A4:24
       t202082:voice_buf_helper_2:100C8:1C
       t2020c8:voice_timer_expire:1010E:66 t20218e:voice_alloc:101D4:19A
       t202514:voice_release_by_note:1055A:28 t20253c:voice_start:10582:20A
       t2voice:voice_release_all:1078C:12 t2voice:voice_release_full:1079E:32
       t2voice:voice_release:107D0:44 t2027ce:lcd_set_cursor:10814:22A
       t2029f8:voice_release_all_if:10A3E:14
       t202a0c:voice_start_sample:10A52:1C0 t202bcc:midi_note_io:10C12:14
       t202cc4:X_02D4A:10D0A:A t202cce:X_02D54:10D14:22
       t202cf0:X_02D76:10D36:2A t202d1a:X_02DA0:10D60:E
       t202d28:field_edit_disable:10D6E:1A t202d42:far_02DC8:10D88:A
       t202d4c:far_02DD2:10D92:14 t202d60:win_keys_merge_disable:10DA6:A
       t202d6a:field_redraw:10DB0:6 t202ddc:field_value_store:10E22:6E
       t203242:status_read_6A:11288:3A t20327c:status_read_6A_2:112C2:3C
       t2032b8:status_read_6A_3:112FE:3E t2032f6:field_register_s8:1133C:3E
       t2033ac:X_03432:113F2:58 t203404:voice_port_read:1144A:4E
       t203452:voice_port_read2:11498:4E
       t2034a0:midi_channel_handler:114E6:A0 t203540:midi_msg_io:11586:26
       t203566:X_035EC:115AC:28 t20358e:L_03614:115D4:18
       t2035a6:X_0362C:115EC:2A t2035d0:T2_X_03656:11616:24
       t2035f4:X_0367A:1163A:22 t203616:far_0369C:1165C:24
       t20363a:X_036C0:11680:30 t2036c0:L_03746:11706:64
       t203724:T2_L_037AA:1176A:1E t203742:timer_dma_ch2:11788:40
       t2037f2:voice_trigger_full:11838:42
       t203834:timer_value_read_1:1187A:3C
       t203870:timer_value_read_2:118B6:3C
       t20390c:timer_value_read_3:11952:3E
       t20394a:timer_value_read_4:11990:68
       t2039fe:timer_value_read_5:11A44:38
       t203a36:name_edit_change_default:11A7C:20 t203a9e:X_03B24:11AE4:3E
       t203ae6:show_dev_credits_scroll:11B2C:C4 t203baa:L_03C30:11BF0:26
       t203bd0:L_03C56:11C16:16 u203c6c:L_03C6C:11C2C:18
       t203be6:voice_block_copy:11C44:74 t203c42:L_03CF8:11CB8:16
       t203c58:X_03D0E:11CCE:16 t203cca:tgt_03D80:11D40:2A
       t203cde:far_03DAA:11D6A:2A t203d08:L_03DD4:11D94:2A
       u203f84:L_03F84:11F44:E u203f92:L_03F92:11F52:E
       t203e7c:voice_param_proc:11F86:A6 t203f22:note_clamp_flag:1202C:44
       t203f66:note_range_clamp:12070:44 t203faa:L_040F4:120B4:C
       t203fb6:read_io_chain:120C0:38 t203fee:X_04138:120F8:8C
       t20407a:channel_validate:12184:1E t204098:channel_get_ptr:121A2:24
       t204110:X_0425A:1221A:10 t204120:L_0426A:1222A:6
       t204126:L_04270:12230:24 t20414a:track_select_setup:12254:8A
       t204298:L_043E2:123A2:C t2042a4:L_043EE:123AE:34
       t2042d8:L_04422:123E2:6 t2042de:X_04428:123E8:1C
       t2042fa:voice_process_setup:12404:5A t204354:X_0449E:1245E:18
       t204404:L_0454E:1250E:C t204410:X_0455A:1251A:2E
       t20443e:L_04588:12548:22 t204460:L_045AA:1256A:10
       t204470:L_045BA:1257A:E0 t204550:track_process_full:1265A:E0
       t204630:track_process_ext:1273A:10E t20473e:X_04888:12848:40
       t2047c8:cmd_exec_pair:128D2:68 t204890:X_049DA:1299A:2C
       t2048bc:cmd_exec_1E:129C6:60 t20491c:cmd_dispatch_caller2:12A26:7C
       t204998:cmd_dispatch_handler_2:12AA2:4C u204b2e:L_04B2E_1:12AEE:6
       t2049e4:fx_redraw:12AF4:E t2049f2:far_04B42:12B02:E
       t204a6e:voice_dispatch_table:12B7E:6A t204ad8:fx_type_load:12BE8:40
       t204b18:tgt_04C68:12C28:22 t204b3a:far_04C8A:12C4A:26
       t204b60:L_04CB0:12C70:12 t204b72:X_04CC2:12C82:2C
       t204b9e:L_04CEE:12CAE:C t204baa:L_04CFA:12CBA:10
       t204bba:L_04D0A:12CCA:10 t204bca:L_04D1A:12CDA:C
       t204bd6:filter4_f2:12CE6:10 t204be6:filter4_f3:12CF6:10
       t204bf6:far_04D46:12D06:38 t204c2e:L_04D7E:12D3E:3A
       t204c68:fx_type_load_select:12D78:C t204c74:L_04DC4:12D84:10
       t204c84:L_04DD4:12D94:10 t204c94:L_04DE4:12DA4:40
       t204cd4:X_04E24:12DE4:18 t204cec:fx_chorus_paint:12DFC:70
       t204d5c:fx_rotary_paint:12E6C:98 t204df4:L_04F44:12F04:B8
       t204f0e:lcd_init_display:1301E:4C t204f5a:L_050AA:1306A:1A
       t204f74:cmd_exec_multi:13084:48 t204fbc:status_read_6A_4:130CC:CE
       t20508a:L_051DA:1319A:14 t20509e:L_051EE:131AE:C
       t2050aa:L_051FA:131BA:10 t2050ba:L_0520A:131CA:10
       t2050ca:L_0521A:131DA:12 t2050dc:L_0522C:131EC:26
       t205102:cmd_exec_2:13212:96 t205198:L_052E8:132A8:A6
       t20523e:L_0538E:1334E:C t20524a:L_0539A:1335A:10
       t20525a:L_053AA:1336A:10 t20526a:L_053BA:1337A:14
       t20527e:cmd_exec_7:1338E:116 t20537a:L_054E4:134A4:14
       t20538e:fx_mixer_lr_paint:134B8:72 t205522:copy_fx_close:1364C:E
       t205530:copy_fx_paint:1365A:66 t205596:far_05700:136C0:C
       t2055a2:int38_call_9e:136CC:14 t2055b6:int38_call_02:136E0:14
       t2055ca:int38_call_pair:136F4:14 t2055f6:L_05760:13720:28
       t205658:cmd_exec_1E_ext:13784:28
       t205680:cmd_dispatch_handler_3:137AC:58 t2056d8:L_05844:13804:64
       t20573c:program_select:13868:88
       t2057c4:program_select_wrapper:138F0:2E t2057f2:smem_dma_init:1391E:14
       t205806:X_05972:13932:20 t205850:far_059BC:1397C:24
       t205874:_memcpy_2:139A0:3C t20598c:_memset_2:13AB8:44
       t2059d0:far_memop_str_1:13AFC:30 t205a00:_memcpy_3:13B2C:32
       t205a94:timer_io_setup:13BC0:38 t205b36:smem_proc_wrapper:13C62:16
       t205b4c:smem_transfer_io:13C78:3E t205b8a:seq_select_setup_1:13CB6:14
       t205b9e:seq_select_setup_2:13CCA:14 t205bb2:L_05D1E:13CDE:C
       t205bbe:loop_seq_handler:13CEA:28 t205be6:smem_loop_proc:13D12:28
       t205c0e:L_05C0E:13D3A:1C t205c2a:smem_rep_str:13D56:40
       t205c6a:L_05DD6:13D96:2C t205c96:L_05E02:13DC2:32
       t205cc8:L_05E34:13DF4:8 t205d82:L_05EEE:13EAE:C
       t205d8e:L_05EFA:13EBA:1C t205daa:pgm_midi_key_33:13ED6:1A
       t205dc4:pgm_midi_refresh:13EF0:18 t205ddc:pgm_midi_paint:13F08:68
       u2061b6:purge_do_it:14176:2C t205e44:pgm_assign_key:141E2:38
       t205e7c:seq_port_io:1421A:36 t205eb2:seq_port_io2:14250:34
       t205ee6:note_release_latched:14284:24 t205ffa:seq_write_data:14398:3E
       t206038:program_close:143D6:22 t20605a:copy_pgm_refresh:143F8:24
       t20607e:program_paint:1441C:5C t2060da:t2_copy_pgm_cancel:14478:14
       t2060ee:X_064CC:1448C:C t2060fa:delete_pgm_do_it:14498:46
       t206140:delete_pgm_paint:144DE:24 t206164:program_delete:14502:3E
       t2061a2:L_06580:14540:1C t2061be:delete_all_pgms_do_it:1455C:12
       t2061d0:delete_all_pgms_paint:1456E:12
       t2061e2:delete_pgm_allpgm:14580:12 t20628c:L_0666A:1462A:50
       t2062dc:copy_pgm_do_it:1467A:42 t20631e:copy_pgm_paint:146BC:32
       t20640a:X_067E8:147A8:4C t206456:far_06834:147F4:16
       t20646c:L_0684A:1480A:E t20647a:mixer_stereo_page:14818:24
       t20649e:note_pitch_calc_1:1483C:5A t2064f8:note_pitch_calc_2:14896:6C
       t206628:note_pitch_calc_cmd:149C6:7E
       t2066a6:dispatch_handler_2:14A44:1C t2066c2:mixer_indiv_page:14A60:24
       t2066e6:note_range_calc_1:14A84:5E t206744:note_range_calc_2:14AE2:68
       t2067ac:bcd_arithmetic_2:14B4A:4E t2067fa:bcd_arithmetic_3:14B98:4C
       t2068fe:dispatch_handler_1:14C9C:16 t206914:mixer_fxsend_page:14CB2:24
       t206938:note_range_calc_3:14CD6:5E t206996:note_range_calc_4:14D34:68
       t2069fe:timer_dma_setup:14D9C:40 t206a3e:timer_dma_setup2:14DDC:40
       t206a7e:note_range_calc_cmd:14E1C:76 t206af4:timer_dma_setup3:14E92:16
       t206b0a:sample_dispatch_table:14EA8:92 t206d1c:L_070FA:150BA:1C
       t206d38:mix_pan_store:150D6:20 t206d58:L_07136:150F6:1E
       t206d76:L_07154:15114:26 t206d9c:timer_poll_wait_5:1513A:34
       t206dd0:L_071AE:1516E:1E t206dee:L_071CC:1518C:1E
       t206e0c:timer_str_handler:151AA:1DA t2mix:channel_settings_up:15384:2E
       t2mix:channel_settings_down:153B2:26
       t2mix:channel_settings_left:153D8:2C
       t2mix:channel_settings_right:15404:2A t2mix:pad_note_select_5:1542E:4E
       t2mix:channel_settings_close:1547C:32
       t2072c0:sample_data_load_1:1565E:5C t2074d4:sample_desc_init:15872:32
       t207506:far_078E4:158A4:1C t207522:far_07900:158C0:3C
       t20755e:sample_caller_setup:158FC:30
       t2075fc:sample_data_load_2:1599A:7A t207676:sample_ptr_helper:15A14:5A
       t2076d0:sample_check_active:15A6E:36
       t20781c:fdc_port_90_access:15BBA:18 t207834:X_07C12:15BD2:C
       t207840:timer_fdc_sync:15BDE:76 t2079b4:X_07D92:15D52:20
       t2079d4:tgt_07DB2:15D72:12 t207b36:X_07F14:15ED4:1E
       t207b54:mode_dispatch_index:15EF2:22
       t207b76:voice_trigger_caller:15F14:34 t207baa:ui_field_edit:15F48:46
       t207bf0:snd_window_refresh_key:15F8E:14 t207c32:far_08010:15FD0:12
       t207c44:cmd_exec_caller:15FE2:AA t207e2c:cmd_ratio_calc:161CA:74
       t207fde:sample_name_search:1637C:60 t208208:X_085E6:165A6:4E
       t208256:sample_load_wrapper:165F4:2C t208358:X_08736:166F6:9E
       t2083f6:tgt_087D4:16794:4A t208440:snd_edit_page_return:167DE:44
       t208484:sample_voice_init:16822:90 t2sdel:delete_sound_paint:168B2:48
       t2sdel:L_0855C:168FA:22 t2sdel:delete_all_sounds_do_it:1691C:4E
       t2sdel:delete_all_sounds_paint:1696A:12
       t2sdel:delete_sound_all:1697C:22 t2sdel:voice_init_caller:1699E:5E
       t2sdel:L_0865E:169FC:2C t2sdel:L_0868A:16A28:62
       t208780:L_08B5E:16B1E:36 t208a60:L_08E48:16E08:36
       t208caa:L_09092:17052:20 t2wave:X_090B2:17072:22
       t2wave:L_090D4:17094:12 t2wave:L_090E6:170A6:E t2wave:X_090F4:170B4:22
       t2wave:L_09116:170D6:E t208d3c:X_09124:170E4:BA
       t2zoom:wave_zoom_double:1719E:14 t2zoom:wave_zoom_halve:171B2:1E
       t2zoom:L_09210:171D0:82 t2zoom:L_09292:17252:16
       t2zoom:X_092A8:17268:1A t2zoom:L_092C2:17282:82
       t2zoom:L_09344:17304:16 t2zoom:X_0935A:1731A:1A
       t2trim:discard_do_it:174AA:48 t2trim:discard_paint:174F2:12
       t2trim:L_09544:17504:2C t2091e4:sample_str_scan_4:17590:48
       t20940a:sample_str_scan_6:177B6:44 t209514:L_09900:178C0:E
       t209522:L_0990E:178CE:E t209530:X_0991C:178DC:D0
       t209600:display_draw_pair:179AC:86 t209686:L_09A72:17A32:16
       t20969c:X_09A88:17A48:1A t2096b6:fit_to_length_paint:17A62:12
       t209734:X_09B20:17AE0:2C t2097d4:zone_range_clamp:17B80:82
       t209856:tgt_09C42:17C02:52 t2098a8:ui_edit_zone_start:17C54:54
       t209954:ui_edit_zone_end:17D00:54
       t2099a8:zone_start_fine_key_33:17D54:E
       t2099b6:zone_start_fine_paint:17D62:AC t209a62:L_09E4E:17E0E:6C
       t209ace:L_09EBA:17E7A:16 t209ae4:X_09ED0:17E90:1A
       t209afe:X_09EEA:17EAA:6C t209b6a:X_09F56:17F16:16
       t209b80:X_09F6C:17F2C:1A t209b9a:zone_edit_paint:17F46:A8
       t209c42:zone_edit_up:17FEE:4C t209c8e:L_0A07A:1803A:42
       t209cd0:zone_edit_cancel:1807C:E t209cde:X_0A0CA:1808A:4E
       t209f36:range_seq_caller:182E2:8A t20a154:range_proc_setup:18500:1C
       t20a170:range_process:1851C:90 t20a296:far_0A682:18642:78
       t20a30e:far_0A6FA:186BA:8C t20a8ec:lcd_line_copy:18CDA:32
       t20a91e:_memcpy_1650C:18D0C:30 t20a94e:lcd_region_helper:18D3C:2A
       t20ac58:X_0B090:19050:2E t20ac86:L_0B0BE:1907E:3E
       t20acc4:sample_proc_helper:190BC:72 t20ad36:sample_data_copy:1912E:44
       t20ad7a:_memcpy_5:19172:4C t20adc6:sample_access_caller:191BE:44
       t20ae0a:file_exists_paint:19202:38 t20ae42:X_0B27A:1923A:16
       t20ae58:X_0B290:19250:16 t20ae6e:X_0B2A6:19266:1A
       t20ae88:X_0B2C0:19280:36 t20aebe:ui_enter_pad_assign:192B6:40
       t20aefe:sample_ptr_caller:192F6:6C t20b0d0:midi_out_io2:194C8:32
       t20b63c:sample_io_handler:19A34:30 t20b66c:midi_string_setup:19A64:FA
       t20b7ee:tgt_0BC26:19BE6:A t20b7f8:far_0BC30:19BF0:24
       t20b81c:sample_calc_position:19C14:6E t2ldsnd:load_sound_up:19C82:1E
       t2ldsnd:load_sound_down:19CA0:1E t2ldsnd:load_sound_refresh:19CBE:8
       t2ldsnd:smem_read_handler:19CC6:80 t20b94e:sample_load_entry:19D46:3DE
       t20bd2c:sample_load_step:1A124:C4 t20bdf0:far_0C228:1A1E8:E
       t20bdfe:X_0C236:1A1F6:22 t2chdisk:change_disk_refresh:1A218:E
       t2chdisk:change_disk_paint:1A226:1E
       t2chdisk:change_disk_do_it:1A244:62 t20c028:smem_block_alloc:1A420:70
       t20c192:ctrl_port_caller:1A58A:6E t20c528:smem_ctrl_setup_1:1A920:68
       t20c590:ctrl_port_48_B8:1A988:32 t20c5c2:pgm_file_write:1A9BA:90
       t20c652:ctrl_port_48_B8_3:1AA4A:6A t20c6bc:smem_ctrl_setup_2:1AAB4:3C
       t20c6f8:ctrl_port_48_read:1AAF0:32 t20c72a:envelope_process_2:1AB22:A0
       t20c7ca:_memcpy_6:1ABC2:20 t20c7ea:ctrl_port_48_read2:1ABE2:9C
       t20c958:far_0CDBA:1AD7A:1E t20c9d4:sample_access_short:1ADF6:32
       t20ca06:sample_access_triple:1AE28:50 t20ca78:smem_block_skip:1AE9A:32
       t20cc9c:data_far_write:1B0BE:150 t2rcv:L_0CDEC:1B20E:12
       t2rcv:L_0CDFE:1B220:12 u20d272:L_0D272:1B232:10
       u20d282:L_0D282:1B242:2C u20d2ae:receive_mode_paint:1B26E:32
       u20d2e0:receive_mode_refresh:1B2A0:8
       t20ce20:keep_or_retry_paint:1B2A8:4A t20ce6a:X_0D332:1B2F2:12
       t20ce7c:X_0D344:1B304:12 t20ce8e:X_0D356:1B316:20
       t20ceae:string_far_access:1B336:58
       t20cf06:mono_to_stereo_paint:1B38E:48
       t20cf4e:mono_to_stereo_up:1B3D6:26
       t20cf74:mono_to_stereo_down:1B3FC:16
       t20cf8a:sample_string_access:1B412:21C
       t20d1fc:stereo_to_mono_paint:1B684:44
       t20d240:stereo_to_mono_up:1B6C8:16
       t20d256:stereo_to_mono_down:1B6DE:16
       t20d26c:sample_process_large:1B6F4:29A"
# /Ox for far_3F556's loop, tested at the bottom, and outp inline; /Gy puts
# each function in its own COMDAT, which LINK word-aligns with a zero: the
# images' pad after an odd-length function is 00, not CL's nop.
F="/nologo /c /AL /G2 /Ox /Gy"
# JOBS DOSBoxes at once.  CACHE (default /cache, if writable) keeps objects,
# links and the library's modules by a hash of everything that went into
# them, so a run compiles and links only what changed.
J=${JOBS:-$(getconf _NPROCESSORS_ONLN)} C=${CACHE:-/cache}
if [ -d "$C" ] && [ -w "$C" ]; then mkdir -p $C/o $C/l $C/m; else C=; fi
TC=$({ cat $V/BIN/* $V/LIB/* $V/INCLUDE/*; echo "$F"; } | sha1sum | cut -c1-40)
for h in mpc2krec mpc2k mpc2kxl; do cp "$S"/src/mpc2000/c/$h.h $(echo $h | tr a-z A-Z).H; done
# A process a file is the slow part of a run on a host, so what each file
# needs comes from one pass over them all: U_<file>, its name in capitals;
# FH, each one's hash and the headers it includes; ONK, those on mpc2k.h.
cd "$S"/src/mpc2000/c/match
XF=$(ls x*.c 2>/dev/null | sed 's/\.c$//')
eval "$(ls *.c | awk '{ sub(/\.c$/, ""); print "U_" $0 "=" toupper($0) }')"
{ sha1sum *.c; grep -l '^#include "mpc2kxl.h"' *.c | sed 's/^/X /'; grep -l '^#include "mpc2k.h"' *.c | sed 's/^/K /'; } > "$OLDPWD"/FH
cd "$OLDPWD"
ONK=" $(awk '$1 == "K" { sub(/\.c$/, "", $2); printf "%s ", $2 }' FH)"
[ -z "$only2k" ] || XF=

# An OMF object with one paragraph-aligned _DATA segment of length $1 in
# DGROUP and the rest of the arguments, name=offset, public in it.  Linked
# first, it puts DGROUP at 0, so an offset in it is one in the image.
bin() { for h; do printf "\\$(printf %03o 0x$h)"; done; }
hex() { printf %s "$1" | od -An -tx1; }
rec() { r=$1; shift; bin $r $(printf "%02X %02X" $(($# + 1)) 0) "$@" 00; }
stub() {
	l=$1; shift
	rec 80 04 $(hex STUB)
	rec 96 00 05 $(hex _DATA) 04 $(hex DATA) 06 $(hex DGROUP)
	rec 98 68 $(printf '%02X %02X' $((0x$l & 255)) $((0x$l >> 8))) 02 03 01
	rec 9A 04 FF 01
	for p; do
		o=${p#*=} n=_${p%%=*}
		rec 90 01 01 $(printf %02X ${#n}) $(hex $n) $(printf '%02X %02X' $((0x$o & 255)) $((0x$o >> 8))) 00
	done
	rec 8A 00
}
# LINK's response file: an object a line, run file, map
rsp() { echo $2 | awk '{ for (i = 1; i <= NF; i++) printf "%s%s\r\n", $i, (i < NF ? "+" : "") }'; printf '%s\r\n' $1.EXE "$1.MAP /map:full /nod /noi /nopackf;"; }
# a link, in LINKS: its own log, which the cache keeps with its run file
lnk() { echo "link /nologo @$1.RSP > $1.LOG" >> LINKS; }

# The 2K SYS laid out as the image is: TEXT1 at 0, TEXT2 at TEXT2_SEG, DGROUP
# at DATA_SEG, every name the listing has at its offset, so a far call, a near
# one after LINK's /f makes it nop/push cs, and a DGROUP or DS reference all
# come out as in the image.  Whatever a link's C does not cover is a COMDAT of
# zeros between its objects.  LINK runs out of file handles past some fifty
# objects, so a link is a run of at most twenty files, which ends where a
# file's name hashes to it rather than after a count: a file added relinks
# its own run, not every one after it.  k2 writes one version's objects and
# links, and EXE$v which run file has each function.
omf() { awk -f "$S"/src/mpc2000/toolchain/omf.awk; }
hdr() { echo $(( $(od -An -tu2 -j8 -N2 "$1") * 16 )); }
fill() {	# segment 1/2, length: the next filler object, into FILLS
	n=$((n + 1))
	printf 'FILE %s/F%s.OBJ\nTHEADR FILL\nLNAMES - TEXT%s CODE F%s\nSEGDEF 28 0 2 3\nCOMDAT 1 4 %X\nMODEND\n' $d $n $1 $n $2 >> FILLS
	objs="$objs $d\\F$n"
}
cuts=$(echo $FN150 $FN172 | tr ' ' '\n' | cut -d: -f1 | sort -u | awk '
	BEGIN { A = "0123456789abcdefghijklmnopqrstuvwxyz" }
	{ h = 0; for (i = 1; i <= length($1); i++) h = (h * 31 + index(A, substr($1, i, 1))) % 65521
	  if (h % 10 == 0) printf "%s ", $1 }')
k2() {
	v=$1 L=$R/mpc2000-2k-v$1-sys b=0 k=0 prev= done= batch= bs=
	mkdir -p V$v; : > EXE$v; : > FILLS
	awk -f "$S"/src/mpc2000/toolchain/lst.awk $L/image.lst > LAB$v
	t1=$(( $(awk '$2 == "TEXT2_SEG" { print "0x" $3 }' LAB$v) * 16 ))
	t2=$(( $(awk '$2 == "DATA_SEG" { print "0x" $3 }' LAB$v) * 16 - t1 ))
	hi=$(hdr $L/MPC2000.SYS)
	eval fns=\$FN$v
	for e in $fns; do
		f=${e%%:*}
		if [ $f != "$prev" ]; then
			case " $done " in *" $f "*) echo "$f: not one run" >&2; exit 1;; esac
			prev=$f done="$done $f" k=$((k + 1))
			c=; case " $cuts " in *" $f "*) [ -z "$batch" ] || c=1;; esac
			[ $k -le 20 ] && [ -z "$c" ] || { k2b $batch; batch= k=1; }
		fi
		batch="$batch $e"
	done
	[ -z "$batch" ] || k2b $batch
	omf < FILLS
	# Each link's LAYOUT: the names of its own C left out.  One pass cuts
	# the listing's names, in its order, into pieces where a link's own
	# begin and end, a PUBDEF record a name; a link's LAYOUT is the pieces
	# but its own, so it changes only when its own files do.
	for d in $bs; do while read -r x; do echo "$d $x"; done < $d/DEF; done > DEFS$v
	rm -rf Y$v; mkdir Y$v
	awk -v v=$v 'NR == FNR { b[$2] = $1; next }
	function at(k) { if (k != pk) { printf "FILE Y%s/%d\n", v, ++np; print np, k > ("Y" v "/LIST"); pk = k } }
	FNR == 1 { print "FILE LH" v; print "THEADR LAYOUT"; print "LNAMES - TEXT1 TEXT2 CODE _DATA DATA DGROUP"
		print "SEGDEF 68 0 2 4"; print "SEGDEF 68 0 3 4"; print "SEGDEF 68 F000 5 6"; print "GRPDEF 7 3" }
	($1 == 1 || $1 == 2) { at($3 in b ? b[$3] : "-")
		print "PUB 0", $1, "_" $3, $2; print "PUB 0", $1, toupper($3), $2; print "PUB 0", $1, "@" $3, $2
		if ($3 ~ /^_/) print "PUB 0", $1, $3, $2
		print "FLUSH" }
	$1 == "D" && (length($2) < 4 || $2 < "F000") { at($3 in b ? b[$3] : "-"); print "PUB 1 3 _" $3, $2; print "FLUSH" }
	END { print "FILE LE" v; print "MODEND" }' DEFS$v LAB$v | omf
	for d in $bs; do
		cat LH$v $(awk -v d=$d -v v=$v '$2 != d { print "Y" v "/" $1 }' Y$v/LIST) LE$v > $d/LAYOUT.OBJ
	done
}
k2b() {	# one link: the entries of whole files, in image order
	# named by its version and first file, so a link's name and response
	# file stay put when another run's files change
	eval d=\$U_${1%%:*}; d=$(printf %.7s $d); case $v in 150) d=A$d;; *) d=B$d;; esac
	case " $bs " in *" $d "*) echo "$d: two runs one name" >&2; exit 1;; esac
	n=0 seg=1 pos=0 pf=; mkdir -p $d; bs="$bs $d"
	for x; do y=${x#*:}; echo ${y%%:*}; done > $d/DEF
	objs="$d\\LAYOUT"
	for x; do
		echo "$x $d" >> EXE$v
		IFS=:; set -- $x; unset IFS
		a=$((0x$3 - hi)) s=1
		[ $a -lt $t1 ] || { s=2 a=$((a - t1)); }
		if [ $s != $seg ]; then [ $pos -ge $t1 ] || fill 1 $((t1 - pos)); seg=2 pos=0; fi
		if [ $1 != "$pf" ]; then
			[ $a -le $pos ] || fill $s $((a - pos))
			eval f=\$U_$1; pf=$1
			h=; case $ONK in *" $1 "*) h=h;; esac
			echo "$v$s$h $1" >> UNITS
			objs="$objs V$v\\$f"
		fi
		pos=$((a + 0x$4))
	done
	[ $seg = 2 ] || { fill 1 $((t1 - pos)); pos=0; }
	[ $pos -ge $t2 ] || fill 2 $((t2 - pos))
	rsp $d "$objs" | sed 's/nopackf;/nopackf \/f;/' > $d.RSP
	lnk $d
}

# UNITS: what to compile, "tag file" a line.  tag: l for leaf.c, x for an XL
# x file, or the 2K version and segment, and h for one on mpc2k.h's PCH.
: > UNITS; : > LINKS
{
	printf 'd:\\lib\\llibce.lib\r\n'
	for m in $XL; do printf '*%s &\r\n' ${m%%:*}; done
	printf ';\r\n'
} > X.RSP
for v in $LIB; do
	IFS=:; set -- $v; unset IFS
	t=$1; case $t in xl*) mods=$XL;; *) mods=$K;; esac
	t=$(echo $t | tr -d -- '-sy' | tr a-z A-Z)
	stub $3 > P$t.OBJ
	rsp L$t "P$t $(for m in $mods; do printf '%s ' ${m%%:*}; done)" > L$t.RSP
	lnk L$t
done
if [ -z "$only2k" ]; then
	echo "l leaf" >> UNITS
	stub E000 $APPX > D120.OBJ
	rsp A120 "D120 LEAFX" > A120.RSP; lnk A120
fi
# The x files: all in segment XTEXT.  Each links alone, laid out as the
# flash is (xlay.awk): its function and the code it calls at their frames
# and offsets, DGROUP at DS_SEG.
for f in $XF; do echo "x $f" >> UNITS; done
[ -n "$XF" ] || FNX=
for e in $FNX; do
	IFS=:; set -- $e; unset IFS
	eval f=\$U_$1; o=$((0x$3 - 0x$5 * 16)) end=$((0x$3 + 0x$4 + (0x$4 & 1)))
	echo "FILE L$f.OBJ"
	{ echo "$5 $o $end"
	  for p in $XCODE; do n=${p%%=*} a=${p#*=}; [ "$n" = "$2" ] || echo "$n ${a%%:*} ${a#*:}"; done
	} | awk -f "$S"/src/mpc2000/toolchain/xlay.awk
	rsp X$f "L$f $f D120" | sed 's/nopackf;/nopackf \/f;/' > X$f.RSP
	lnk X$f
done | omf
for v in 150 172; do k2 $v; done

# DOSBox passes no exit status on, so a missing output is the failure.  A
# batch runs nothing after CL has, so each CL ends one.  run: the "queue
# step" lines of $1, each queue's steps in DOSBoxes of its own one after
# another, the queues at once; a step's output is in B<queue>_<n>.TXT unless
# it has its own.
box() {
	b=$1; printf 'exit\r\n' >> $b.BAT; mkdir -p T$b
	set -- -c "mount c $PWD" -c "mount d $V" -c 'path d:\bin' -c "set tmp=c:\\T$b" \
		-c 'set include=d:\include' -c 'c:' -c "$b.bat"
	# cycles past what the host keeps up with: a compile has no clock to keep
	if command -v dosbox-x >/dev/null; then
		dosbox-x -silent -nomenu -fastlaunch -set "cpu turbo=true" -set "cpu cycles=max" "$@" -c exit
	else dosbox -c "config -set cpu core=dynamic" -c "config -set cpu cycles=fixed 5000000" "$@"; fi >/dev/null 2>&1
}
run() {	# steps, a letter for the run's names
	[ -s $1 ] || return 0
	awk -v p=$2 '{ q = $1; l = substr($0, length(q) + 2)
		if (!(q in k) || nb[q]) { if (q in k) close(bat[q]); b = "B" p q "_" ++k[q]; bat[q] = b ".BAT"; print b > ("Q" p q); nb[q] = 0 }
		b = "B" p q "_" k[q]
		if (l ~ />/) printf "%s\r\n", l > bat[q]; else printf "%s >> %s.TXT\r\n", l, b > bat[q]
		if (l ~ /^cl /) nb[q] = 1 }' $1
	for q in Q$2*; do (while read -r b; do box $b; done < $q) & done
	wait
	for q in Q$2*; do while read -r b; do [ ! -f $b.TXT ] || cat $b.TXT >> LOG.TXT; done < $q; done
}
: > LOG.TXT
ph planned
# An object's key: its tag, its source's hash and its headers'.  A link's:
# its response file, its compiled objects' keys and the hashes of the
# others, which are all check.sh's own.
hk=$({ echo $TC; cat MPC2KREC.H MPC2K.H; } | sha1sum | cut -c1-40)
hx=$({ echo $TC; cat MPC2KREC.H MPC2KXL.H; } | sha1sum | cut -c1-40)
awk -v tc=$TC -v hk=$hk -v hx=$hx 'NR == FNR { if ($1 == "X") c[$2] = hx; else if ($1 == "K") c[$2] = hk; else s[$2] = $1; next }
	{ f = $2 ".c"; u = toupper($2); t = $1
	  o = t == "l" ? "LEAFX.OBJ" : t == "x" ? u ".OBJ" : "V" substr(t, 1, 3) "/" u ".OBJ"
	  print t, u, o, t "." s[f] "." (f in c ? c[f] : tc), $2 }' FH UNITS > KEYS
# the library's modules
M=; [ -z "$C" ] || M=$C/m/$TC
if [ -n "$M" ] && [ -d $M ]; then cp $M/* .; else echo "1 lib /nologo @X.RSP" > P0; fi
awk '{ n = $0; sub(/.*@/, "", n); sub(/\.RSP.*/, "", n)
	while ((getline l < (n ".RSP")) > 0) { sub(/\r$/, "", l); if (l ~ /\.EXE$/) break
		sub(/\+$/, "", l); gsub(/\\/, "/", l); print n, toupper(l) ".OBJ" }
	close(n ".RSP") }' LINKS > MEMB
awk 'NR == FNR { k[$3]; next } !($2 in k) { print $2 }' KEYS MEMB | sort -u > OWN
while read -r o; do [ ! -f $o ] || echo $o; done < OWN | xargs sh -c '[ $# = 0 ] || sha1sum "$@"' sh > OWNH
rm -rf KM; mkdir KM
awk -v tc=$TC 'FILENAME == "KEYS" { k[$3] = $4; next } FILENAME == "OWNH" { k[$2] = $1; next }
	{ if (!($1 in ok)) { ok[$1] = 1; m[$1] = "" } if ($2 in k) m[$1] = m[$1] " " k[$2]; else ok[$1] = 0 }
	END { for (n in ok) if (ok[n]) { f = "KM/" n; print tc m[n] > f
		while ((getline l < (n ".RSP")) > 0) print l > f; close(n ".RSP"); close(f) } }' KEYS OWNH MEMB
(cd KM && ls | xargs sh -c '[ $# = 0 ] || sha1sum "$@"' sh) > LK
# hits come out of the cache; a missed link needs its objects, from the
# cache or, in MISS, compiled
: > P2; : > LMISS; : > HITS; : > MISS; i=0
awk 'NR == FNR { k[$2] = $1; next } { n = $0; sub(/.*@/, "", n); sub(/\.RSP.*/, "", n); print n, (n in k ? k[n] : "-") }' LK LINKS > LKN
paste -d' ' LKN LINKS | while read -r n key l; do
	if [ -n "$C" ] && [ $key != - ] && [ -d $C/l/$key ]; then echo $C/l/$key/$n.EXE $C/l/$key/$n.MAP $C/l/$key/$n.LOG >> HITS
	else echo "$((i % J + 1)) $l" >> P2; echo "$n $key" >> LMISS; i=$((i + 1)); fi
done
[ ! -s HITS ] || xargs sh -c 'cp "$@" .' sh < HITS
awk 'NR == FNR { x[$1]; next } ($1 in x) { print $2 }' LMISS MEMB | sort -u > NEED
awk 'NR == FNR { x[$1]; next } ($3 in x)' NEED KEYS | while read -r t u o key lc; do
	if [ -n "$C" ] && [ -f $C/o/$key ]; then cp $C/o/$key $o
	else cp "$S"/src/mpc2000/c/match/$lc.c $u.C; echo "$t $u $o $key" >> MISS; fi
done
# a PCH for each version that compiles a file on it
for v in 150 172; do
	grep -q "^${v}.h " MISS || continue
	printf '#include "mpc2k.h"\r\n' > PCH$v.C
	echo "$v cl $F /Aw /NT TEXT1 /DFW_VERSION=$v /Ycmpc2k.h /FpV$v.PCH /FoPCH$v.OBJ PCH$v.C" >> P0
done
[ ! -f P0 ] || run P0 A
[ -z "$M" ] || [ -d $M ] || { mkdir -p $M.t && cp $(for m in $XL; do echo ${m%%:*}; done | tr a-z A-Z | sed 's/$/.OBJ/') $M.t/ && mv $M.t $M; } || :
# the misses: J runs of about the same length, a CL each run's files of one tag
sort MISS | awk -v j=$J -v f="$F" 'function fl(t,  v, s) {
		if (t == "l") return f " /FoLEAFX.OBJ"
		if (t == "x") return f " /NT XTEXT"
		v = substr(t, 1, 3); s = substr(t, 4, 1)
		return f " /Aw /NT TEXT" s " /DFW_VERSION=" v (t ~ /h$/ ? " /Yumpc2k.h /FpV" v ".PCH" : "") " /FoV" v "\\" }
	{ t[NR] = $1; u[NR] = $2 }
	END { per = int((NR + j - 1) / j)
		for (i = 1; i <= NR; i++) {
			q = int((i - 1) / per) + 1
			if (q != pq || t[i] != pt) { if (r != "") close(r); r = "C" q t[i] ".RSP"; printf "%s\r\n", fl(t[i]) > r; print q, "cl @" r; pq = q; pt = t[i] }
			printf "%s.C\r\n", u[i] > r
		} }' > P1
run P1 B
ph "compiled $(wc -l < MISS | tr -d ' ') of $(wc -l < KEYS | tr -d ' ') objects"
[ -z "$C" ] || while read -r t u o key; do [ ! -s $o ] || cp $o $C/o/$key; done < MISS
run P2 C
ph "linked $(wc -l < LMISS | tr -d ' ') of $(wc -l < LINKS | tr -d ' ')"
[ -z "$C" ] || while read -r n key; do
	[ $key = - ] || [ ! -s $n.EXE ] || [ -d $C/l/$key ] || { mkdir -p $C/l/$key.t && cp $n.EXE $n.MAP $n.LOG $C/l/$key.t/ && mv $C/l/$key.t $C/l/$key; }
done < LMISS
while read -r n key; do [ ! -f $n.LOG ] || echo $n.LOG; done < LKN | xargs sh -c '[ $# = 0 ] || cat "$@"' sh >> LOG.TXT

# linear address of a public, or of a segment's end, in a LINK map
sym() { awk -v n="$2" '{ sub(/\r$/, "") } $2 == n && $1 ~ /^[0-9A-F]+:[0-9A-F]+$/ {
	split($1, a, ":"); print a[1] " " a[2]; exit }' "$1" | { read s o && echo $((0x$s * 16 + 0x$o)); }; }
send() { awk -v n="$2" '{ sub(/\r$/, "") } $4 == n { print $1 " " $3; exit }' "$1" |
	{ read a l && echo $((0x${a%H} + 0x${l%H})); }; }
# linear address and length of each COMDAT LINK placed, in order
cdat() { awk '{ sub(/\r$/, ""); gsub(/H/, "") } $4 ~ /^COMDAT_SEG/ || $5 == "CODE" { b = $1; next }
	b != "" && $1 == "at" && $2 == "offset" { print b, $3, $4; next } { b = "" }' "$1" |
	while read b o l; do echo $((0x$b + 0x$o)) $((0x$l)); done; }
app() {	# run file, image, name:file offset in COMDAT order
	rom=$(img $2) h=$(hdr $1.EXE) f=$1; shift 2
	cdat $f.MAP > $f.CD
	for x; do
		read a l
		# CL ends a module on a word with a nop, where LINK pads a
		# function the image has further functions after with a zero
		[ $# -gt 1 ] || [ $(od -An -tx1 -j $((h + a + l - 1)) -N1 $f.EXE) != 90 ] || l=$((l - 1))
		same "${x%:*} at ${x#*:}" $f.EXE $((h + a)) $rom $((0x${x#*:})) $l
		shift
	done < $f.CD
}
same() {	# what file offset image offset length
	cmp -s -n $6 "$2" "$4" $3 $5 && { echo "  $1: $6 bytes match"; return; }
	# BSD cmp calls a range that ends at its file's end an EOF: cut them out
	tail -c +$(($3 + 1)) "$2" | head -c $6 > SA; tail -c +$(($5 + 1)) "$4" | head -c $6 > SB
	if [ $(wc -c < SA) = $6 ] && cmp -s SA SB; then echo "  $1: $6 bytes match"
	else echo "  $1: $(cmp -l SA SB 2>/dev/null | wc -l | tr -d ' ') of $6 bytes DIFFER"; fail=1; fi
}
grep -q ' error L' LOG.TXT && { tr -d '\r' < LOG.TXT | grep ' error L'; fail=1; }
for f in $([ -n "$only2k" ] || echo LXLV107 LXLV120 A120) L2KV150 L2KV172 $(cut -d" " -f2 EXE150 EXE172 | sort -u); do [ -s $f.EXE ] || { tr -d '\r' < LOG.TXT; exit 1; }; done

img() { case $1 in xl*) echo $R/mpc2000-$1/MPC2KXL.BIN;; *) echo $R/mpc2000-$1/MPC2000.SYS;; esac; }
for v in $LIB; do
	IFS=:; set -- $v; unset IFS
	t=$(echo $1 | tr -d -- '-sy' | tr a-z A-Z) rom=$(img $1) base=$((0x$2))
	case $1 in xl*) mods=$XL; echo "MPC2000XL ${1#xl-} runtime library";;
		*) mods=$K; v=${1#2k-}; echo "MPC2000 ${v%-sys} SYS runtime library";; esac
	h=$(hdr L$t.EXE) m=L$t.MAP first=
	set -- $(for x in $mods; do echo ${x#*:}; done)
	while [ $# -gt 0 ]; do
		a=$(sym $m $1); [ -n "$first" ] || first=$a
		if [ $# -gt 1 ]; then e=$(sym $m $2); else e=$(send $m _TEXT); fi
		same "${1#_} at $(printf %X $((base + a - first)))" L$t.EXE $((h + a)) $rom $((base + a - first)) $((e - a))
		shift
	done
done
[ -n "$only2k" ] || { echo "MPC2000XL v120 application functions"; app A120 xl-v120 $FN120; }
[ -z "$only2k" ] || FNX=
for e in $FNX; do
	IFS=:; set -- $e; unset IFS
	f=$(echo $1 | tr a-z A-Z) l=$((0x$4)) h=$(hdr X$f.EXE)
	[ $(od -An -tx1 -j $((h + 0x$3 + l - 1)) -N1 X$f.EXE) != 90 ] || l=$((l - 1))
	same "$2 at $3" X$f.EXE $((h + 0x$3)) $(img xl-v120) $((0x$3)) $l
done
# The 2K: each run file's span of the image in one cmp -l, so a function
# costs no process of its own.  CL pads a module's last function with a
# nop; where the image's module goes on past what c/ has, it has LINK's zero.
hx='function hx(s,  i, v) { v = 0; for (i = 1; i <= length(s); i++) v = v * 16 + index("0123456789ABCDEF", substr(s, i, 1)) - 1; return v }'
for v in 150 172; do
	echo "MPC2000 v$v SYS application functions"
	rom=$(img 2k-v$v-sys); hi=$(hdr $rom)
	awk "$hx"' { split($1, e, ":"); a = hx(e[3]); l = hx(e[4]); k = $2
		if (!(k in lo) || a < lo[k]) lo[k] = a; if (a + l > up[k]) up[k] = a + l }
		END { for (k in lo) print k, lo[k], up[k] - lo[k] }' EXE$v > SPAN$v
	while read -r k lo n; do
		h=$(hdr $k.EXE)
		tail -c +$((h + lo - hi + 1)) $k.EXE | head -c $n > SA; tail -c +$((lo + 1)) $rom | head -c $n > SB
		echo "$k $lo $(wc -c < SA)"; cmp -l SA SB 2>/dev/null | sed "s/^/$k /" || :
	done < SPAN$v > DIFF$v
	awk "$hx"' NR == FNR { if (NF == 3) { lo[$1] = $2; sz[$1] = $3 } else d[$1, $2] = $3 " " $4; next }
		{ f[FNR] = $1; k[FNR] = $2 } END {
		for (i = 1; i <= FNR; i++) {
			split(f[i], e, ":"); n = e[2]; a = hx(e[3]); l = hx(e[4]); r = k[i]; p = a - lo[r]
			if (i == FNR || substr(f[i + 1], 1, index(f[i + 1], ":")) != substr(f[i], 1, index(f[i], ":")))
				if (((r, p + l) in d) && d[r, p + l] == "220 0") l--
			c = 0; for (q = p + 1; q <= p + l; q++) if (((r, q) in d) || q > sz[r]) c++
			if (c) { printf "  %s at %X: %d of %d bytes DIFFER\n", n, a, c, l; bad = 1 }
			else printf "  %s at %X: %d bytes match\n", n, a, l
		} exit bad }' DIFF$v EXE$v || fail=1
done
ph compared
exit $fail
