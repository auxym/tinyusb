


type
  TusbHidDescriptorHidT* {.importc: "tusb_hid_descriptor_hid_t",
                          header: "hid_c2nim.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    bcdHID* {.importc: "bcdHID".}: uint16
    bCountryCode* {.importc: "bCountryCode".}: uint8
    bNumDescriptors* {.importc: "bNumDescriptors".}: uint8
    bReportType* {.importc: "bReportType".}: uint8
    wReportLength* {.importc: "wReportLength".}: uint16



type
  HidSubclassEnumT* {.size: sizeof(cint).} = enum
    HID_SUBCLASS_NONE = 0, HID_SUBCLASS_BOOT = 1
/*--------------------------------------------------------------------
 * ASCII to KEYCODE Conversion
 *  Expand to array of [128][2] (shift, keycode)
 *
 * Usage: example to convert input chr into keyboard report (modifier + keycode)
 *
 *  uint8_t const conv_table[128][2] =  { HID_ASCII_TO_KEYCODE };
 *
 *  uint8_t keycode[6] = { 0 };
 *  uint8_t modifier   = 0;
 *
 *  if ( conv_table[chr][0] ) modifier = KEYBOARD_MODIFIER_LEFTSHIFT;
 *  keycode[0] = conv_table[chr][1];
 *  tud_hid_keyboard_report(report_id, modifier, keycode);
 *
 *--------------------------------------------------------------------*/
#define HID_ASCII_TO_KEYCODE \
    {0, 0                     }, /* 0x00 Null      */ \
    {0, 0                     }, /* 0x01           */ \
    {0, 0                     }, /* 0x02           */ \
    {0, 0                     }, /* 0x03           */ \
    {0, 0                     }, /* 0x04           */ \
    {0, 0                     }, /* 0x05           */ \
    {0, 0                     }, /* 0x06           */ \
    {0, 0                     }, /* 0x07           */ \
    {0, HID_KEY_BACKSPACE     }, /* 0x08 Backspace */ \
    {0, HID_KEY_TAB           }, /* 0x09 Tab       */ \
    {0, HID_KEY_ENTER         }, /* 0x0A Line Feed */ \
    {0, 0                     }, /* 0x0B           */ \
    {0, 0                     }, /* 0x0C           */ \
    {0, HID_KEY_ENTER         }, /* 0x0D CR        */ \
    {0, 0                     }, /* 0x0E           */ \
    {0, 0                     }, /* 0x0F           */ \
    {0, 0                     }, /* 0x10           */ \
    {0, 0                     }, /* 0x11           */ \
    {0, 0                     }, /* 0x12           */ \
    {0, 0                     }, /* 0x13           */ \
    {0, 0                     }, /* 0x14           */ \
    {0, 0                     }, /* 0x15           */ \
    {0, 0                     }, /* 0x16           */ \
    {0, 0                     }, /* 0x17           */ \
    {0, 0                     }, /* 0x18           */ \
    {0, 0                     }, /* 0x19           */ \
    {0, 0                     }, /* 0x1A           */ \
    {0, HID_KEY_ESCAPE        }, /* 0x1B Escape    */ \
    {0, 0                     }, /* 0x1C           */ \
    {0, 0                     }, /* 0x1D           */ \
    {0, 0                     }, /* 0x1E           */ \
    {0, 0                     }, /* 0x1F           */ \
                                                      \
    {0, HID_KEY_SPACE         }, /* 0x20           */ \
    {1, HID_KEY_1             }, /* 0x21 !         */ \
    {1, HID_KEY_APOSTROPHE    }, /* 0x22 "         */ \
    {1, HID_KEY_3             }, /* 0x23 #         */ \
    {1, HID_KEY_4             }, /* 0x24 $         */ \
    {1, HID_KEY_5             }, /* 0x25 %         */ \
    {1, HID_KEY_7             }, /* 0x26 &         */ \
    {0, HID_KEY_APOSTROPHE    }, /* 0x27 '         */ \
    {1, HID_KEY_9             }, /* 0x28 (         */ \
    {1, HID_KEY_0             }, /* 0x29 )         */ \
    {1, HID_KEY_8             }, /* 0x2A *         */ \
    {1, HID_KEY_EQUAL         }, /* 0x2B +         */ \
    {0, HID_KEY_COMMA         }, /* 0x2C ,         */ \
    {0, HID_KEY_MINUS         }, /* 0x2D -         */ \
    {0, HID_KEY_PERIOD        }, /* 0x2E .         */ \
    {0, HID_KEY_SLASH         }, /* 0x2F /         */ \
    {0, HID_KEY_0             }, /* 0x30 0         */ \
    {0, HID_KEY_1             }, /* 0x31 1         */ \
    {0, HID_KEY_2             }, /* 0x32 2         */ \
    {0, HID_KEY_3             }, /* 0x33 3         */ \
    {0, HID_KEY_4             }, /* 0x34 4         */ \
    {0, HID_KEY_5             }, /* 0x35 5         */ \
    {0, HID_KEY_6             }, /* 0x36 6         */ \
    {0, HID_KEY_7             }, /* 0x37 7         */ \
    {0, HID_KEY_8             }, /* 0x38 8         */ \
    {0, HID_KEY_9             }, /* 0x39 9         */ \
    {1, HID_KEY_SEMICOLON     }, /* 0x3A :         */ \
    {0, HID_KEY_SEMICOLON     }, /* 0x3B ;         */ \
    {1, HID_KEY_COMMA         }, /* 0x3C <         */ \
    {0, HID_KEY_EQUAL         }, /* 0x3D =         */ \
    {1, HID_KEY_PERIOD        }, /* 0x3E >         */ \
    {1, HID_KEY_SLASH         }, /* 0x3F ?         */ \
                                                      \
    {1, HID_KEY_2             }, /* 0x40 @         */ \
    {1, HID_KEY_A             }, /* 0x41 A         */ \
    {1, HID_KEY_B             }, /* 0x42 B         */ \
    {1, HID_KEY_C             }, /* 0x43 C         */ \
    {1, HID_KEY_D             }, /* 0x44 D         */ \
    {1, HID_KEY_E             }, /* 0x45 E         */ \
    {1, HID_KEY_F             }, /* 0x46 F         */ \
    {1, HID_KEY_G             }, /* 0x47 G         */ \
    {1, HID_KEY_H             }, /* 0x48 H         */ \
    {1, HID_KEY_I             }, /* 0x49 I         */ \
    {1, HID_KEY_J             }, /* 0x4A J         */ \
    {1, HID_KEY_K             }, /* 0x4B K         */ \
    {1, HID_KEY_L             }, /* 0x4C L         */ \
    {1, HID_KEY_M             }, /* 0x4D M         */ \
    {1, HID_KEY_N             }, /* 0x4E N         */ \
    {1, HID_KEY_O             }, /* 0x4F O         */ \
    {1, HID_KEY_P             }, /* 0x50 P         */ \
    {1, HID_KEY_Q             }, /* 0x51 Q         */ \
    {1, HID_KEY_R             }, /* 0x52 R         */ \
    {1, HID_KEY_S             }, /* 0x53 S         */ \
    {1, HID_KEY_T             }, /* 0x55 T         */ \
    {1, HID_KEY_U             }, /* 0x55 U         */ \
    {1, HID_KEY_V             }, /* 0x56 V         */ \
    {1, HID_KEY_W             }, /* 0x57 W         */ \
    {1, HID_KEY_X             }, /* 0x58 X         */ \
    {1, HID_KEY_Y             }, /* 0x59 Y         */ \
    {1, HID_KEY_Z             }, /* 0x5A Z         */ \
    {0, HID_KEY_BRACKET_LEFT  }, /* 0x5B [         */ \
    {0, HID_KEY_BACKSLASH     }, /* 0x5C '\'       */ \
    {0, HID_KEY_BRACKET_RIGHT }, /* 0x5D ]         */ \
    {1, HID_KEY_6             }, /* 0x5E ^         */ \
    {1, HID_KEY_MINUS         }, /* 0x5F _         */ \
                                                      \
    {0, HID_KEY_GRAVE         }, /* 0x60 `         */ \
    {0, HID_KEY_A             }, /* 0x61 a         */ \
    {0, HID_KEY_B             }, /* 0x62 b         */ \
    {0, HID_KEY_C             }, /* 0x63 c         */ \
    {0, HID_KEY_D             }, /* 0x66 d         */ \
    {0, HID_KEY_E             }, /* 0x65 e         */ \
    {0, HID_KEY_F             }, /* 0x66 f         */ \
    {0, HID_KEY_G             }, /* 0x67 g         */ \
    {0, HID_KEY_H             }, /* 0x68 h         */ \
    {0, HID_KEY_I             }, /* 0x69 i         */ \
    {0, HID_KEY_J             }, /* 0x6A j         */ \
    {0, HID_KEY_K             }, /* 0x6B k         */ \
    {0, HID_KEY_L             }, /* 0x6C l         */ \
    {0, HID_KEY_M             }, /* 0x6D m         */ \
    {0, HID_KEY_N             }, /* 0x6E n         */ \
    {0, HID_KEY_O             }, /* 0x6F o         */ \
    {0, HID_KEY_P             }, /* 0x70 p         */ \
    {0, HID_KEY_Q             }, /* 0x71 q         */ \
    {0, HID_KEY_R             }, /* 0x72 r         */ \
    {0, HID_KEY_S             }, /* 0x73 s         */ \
    {0, HID_KEY_T             }, /* 0x75 t         */ \
    {0, HID_KEY_U             }, /* 0x75 u         */ \
    {0, HID_KEY_V             }, /* 0x76 v         */ \
    {0, HID_KEY_W             }, /* 0x77 w         */ \
    {0, HID_KEY_X             }, /* 0x78 x         */ \
    {0, HID_KEY_Y             }, /* 0x79 y         */ \
    {0, HID_KEY_Z             }, /* 0x7A z         */ \
    {1, HID_KEY_BRACKET_LEFT  }, /* 0x7B {         */ \
    {1, HID_KEY_BACKSLASH     }, /* 0x7C |         */ \
    {1, HID_KEY_BRACKET_RIGHT }, /* 0x7D }         */ \
    {1, HID_KEY_GRAVE         }, /* 0x7E ~         */ \
    {0, HID_KEY_DELETE        }  /* 0x7F Delete    */ \


type
  HidInterfaceProtocolEnumT* {.size: sizeof(cint).} = enum
    HID_ITF_PROTOCOL_NONE = 0, HID_ITF_PROTOCOL_KEYBOARD = 1,
    HID_ITF_PROTOCOL_MOUSE = 2



type
  HidDescriptorEnumT* {.size: sizeof(cint).} = enum
    HID_DESC_TYPE_HID = 0x21, HID_DESC_TYPE_REPORT = 0x22,
    HID_DESC_TYPE_PHYSICAL = 0x23



type
  HidReportTypeT* {.size: sizeof(cint).} = enum
    HID_REPORT_TYPE_INVALID = 0, HID_REPORT_TYPE_INPUT, HID_REPORT_TYPE_OUTPUT,
    HID_REPORT_TYPE_FEATURE



type
  HidRequestEnumT* {.size: sizeof(cint).} = enum
    HID_REQ_CONTROL_GET_REPORT = 0x01, HID_REQ_CONTROL_GET_IDLE = 0x02,
    HID_REQ_CONTROL_GET_PROTOCOL = 0x03, HID_REQ_CONTROL_SET_REPORT = 0x09,
    HID_REQ_CONTROL_SET_IDLE = 0x0a, HID_REQ_CONTROL_SET_PROTOCOL = 0x0b



type
  HidLocalEnumT* {.size: sizeof(cint).} = enum
    HID_LOCAL_NotSupported = 0, HID_LOCAL_Arabic, HID_LOCAL_Belgian,
    HID_LOCAL_CanadianBilingual, HID_LOCAL_CanadianFrench,
    HID_LOCAL_CzechRepublic, HID_LOCAL_Danish, HID_LOCAL_Finnish, HID_LOCAL_French,
    HID_LOCAL_German, HID_LOCAL_Greek, HID_LOCAL_Hebrew, HID_LOCAL_Hungary,
    HID_LOCAL_International, HID_LOCAL_Italian, HID_LOCAL_JapanKatakana,
    HID_LOCAL_Korean, HID_LOCAL_LatinAmerican, HID_LOCAL_NetherlandsDutch,
    HID_LOCAL_Norwegian, HID_LOCAL_PersianFarsi, HID_LOCAL_Poland,
    HID_LOCAL_Portuguese, HID_LOCAL_Russia, HID_LOCAL_Slovakia, HID_LOCAL_Spanish,
    HID_LOCAL_Swedish, HID_LOCAL_SwissFrench, HID_LOCAL_SwissGerman,
    HID_LOCAL_Switzerland, HID_LOCAL_Taiwan, HID_LOCAL_TurkishQ, HID_LOCAL_UK,
    HID_LOCAL_US, HID_LOCAL_Yugoslavia, HID_LOCAL_TurkishF



type
  HidProtocolModeEnumT* {.size: sizeof(cint).} = enum
    HID_PROTOCOL_BOOT = 0, HID_PROTOCOL_REPORT = 1



type
  HidGamepadReportT* {.importc: "hid_gamepad_report_t", header: "hid_c2nim.h", bycopy.} = object
    x* {.importc: "x".}: int8
    y* {.importc: "y".}: int8
    z* {.importc: "z".}: int8
    rz* {.importc: "rz".}: int8
    rx* {.importc: "rx".}: int8
    ry* {.importc: "ry".}: int8
    hat* {.importc: "hat".}: uint8
    buttons* {.importc: "buttons".}: uint32



type
  HidGamepadButtonBmT* {.size: sizeof(cint).} = enum
    GAMEPAD_BUTTON_0 = (cast[cuint](1) shl (0)),
    GAMEPAD_BUTTON_1 = (cast[cuint](1) shl (1)),
    GAMEPAD_BUTTON_2 = (cast[cuint](1) shl (2)),
    GAMEPAD_BUTTON_3 = (cast[cuint](1) shl (3)),
    GAMEPAD_BUTTON_4 = (cast[cuint](1) shl (4)),
    GAMEPAD_BUTTON_5 = (cast[cuint](1) shl (5)),
    GAMEPAD_BUTTON_6 = (cast[cuint](1) shl (6)),
    GAMEPAD_BUTTON_7 = (cast[cuint](1) shl (7)),
    GAMEPAD_BUTTON_8 = (cast[cuint](1) shl (8)),
    GAMEPAD_BUTTON_9 = (cast[cuint](1) shl (9)),
    GAMEPAD_BUTTON_10 = (cast[cuint](1) shl (10)),
    GAMEPAD_BUTTON_11 = (cast[cuint](1) shl (11)),
    GAMEPAD_BUTTON_12 = (cast[cuint](1) shl (12)),
    GAMEPAD_BUTTON_13 = (cast[cuint](1) shl (13)),
    GAMEPAD_BUTTON_14 = (cast[cuint](1) shl (14)),
    GAMEPAD_BUTTON_15 = (cast[cuint](1) shl (15)),
    GAMEPAD_BUTTON_16 = (cast[cuint](1) shl (16)),
    GAMEPAD_BUTTON_17 = (cast[cuint](1) shl (17)),
    GAMEPAD_BUTTON_18 = (cast[cuint](1) shl (18)),
    GAMEPAD_BUTTON_19 = (cast[cuint](1) shl (19)),
    GAMEPAD_BUTTON_20 = (cast[cuint](1) shl (20)),
    GAMEPAD_BUTTON_21 = (cast[cuint](1) shl (21)),
    GAMEPAD_BUTTON_22 = (cast[cuint](1) shl (22)),
    GAMEPAD_BUTTON_23 = (cast[cuint](1) shl (23)),
    GAMEPAD_BUTTON_24 = (cast[cuint](1) shl (24)),
    GAMEPAD_BUTTON_25 = (cast[cuint](1) shl (25)),
    GAMEPAD_BUTTON_26 = (cast[cuint](1) shl (26)),
    GAMEPAD_BUTTON_27 = (cast[cuint](1) shl (27)),
    GAMEPAD_BUTTON_28 = (cast[cuint](1) shl (28)),
    GAMEPAD_BUTTON_29 = (cast[cuint](1) shl (29)),
    GAMEPAD_BUTTON_30 = (cast[cuint](1) shl (30)),
    GAMEPAD_BUTTON_31 = (cast[cuint](1) shl (31))



const
  GAMEPAD_BUTTON_A* = gamepad_Button_0
  GAMEPAD_BUTTON_SOUTH* = gamepad_Button_0
  GAMEPAD_BUTTON_B* = gamepad_Button_1
  GAMEPAD_BUTTON_EAST* = gamepad_Button_1
  GAMEPAD_BUTTON_C* = gamepad_Button_2
  GAMEPAD_BUTTON_X* = gamepad_Button_3
  GAMEPAD_BUTTON_NORTH* = gamepad_Button_3
  GAMEPAD_BUTTON_Y* = gamepad_Button_4
  GAMEPAD_BUTTON_WEST* = gamepad_Button_4
  GAMEPAD_BUTTON_Z* = gamepad_Button_5
  GAMEPAD_BUTTON_TL* = gamepad_Button_6
  GAMEPAD_BUTTON_TR* = gamepad_Button_7
  GAMEPAD_BUTTON_TL2* = gamepad_Button_8
  GAMEPAD_BUTTON_TR2* = gamepad_Button_9
  GAMEPAD_BUTTON_SELECT* = gamepad_Button_10
  GAMEPAD_BUTTON_START* = gamepad_Button_11
  GAMEPAD_BUTTON_MODE* = gamepad_Button_12
  GAMEPAD_BUTTON_THUMBL* = gamepad_Button_13
  GAMEPAD_BUTTON_THUMBR* = gamepad_Button_14


type
  HidGamepadHatT* {.size: sizeof(cint).} = enum
    GAMEPAD_HAT_CENTERED = 0, GAMEPAD_HAT_UP = 1, GAMEPAD_HAT_UP_RIGHT = 2,
    GAMEPAD_HAT_RIGHT = 3, GAMEPAD_HAT_DOWN_RIGHT = 4, GAMEPAD_HAT_DOWN = 5,
    GAMEPAD_HAT_DOWN_LEFT = 6, GAMEPAD_HAT_LEFT = 7, GAMEPAD_HAT_UP_LEFT = 8



type
  HidMouseReportT* {.importc: "hid_mouse_report_t", header: "hid_c2nim.h", bycopy.} = object
    buttons* {.importc: "buttons".}: uint8
    x* {.importc: "x".}: int8
    y* {.importc: "y".}: int8
    wheel* {.importc: "wheel".}: int8
    pan* {.importc: "pan".}: int8



type
  HidMouseButtonBmT* {.size: sizeof(cint).} = enum
    MOUSE_BUTTON_LEFT = (cast[cuint](1) shl (0)),
    MOUSE_BUTTON_RIGHT = (cast[cuint](1) shl (1)),
    MOUSE_BUTTON_MIDDLE = (cast[cuint](1) shl (2)),
    MOUSE_BUTTON_BACKWARD = (cast[cuint](1) shl (3)),
    MOUSE_BUTTON_FORWARD = (cast[cuint](1) shl (4))



type
  HidKeyboardReportT* {.importc: "hid_keyboard_report_t", header: "hid_c2nim.h",
                       bycopy.} = object
    modifier* {.importc: "modifier".}: uint8
    reserved* {.importc: "reserved".}: uint8
    keycode* {.importc: "keycode".}: array[6, uint8]



type
  HidKeyboardModifierBmT* {.size: sizeof(cint).} = enum
    KEYBOARD_MODIFIER_LEFTCTRL = (cast[cuint](1) shl (0)),
    KEYBOARD_MODIFIER_LEFTSHIFT = (cast[cuint](1) shl (1)),
    KEYBOARD_MODIFIER_LEFTALT = (cast[cuint](1) shl (2)),
    KEYBOARD_MODIFIER_LEFTGUI = (cast[cuint](1) shl (3)),
    KEYBOARD_MODIFIER_RIGHTCTRL = (cast[cuint](1) shl (4)),
    KEYBOARD_MODIFIER_RIGHTSHIFT = (cast[cuint](1) shl (5)),
    KEYBOARD_MODIFIER_RIGHTALT = (cast[cuint](1) shl (6)),
    KEYBOARD_MODIFIER_RIGHTGUI = (cast[cuint](1) shl (7))
  HidKeyboardLedBmT* {.size: sizeof(cint).} = enum
    KEYBOARD_LED_NUMLOCK = (cast[cuint](1) shl (0)),
    KEYBOARD_LED_CAPSLOCK = (cast[cuint](1) shl (1)),
    KEYBOARD_LED_SCROLLLOCK = (cast[cuint](1) shl (2)),
    KEYBOARD_LED_COMPOSE = (cast[cuint](1) shl (3)),
    KEYBOARD_LED_KANA = (cast[cuint](1) shl (4))




const
  HID_KEY_NONE* = 0x00
  HID_KEY_A* = 0x04
  HID_KEY_B* = 0x05
  HID_KEY_C* = 0x06
  HID_KEY_D* = 0x07
  HID_KEY_E* = 0x08
  HID_KEY_F* = 0x09
  HID_KEY_G* = 0x0A
  HID_KEY_H* = 0x0B
  HID_KEY_I* = 0x0C
  HID_KEY_J* = 0x0D
  HID_KEY_K* = 0x0E
  HID_KEY_L* = 0x0F
  HID_KEY_M* = 0x10
  HID_KEY_N* = 0x11
  HID_KEY_O* = 0x12
  HID_KEY_P* = 0x13
  HID_KEY_Q* = 0x14
  HID_KEY_R* = 0x15
  HID_KEY_S* = 0x16
  HID_KEY_T* = 0x17
  HID_KEY_U* = 0x18
  HID_KEY_V* = 0x19
  HID_KEY_W* = 0x1A
  HID_KEY_X* = 0x1B
  HID_KEY_Y* = 0x1C
  HID_KEY_Z* = 0x1D
  HID_KEY_1* = 0x1E
  HID_KEY_2* = 0x1F
  HID_KEY_3* = 0x20
  HID_KEY_4* = 0x21
  HID_KEY_5* = 0x22
  HID_KEY_6* = 0x23
  HID_KEY_7* = 0x24
  HID_KEY_8* = 0x25
  HID_KEY_9* = 0x26
  HID_KEY_0* = 0x27
  HID_KEY_ENTER* = 0x28
  HID_KEY_ESCAPE* = 0x29
  HID_KEY_BACKSPACE* = 0x2A
  HID_KEY_TAB* = 0x2B
  HID_KEY_SPACE* = 0x2C
  HID_KEY_MINUS* = 0x2D
  HID_KEY_EQUAL* = 0x2E
  HID_KEY_BRACKET_LEFT* = 0x2F
  HID_KEY_BRACKET_RIGHT* = 0x30
  HID_KEY_BACKSLASH* = 0x31
  HID_KEY_EUROPE_1* = 0x32
  HID_KEY_SEMICOLON* = 0x33
  HID_KEY_APOSTROPHE* = 0x34
  HID_KEY_GRAVE* = 0x35
  HID_KEY_COMMA* = 0x36
  HID_KEY_PERIOD* = 0x37
  HID_KEY_SLASH* = 0x38
  HID_KEY_CAPS_LOCK* = 0x39
  HID_KEY_F1* = 0x3A
  HID_KEY_F2* = 0x3B
  HID_KEY_F3* = 0x3C
  HID_KEY_F4* = 0x3D
  HID_KEY_F5* = 0x3E
  HID_KEY_F6* = 0x3F
  HID_KEY_F7* = 0x40
  HID_KEY_F8* = 0x41
  HID_KEY_F9* = 0x42
  HID_KEY_F10* = 0x43
  HID_KEY_F11* = 0x44
  HID_KEY_F12* = 0x45
  HID_KEY_PRINT_SCREEN* = 0x46
  HID_KEY_SCROLL_LOCK* = 0x47
  HID_KEY_PAUSE* = 0x48
  HID_KEY_INSERT* = 0x49
  HID_KEY_HOME* = 0x4A
  HID_KEY_PAGE_UP* = 0x4B
  HID_KEY_DELETE* = 0x4C
  HID_KEY_END* = 0x4D
  HID_KEY_PAGE_DOWN* = 0x4E
  HID_KEY_ARROW_RIGHT* = 0x4F
  HID_KEY_ARROW_LEFT* = 0x50
  HID_KEY_ARROW_DOWN* = 0x51
  HID_KEY_ARROW_UP* = 0x52
  HID_KEY_NUM_LOCK* = 0x53
  HID_KEY_KEYPAD_DIVIDE* = 0x54
  HID_KEY_KEYPAD_MULTIPLY* = 0x55
  HID_KEY_KEYPAD_SUBTRACT* = 0x56
  HID_KEY_KEYPAD_ADD* = 0x57
  HID_KEY_KEYPAD_ENTER* = 0x58
  HID_KEY_KEYPAD_1* = 0x59
  HID_KEY_KEYPAD_2* = 0x5A
  HID_KEY_KEYPAD_3* = 0x5B
  HID_KEY_KEYPAD_4* = 0x5C
  HID_KEY_KEYPAD_5* = 0x5D
  HID_KEY_KEYPAD_6* = 0x5E
  HID_KEY_KEYPAD_7* = 0x5F
  HID_KEY_KEYPAD_8* = 0x60
  HID_KEY_KEYPAD_9* = 0x61
  HID_KEY_KEYPAD_0* = 0x62
  HID_KEY_KEYPAD_DECIMAL* = 0x63
  HID_KEY_EUROPE_2* = 0x64
  HID_KEY_APPLICATION* = 0x65
  HID_KEY_POWER* = 0x66
  HID_KEY_KEYPAD_EQUAL* = 0x67
  HID_KEY_F13* = 0x68
  HID_KEY_F14* = 0x69
  HID_KEY_F15* = 0x6A
  HID_KEY_F16* = 0x6B
  HID_KEY_F17* = 0x6C
  HID_KEY_F18* = 0x6D
  HID_KEY_F19* = 0x6E
  HID_KEY_F20* = 0x6F
  HID_KEY_F21* = 0x70
  HID_KEY_F22* = 0x71
  HID_KEY_F23* = 0x72
  HID_KEY_F24* = 0x73
  HID_KEY_EXECUTE* = 0x74
  HID_KEY_HELP* = 0x75
  HID_KEY_MENU* = 0x76
  HID_KEY_SELECT* = 0x77
  HID_KEY_STOP* = 0x78
  HID_KEY_AGAIN* = 0x79
  HID_KEY_UNDO* = 0x7A
  HID_KEY_CUT* = 0x7B
  HID_KEY_COPY* = 0x7C
  HID_KEY_PASTE* = 0x7D
  HID_KEY_FIND* = 0x7E
  HID_KEY_MUTE* = 0x7F
  HID_KEY_VOLUME_UP* = 0x80
  HID_KEY_VOLUME_DOWN* = 0x81
  HID_KEY_LOCKING_CAPS_LOCK* = 0x82
  HID_KEY_LOCKING_NUM_LOCK* = 0x83
  HID_KEY_LOCKING_SCROLL_LOCK* = 0x84
  HID_KEY_KEYPAD_COMMA* = 0x85
  HID_KEY_KEYPAD_EQUAL_SIGN* = 0x86
  HID_KEY_KANJI1* = 0x87
  HID_KEY_KANJI2* = 0x88
  HID_KEY_KANJI3* = 0x89
  HID_KEY_KANJI4* = 0x8A
  HID_KEY_KANJI5* = 0x8B
  HID_KEY_KANJI6* = 0x8C
  HID_KEY_KANJI7* = 0x8D
  HID_KEY_KANJI8* = 0x8E
  HID_KEY_KANJI9* = 0x8F
  HID_KEY_LANG1* = 0x90
  HID_KEY_LANG2* = 0x91
  HID_KEY_LANG3* = 0x92
  HID_KEY_LANG4* = 0x93
  HID_KEY_LANG5* = 0x94
  HID_KEY_LANG6* = 0x95
  HID_KEY_LANG7* = 0x96
  HID_KEY_LANG8* = 0x97
  HID_KEY_LANG9* = 0x98
  HID_KEY_ALTERNATE_ERASE* = 0x99
  HID_KEY_SYSREQ_ATTENTION* = 0x9A
  HID_KEY_CANCEL* = 0x9B
  HID_KEY_CLEAR* = 0x9C
  HID_KEY_PRIOR* = 0x9D
  HID_KEY_RETURN* = 0x9E
  HID_KEY_SEPARATOR* = 0x9F
  HID_KEY_OUT* = 0xA0
  HID_KEY_OPER* = 0xA1
  HID_KEY_CLEAR_AGAIN* = 0xA2
  HID_KEY_CRSEL_PROPS* = 0xA3
  HID_KEY_EXSEL* = 0xA4


const
  HID_KEY_CONTROL_LEFT* = 0xE0
  HID_KEY_SHIFT_LEFT* = 0xE1
  HID_KEY_ALT_LEFT* = 0xE2
  HID_KEY_GUI_LEFT* = 0xE3
  HID_KEY_CONTROL_RIGHT* = 0xE4
  HID_KEY_SHIFT_RIGHT* = 0xE5
  HID_KEY_ALT_RIGHT* = 0xE6
  HID_KEY_GUI_RIGHT* = 0xE7


const
  RI_TYPE_MAIN* = 0
  RI_TYPE_GLOBAL* = 1
  RI_TYPE_LOCAL* = 2


const
  RI_MAIN_INPUT* = 8
  RI_MAIN_OUTPUT* = 9
  RI_MAIN_COLLECTION* = 10
  RI_MAIN_FEATURE* = 11
  RI_MAIN_COLLECTION_END* = 12

template hid_Input*(x: untyped): untyped =
  hid_Report_Item(x, RI_MAIN_INPUT, RI_TYPE_MAIN, 1)

template hid_Output*(x: untyped): untyped =
  hid_Report_Item(x, RI_MAIN_OUTPUT, RI_TYPE_MAIN, 1)

template hid_Collection*(x: untyped): untyped =
  hid_Report_Item(x, RI_MAIN_COLLECTION, RI_TYPE_MAIN, 1)

template hid_Feature*(x: untyped): untyped =
  hid_Report_Item(x, RI_MAIN_FEATURE, RI_TYPE_MAIN, 1)

const
  HID_COLLECTION_END* = hid_Report_Item(x, RI_MAIN_COLLECTION_END, RI_TYPE_MAIN, 0)


const
  HID_DATA* = (0 shl 0)
  HID_CONSTANT* = (1 shl 0)
  HID_ARRAY* = (0 shl 1)
  HID_VARIABLE* = (1 shl 1)
  HID_ABSOLUTE* = (0 shl 2)
  HID_RELATIVE* = (1 shl 2)
  HID_WRAP_NO* = (0 shl 3)
  HID_WRAP* = (1 shl 3)
  HID_LINEAR* = (0 shl 4)
  HID_NONLINEAR* = (1 shl 4)
  HID_PREFERRED_STATE* = (0 shl 5)
  HID_PREFERRED_NO* = (1 shl 5)
  HID_NO_NULL_POSITION* = (0 shl 6)
  HID_NULL_STATE* = (1 shl 6)
  HID_NON_VOLATILE* = (0 shl 7)
  HID_VOLATILE* = (1 shl 7)
  HID_BITFIELD* = (0 shl 8)
  HID_BUFFERED_BYTES* = (1 shl 8)


const
  HID_COLLECTION_PHYSICAL* = 0
  HID_COLLECTION_APPLICATION* = 1
  HID_COLLECTION_LOGICAL* = 2
  HID_COLLECTION_REPORT* = 3
  HID_COLLECTION_NAMED_ARRAY* = 4
  HID_COLLECTION_USAGE_SWITCH* = 5
  HID_COLLECTION_USAGE_MODIFIER* = 6


const
  RI_GLOBAL_USAGE_PAGE* = 0
  RI_GLOBAL_LOGICAL_MIN* = 1
  RI_GLOBAL_LOGICAL_MAX* = 2
  RI_GLOBAL_PHYSICAL_MIN* = 3
  RI_GLOBAL_PHYSICAL_MAX* = 4
  RI_GLOBAL_UNIT_EXPONENT* = 5
  RI_GLOBAL_UNIT* = 6
  RI_GLOBAL_REPORT_SIZE* = 7
  RI_GLOBAL_REPORT_ID* = 8
  RI_GLOBAL_REPORT_COUNT* = 9
  RI_GLOBAL_PUSH* = 10
  RI_GLOBAL_POP* = 11

template hid_Usage_Page*(x: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_USAGE_PAGE, RI_TYPE_GLOBAL, 1)

template hid_Usage_Page_N*(x, n: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_USAGE_PAGE, RI_TYPE_GLOBAL, n)

template hid_Logical_Min*(x: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_LOGICAL_MIN, RI_TYPE_GLOBAL, 1)

template hid_Logical_Min_N*(x, n: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_LOGICAL_MIN, RI_TYPE_GLOBAL, n)

template hid_Logical_Max*(x: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_LOGICAL_MAX, RI_TYPE_GLOBAL, 1)

template hid_Logical_Max_N*(x, n: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_LOGICAL_MAX, RI_TYPE_GLOBAL, n)

template hid_Physical_Min*(x: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_PHYSICAL_MIN, RI_TYPE_GLOBAL, 1)

template hid_Physical_Min_N*(x, n: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_PHYSICAL_MIN, RI_TYPE_GLOBAL, n)

template hid_Physical_Max*(x: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_PHYSICAL_MAX, RI_TYPE_GLOBAL, 1)

template hid_Physical_Max_N*(x, n: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_PHYSICAL_MAX, RI_TYPE_GLOBAL, n)

template hid_Unit_Exponent*(x: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_UNIT_EXPONENT, RI_TYPE_GLOBAL, 1)

template hid_Unit_Exponent_N*(x, n: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_UNIT_EXPONENT, RI_TYPE_GLOBAL, n)

template hid_Unit*(x: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_UNIT, RI_TYPE_GLOBAL, 1)

template hid_Unit_N*(x, n: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_UNIT, RI_TYPE_GLOBAL, n)

template hid_Report_Size*(x: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_REPORT_SIZE, RI_TYPE_GLOBAL, 1)

template hid_Report_Size_N*(x, n: untyped): untyped =
  hid_Report_Item(x, RI_GLOBAL_REPORT_SIZE, RI_TYPE_GLOBAL, n)

## !!!Ignored construct:  # HID_REPORT_ID ( x ) HID_REPORT_ITEM ( x , RI_GLOBAL_REPORT_ID , RI_TYPE_GLOBAL , 1 ) , [NewLine] # HID_REPORT_ID_N ( x ) HID_REPORT_ITEM ( x , RI_GLOBAL_REPORT_ID , RI_TYPE_GLOBAL , n ) , [NewLine] # HID_REPORT_COUNT ( x ) HID_REPORT_ITEM ( x , RI_GLOBAL_REPORT_COUNT , RI_TYPE_GLOBAL , 1 ) [NewLine] # HID_REPORT_COUNT_N ( x , n ) HID_REPORT_ITEM ( x , RI_GLOBAL_REPORT_COUNT , RI_TYPE_GLOBAL , n ) [NewLine] # HID_PUSH HID_REPORT_ITEM ( x , RI_GLOBAL_PUSH , RI_TYPE_GLOBAL , 0 ) [NewLine] # HID_POP HID_REPORT_ITEM ( x , RI_GLOBAL_POP , RI_TYPE_GLOBAL , 0 ) [NewLine] ------------- LOCAL ITEMS 6.2.2.8 -------------// enum { RI_LOCAL_USAGE = 0 , RI_LOCAL_USAGE_MIN = 1 , RI_LOCAL_USAGE_MAX = 2 , RI_LOCAL_DESIGNATOR_INDEX = 3 , RI_LOCAL_DESIGNATOR_MIN = 4 , RI_LOCAL_DESIGNATOR_MAX = 5 ,  6 is reserved RI_LOCAL_STRING_INDEX = 7 , RI_LOCAL_STRING_MIN = 8 , RI_LOCAL_STRING_MAX = 9 , RI_LOCAL_DELIMITER = 10 , } ;
## Error: did not expect [NewLine]!!!

template hid_Usage*(x: untyped): untyped =
  hid_Report_Item(x, ri_Local_Usage, RI_TYPE_LOCAL, 1)

template hid_Usage_N*(x, n: untyped): untyped =
  hid_Report_Item(x, ri_Local_Usage, RI_TYPE_LOCAL, n)

template hid_Usage_Min*(x: untyped): untyped =
  hid_Report_Item(x, ri_Local_Usage_Min, RI_TYPE_LOCAL, 1)

template hid_Usage_Min_N*(x, n: untyped): untyped =
  hid_Report_Item(x, ri_Local_Usage_Min, RI_TYPE_LOCAL, n)

template hid_Usage_Max*(x: untyped): untyped =
  hid_Report_Item(x, ri_Local_Usage_Max, RI_TYPE_LOCAL, 1)

template hid_Usage_Max_N*(x, n: untyped): untyped =
  hid_Report_Item(x, ri_Local_Usage_Max, RI_TYPE_LOCAL, n)


const
  HID_USAGE_PAGE_DESKTOP* = 0x01
  HID_USAGE_PAGE_SIMULATE* = 0x02
  HID_USAGE_PAGE_VIRTUAL_REALITY* = 0x03
  HID_USAGE_PAGE_SPORT* = 0x04
  HID_USAGE_PAGE_GAME* = 0x05
  HID_USAGE_PAGE_GENERIC_DEVICE* = 0x06
  HID_USAGE_PAGE_KEYBOARD* = 0x07
  HID_USAGE_PAGE_LED* = 0x08
  HID_USAGE_PAGE_BUTTON* = 0x09
  HID_USAGE_PAGE_ORDINAL* = 0x0a
  HID_USAGE_PAGE_TELEPHONY* = 0x0b
  HID_USAGE_PAGE_CONSUMER* = 0x0c
  HID_USAGE_PAGE_DIGITIZER* = 0x0d
  HID_USAGE_PAGE_PID* = 0x0f
  HID_USAGE_PAGE_UNICODE* = 0x10
  HID_USAGE_PAGE_ALPHA_DISPLAY* = 0x14
  HID_USAGE_PAGE_MEDICAL* = 0x40
  HID_USAGE_PAGE_MONITOR* = 0x80
  HID_USAGE_PAGE_POWER* = 0x84
  HID_USAGE_PAGE_BARCODE_SCANNER* = 0x8c
  HID_USAGE_PAGE_SCALE* = 0x8d
  HID_USAGE_PAGE_MSR* = 0x8e
  HID_USAGE_PAGE_CAMERA* = 0x90
  HID_USAGE_PAGE_ARCADE* = 0x91
  HID_USAGE_PAGE_VENDOR* = 0xFF00


const
  HID_USAGE_DESKTOP_POINTER* = 0x01
  HID_USAGE_DESKTOP_MOUSE* = 0x02
  HID_USAGE_DESKTOP_JOYSTICK* = 0x04
  HID_USAGE_DESKTOP_GAMEPAD* = 0x05
  HID_USAGE_DESKTOP_KEYBOARD* = 0x06
  HID_USAGE_DESKTOP_KEYPAD* = 0x07
  HID_USAGE_DESKTOP_MULTI_AXIS_CONTROLLER* = 0x08
  HID_USAGE_DESKTOP_TABLET_PC_SYSTEM* = 0x09
  HID_USAGE_DESKTOP_X* = 0x30
  HID_USAGE_DESKTOP_Y* = 0x31
  HID_USAGE_DESKTOP_Z* = 0x32
  HID_USAGE_DESKTOP_RX* = 0x33
  HID_USAGE_DESKTOP_RY* = 0x34
  HID_USAGE_DESKTOP_RZ* = 0x35
  HID_USAGE_DESKTOP_SLIDER* = 0x36
  HID_USAGE_DESKTOP_DIAL* = 0x37
  HID_USAGE_DESKTOP_WHEEL* = 0x38
  HID_USAGE_DESKTOP_HAT_SWITCH* = 0x39
  HID_USAGE_DESKTOP_COUNTED_BUFFER* = 0x3a
  HID_USAGE_DESKTOP_BYTE_COUNT* = 0x3b
  HID_USAGE_DESKTOP_MOTION_WAKEUP* = 0x3c
  HID_USAGE_DESKTOP_START* = 0x3d
  HID_USAGE_DESKTOP_SELECT* = 0x3e
  HID_USAGE_DESKTOP_VX* = 0x40
  HID_USAGE_DESKTOP_VY* = 0x41
  HID_USAGE_DESKTOP_VZ* = 0x42
  HID_USAGE_DESKTOP_VBRX* = 0x43
  HID_USAGE_DESKTOP_VBRY* = 0x44
  HID_USAGE_DESKTOP_VBRZ* = 0x45
  HID_USAGE_DESKTOP_VNO* = 0x46
  HID_USAGE_DESKTOP_FEATURE_NOTIFICATION* = 0x47
  HID_USAGE_DESKTOP_RESOLUTION_MULTIPLIER* = 0x48
  HID_USAGE_DESKTOP_SYSTEM_CONTROL* = 0x80
  HID_USAGE_DESKTOP_SYSTEM_POWER_DOWN* = 0x81
  HID_USAGE_DESKTOP_SYSTEM_SLEEP* = 0x82
  HID_USAGE_DESKTOP_SYSTEM_WAKE_UP* = 0x83
  HID_USAGE_DESKTOP_SYSTEM_CONTEXT_MENU* = 0x84
  HID_USAGE_DESKTOP_SYSTEM_MAIN_MENU* = 0x85
  HID_USAGE_DESKTOP_SYSTEM_APP_MENU* = 0x86
  HID_USAGE_DESKTOP_SYSTEM_MENU_HELP* = 0x87
  HID_USAGE_DESKTOP_SYSTEM_MENU_EXIT* = 0x88
  HID_USAGE_DESKTOP_SYSTEM_MENU_SELECT* = 0x89
  HID_USAGE_DESKTOP_SYSTEM_MENU_RIGHT* = 0x8A
  HID_USAGE_DESKTOP_SYSTEM_MENU_LEFT* = 0x8B
  HID_USAGE_DESKTOP_SYSTEM_MENU_UP* = 0x8C
  HID_USAGE_DESKTOP_SYSTEM_MENU_DOWN* = 0x8D
  HID_USAGE_DESKTOP_SYSTEM_COLD_RESTART* = 0x8E
  HID_USAGE_DESKTOP_SYSTEM_WARM_RESTART* = 0x8F
  HID_USAGE_DESKTOP_DPAD_UP* = 0x90
  HID_USAGE_DESKTOP_DPAD_DOWN* = 0x91
  HID_USAGE_DESKTOP_DPAD_RIGHT* = 0x92
  HID_USAGE_DESKTOP_DPAD_LEFT* = 0x93
  HID_USAGE_DESKTOP_SYSTEM_DOCK* = 0xA0
  HID_USAGE_DESKTOP_SYSTEM_UNDOCK* = 0xA1
  HID_USAGE_DESKTOP_SYSTEM_SETUP* = 0xA2
  HID_USAGE_DESKTOP_SYSTEM_BREAK* = 0xA3
  HID_USAGE_DESKTOP_SYSTEM_DEBUGGER_BREAK* = 0xA4
  HID_USAGE_DESKTOP_APPLICATION_BREAK* = 0xA5
  HID_USAGE_DESKTOP_APPLICATION_DEBUGGER_BREAK* = 0xA6
  HID_USAGE_DESKTOP_SYSTEM_SPEAKER_MUTE* = 0xA7
  HID_USAGE_DESKTOP_SYSTEM_HIBERNATE* = 0xA8
  HID_USAGE_DESKTOP_SYSTEM_DISPLAY_INVERT* = 0xB0
  HID_USAGE_DESKTOP_SYSTEM_DISPLAY_INTERNAL* = 0xB1
  HID_USAGE_DESKTOP_SYSTEM_DISPLAY_EXTERNAL* = 0xB2
  HID_USAGE_DESKTOP_SYSTEM_DISPLAY_BOTH* = 0xB3
  HID_USAGE_DESKTOP_SYSTEM_DISPLAY_DUAL* = 0xB4
  HID_USAGE_DESKTOP_SYSTEM_DISPLAY_TOGGLE_INT_EXT* = 0xB5
  HID_USAGE_DESKTOP_SYSTEM_DISPLAY_SWAP_PRIMARY_SECONDARY* = 0xB6
  HID_USAGE_DESKTOP_SYSTEM_DISPLAY_LCD_AUTOSCALE* = 0xB7


const
  HID_USAGE_CONSUMER_CONTROL* = 0x0001
  HID_USAGE_CONSUMER_POWER* = 0x0030
  HID_USAGE_CONSUMER_RESET* = 0x0031
  HID_USAGE_CONSUMER_SLEEP* = 0x0032
  HID_USAGE_CONSUMER_BRIGHTNESS_INCREMENT* = 0x006F
  HID_USAGE_CONSUMER_BRIGHTNESS_DECREMENT* = 0x0070
  HID_USAGE_CONSUMER_WIRELESS_RADIO_CONTROLS* = 0x000C
  HID_USAGE_CONSUMER_WIRELESS_RADIO_BUTTONS* = 0x00C6
  HID_USAGE_CONSUMER_WIRELESS_RADIO_LED* = 0x00C7
  HID_USAGE_CONSUMER_WIRELESS_RADIO_SLIDER_SWITCH* = 0x00C8
  HID_USAGE_CONSUMER_PLAY_PAUSE* = 0x00CD
  HID_USAGE_CONSUMER_SCAN_NEXT* = 0x00B5
  HID_USAGE_CONSUMER_SCAN_PREVIOUS* = 0x00B6
  HID_USAGE_CONSUMER_STOP* = 0x00B7
  HID_USAGE_CONSUMER_VOLUME* = 0x00E0
  HID_USAGE_CONSUMER_MUTE* = 0x00E2
  HID_USAGE_CONSUMER_BASS* = 0x00E3
  HID_USAGE_CONSUMER_TREBLE* = 0x00E4
  HID_USAGE_CONSUMER_BASS_BOOST* = 0x00E5
  HID_USAGE_CONSUMER_VOLUME_INCREMENT* = 0x00E9
  HID_USAGE_CONSUMER_VOLUME_DECREMENT* = 0x00EA
  HID_USAGE_CONSUMER_BASS_INCREMENT* = 0x0152
  HID_USAGE_CONSUMER_BASS_DECREMENT* = 0x0153
  HID_USAGE_CONSUMER_TREBLE_INCREMENT* = 0x0154
  HID_USAGE_CONSUMER_TREBLE_DECREMENT* = 0x0155
  HID_USAGE_CONSUMER_AL_CONSUMER_CONTROL_CONFIGURATION* = 0x0183
  HID_USAGE_CONSUMER_AL_EMAIL_READER* = 0x018A
  HID_USAGE_CONSUMER_AL_CALCULATOR* = 0x0192
  HID_USAGE_CONSUMER_AL_LOCAL_BROWSER* = 0x0194
  HID_USAGE_CONSUMER_AC_SEARCH* = 0x0221
  HID_USAGE_CONSUMER_AC_HOME* = 0x0223
  HID_USAGE_CONSUMER_AC_BACK* = 0x0224
  HID_USAGE_CONSUMER_AC_FORWARD* = 0x0225
  HID_USAGE_CONSUMER_AC_STOP* = 0x0226
  HID_USAGE_CONSUMER_AC_REFRESH* = 0x0227
  HID_USAGE_CONSUMER_AC_BOOKMARKS* = 0x022A
  HID_USAGE_CONSUMER_AC_PAN* = 0x0238


const
  HID_ASCII_TO_KEYCODE* =
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, hid_Key_Backspace)
    (0, hid_Key_Tab)
    (0, hid_Key_Enter)
    (0, 0)
    (0, 0)
    (0, hid_Key_Enter)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, hid_Key_Escape)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, 0)
    (0, hid_Key_Space)
    (1, hid_Key_1)
    (1, hid_Key_Apostrophe)
    (1, hid_Key_3)
    (1, hid_Key_4)
    (1, hid_Key_5)
    (1, hid_Key_7)
    (0, hid_Key_Apostrophe)
    (1, hid_Key_9)
    (1, hid_Key_0)
    (1, hid_Key_8)
    (1, hid_Key_Equal)
    (0, hid_Key_Comma)
    (0, hid_Key_Minus)
    (0, hid_Key_Period)
    (0, hid_Key_Slash)
    (0, hid_Key_0)
    (0, hid_Key_1)
    (0, hid_Key_2)
    (0, hid_Key_3)
    (0, hid_Key_4)
    (0, hid_Key_5)
    (0, hid_Key_6)
    (0, hid_Key_7)
    (0, hid_Key_8)
    (0, hid_Key_9)
    (1, hid_Key_Semicolon)
    (0, hid_Key_Semicolon)
    (1, hid_Key_Comma)
    (0, hid_Key_Equal)
    (1, hid_Key_Period)
    (1, hid_Key_Slash)
    (1, hid_Key_2)
    (1, hid_Key_A)
    (1, hid_Key_B)
    (1, hid_Key_C)
    (1, hid_Key_D)
    (1, hid_Key_E)
    (1, hid_Key_F)
    (1, hid_Key_G)
    (1, hid_Key_H)
    (1, hid_Key_I)
    (1, hid_Key_J)
    (1, hid_Key_K)
    (1, hid_Key_L)
    (1, hid_Key_M)
    (1, hid_Key_N)
    (1, hid_Key_O)
    (1, hid_Key_P)
    (1, hid_Key_Q)
    (1, hid_Key_R)
    (1, hid_Key_S)
    (1, hid_Key_T)
    (1, hid_Key_U)
    (1, hid_Key_V)
    (1, hid_Key_W)
    (1, hid_Key_X)
    (1, hid_Key_Y)
    (1, hid_Key_Z)
    (0, hid_Key_Bracket_Left)
    (0, hid_Key_Backslash)
    (0, hid_Key_Bracket_Right)
    (1, hid_Key_6)
    (1, hid_Key_Minus)
    (0, hid_Key_Grave)
    (0, hid_Key_A)
    (0, hid_Key_B)
    (0, hid_Key_C)
    (0, hid_Key_D)
    (0, hid_Key_E)
    (0, hid_Key_F)
    (0, hid_Key_G)
    (0, hid_Key_H)
    (0, hid_Key_I)
    (0, hid_Key_J)
    (0, hid_Key_K)
    (0, hid_Key_L)
    (0, hid_Key_M)
    (0, hid_Key_N)
    (0, hid_Key_O)
    (0, hid_Key_P)
    (0, hid_Key_Q)
    (0, hid_Key_R)
    (0, hid_Key_S)
    (0, hid_Key_T)
    (0, hid_Key_U)
    (0, hid_Key_V)
    (0, hid_Key_W)
    (0, hid_Key_X)
    (0, hid_Key_Y)
    (0, hid_Key_Z)
    (1, hid_Key_Bracket_Left)
    (1, hid_Key_Backslash)
    (1, hid_Key_Bracket_Right)
    (1, hid_Key_Grave)
    (0, hid_Key_Delete)


## !!!Ignored construct:  [NewLine] #
## Error: did not expect [NewLine]!!!
