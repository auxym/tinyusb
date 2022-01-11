# Contents from tusb.h, tusb_types.h, tusb_common.h

type
  TusbSpeedT* {.size: sizeof(cint).} = enum
    TUSB_SPEED_FULL = 0, TUSB_SPEED_LOW = 1, TUSB_SPEED_HIGH = 2,
    TUSB_SPEED_INVALID = 0xff



type
  TusbXferTypeT* {.size: sizeof(cint).} = enum
    TUSB_XFER_CONTROL = 0, TUSB_XFER_ISOCHRONOUS, TUSB_XFER_BULK, TUSB_XFER_INTERRUPT
  TusbDirT* {.size: sizeof(cint).} = enum
    TUSB_DIR_OUT = 0, TUSB_DIR_IN = 1, TUSB_DIR_IN_MASK = 0x80




type
  TusbIsoEpAttributeT* {.size: sizeof(cint).} = enum
    TUSB_ISO_EP_ATT_NO_SYNC = 0x00, TUSB_ISO_EP_ATT_ASYNCHRONOUS = 0x04,
    TUSB_ISO_EP_ATT_ADAPTIVE = 0x08, TUSB_ISO_EP_ATT_SYNCHRONOUS = 0x0C,
    TUSB_ISO_EP_ATT_EXPLICIT_FB = 0x10, TUSB_ISO_EP_ATT_IMPLICIT_FB = 0x20

const
  TUSB_ISO_EP_ATT_DATA = TUSB_ISO_EP_ATT_NO_SYNC


type
  TusbDescTypeT* {.size: sizeof(cint).} = enum
    TUSB_DESC_DEVICE = 0x01, TUSB_DESC_CONFIGURATION = 0x02, TUSB_DESC_STRING = 0x03,
    TUSB_DESC_INTERFACE = 0x04, TUSB_DESC_ENDPOINT = 0x05,
    TUSB_DESC_DEVICE_QUALIFIER = 0x06, TUSB_DESC_OTHER_SPEED_CONFIG = 0x07,
    TUSB_DESC_INTERFACE_POWER = 0x08, TUSB_DESC_OTG = 0x09, TUSB_DESC_DEBUG = 0x0A,
    TUSB_DESC_INTERFACE_ASSOCIATION = 0x0B, TUSB_DESC_BOS = 0x0F,
    TUSB_DESC_DEVICE_CAPABILITY = 0x10, TUSB_DESC_FUNCTIONAL = 0x21,
    TUSB_DESC_CS_CONFIGURATION = 0x22, TUSB_DESC_CS_STRING = 0x23,
    TUSB_DESC_CS_INTERFACE = 0x24, TUSB_DESC_CS_ENDPOINT = 0x25,
    TUSB_DESC_SUPERSPEED_ENDPOINT_COMPANION = 0x30,
    TUSB_DESC_SUPERSPEED_ISO_ENDPOINT_COMPANION = 0x31
  TusbRequestCodeT* {.size: sizeof(cint).} = enum
    TUSB_REQ_GET_STATUS = 0, TUSB_REQ_CLEAR_FEATURE = 1, TUSB_REQ_RESERVED = 2,
    TUSB_REQ_SET_FEATURE = 3, TUSB_REQ_RESERVED2 = 4, TUSB_REQ_SET_ADDRESS = 5,
    TUSB_REQ_GET_DESCRIPTOR = 6, TUSB_REQ_SET_DESCRIPTOR = 7,
    TUSB_REQ_GET_CONFIGURATION = 8, TUSB_REQ_SET_CONFIGURATION = 9,
    TUSB_REQ_GET_INTERFACE = 10, TUSB_REQ_SET_INTERFACE = 11,
    TUSB_REQ_SYNCH_FRAME = 12
  TusbRequestFeatureSelectorT* {.size: sizeof(cint).} = enum
    TUSB_REQ_FEATURE_EDPT_HALT = 0, TUSB_REQ_FEATURE_REMOTE_WAKEUP = 1,
    TUSB_REQ_FEATURE_TEST_MODE = 2
  TusbRequestTypeT* {.size: sizeof(cint).} = enum
    TUSB_REQ_TYPE_STANDARD = 0, TUSB_REQ_TYPE_CLASS, TUSB_REQ_TYPE_VENDOR,
    TUSB_REQ_TYPE_INVALID
  TusbRequestRecipientT* {.size: sizeof(cint).} = enum
    TUSB_REQ_RCPT_DEVICE = 0, TUSB_REQ_RCPT_INTERFACE, TUSB_REQ_RCPT_ENDPOINT,
    TUSB_REQ_RCPT_OTHER

const
  TUSB_DESC_CS_DEVICE = TUSB_DESC_FUNCTIONAL






type
  TusbClassCodeT* {.size: sizeof(cint).} = enum
    TUSB_CLASS_UNSPECIFIED = 0, TUSB_CLASS_AUDIO = 1, TUSB_CLASS_CDC = 2,
    TUSB_CLASS_HID = 3, TUSB_CLASS_RESERVED_4 = 4, TUSB_CLASS_PHYSICAL = 5,
    TUSB_CLASS_IMAGE = 6, TUSB_CLASS_PRINTER = 7, TUSB_CLASS_MSC = 8, TUSB_CLASS_HUB = 9,
    TUSB_CLASS_CDC_DATA = 10, TUSB_CLASS_SMART_CARD = 11, TUSB_CLASS_RESERVED_12 = 12,
    TUSB_CLASS_CONTENT_SECURITY = 13, TUSB_CLASS_VIDEO = 14,
    TUSB_CLASS_PERSONAL_HEALTHCARE = 15, TUSB_CLASS_AUDIO_VIDEO = 16,
    TUSB_CLASS_DIAGNOSTIC = 0xDC, TUSB_CLASS_WIRELESS_CONTROLLER = 0xE0,
    TUSB_CLASS_MISC = 0xEF, TUSB_CLASS_APPLICATION_SPECIFIC = 0xFE,
    TUSB_CLASS_VENDOR_SPECIFIC = 0xFF
  MiscSubclassTypeT* {.size: sizeof(cint).} = enum
    MISC_SUBCLASS_COMMON = 2
  MiscProtocolTypeT* {.size: sizeof(cint).} = enum
    MISC_PROTOCOL_IAD = 1
  AppSubclassTypeT* {.size: sizeof(cint).} = enum
    APP_SUBCLASS_DFU_RUNTIME = 0x01, APP_SUBCLASS_USBTMC = 0x03
  DeviceCapabilityTypeT* {.size: sizeof(cint).} = enum
    DEVICE_CAPABILITY_WIRELESS_USB = 0x01,
    DEVICE_CAPABILITY_USB20_EXTENSION = 0x02,
    DEVICE_CAPABILITY_SUPERSPEED_USB = 0x03, DEVICE_CAPABILITY_CONTAINER_id = 0x04,
    DEVICE_CAPABILITY_PLATFORM = 0x05, DEVICE_CAPABILITY_POWER_DELIVERY = 0x06,
    DEVICE_CAPABILITY_BATTERY_INFO = 0x07,
    DEVICE_CAPABILITY_PD_CONSUMER_PORT = 0x08,
    DEVICE_CAPABILITY_PD_PROVIDER_PORT = 0x09,
    DEVICE_CAPABILITY_SUPERSPEED_PLUS = 0x0A,
    DEVICE_CAPABILITY_PRECESION_TIME_MEASUREMENT = 0x0B,
    DEVICE_CAPABILITY_WIRELESS_USB_EXT = 0x0C, DEVICE_CAPABILITY_BILLBOARD = 0x0D,
    DEVICE_CAPABILITY_AUTHENTICATION = 0x0E, DEVICE_CAPABILITY_BILLBOARD_EX = 0x0F,
    DEVICE_CAPABILITY_CONFIGURATION_SUMMARY = 0x10






const
  TUSB_DESC_CONFIG_ATT_REMOTE_WAKEUP* = (cast[cuint](1) shl (5))
  TUSB_DESC_CONFIG_ATT_SELF_POWERED* = (cast[cuint](1) shl (6))

template tusb_Desc_Config_Power_Ma*(x: untyped): untyped =
  ((x) div 2)


type
  TusbDeviceStateT* {.size: sizeof(cint).} = enum
    TUSB_DEVICE_STATE_UNPLUG = 0, TUSB_DEVICE_STATE_CONFIGURED,
    TUSB_DEVICE_STATE_SUSPENDED
  XferResultT* {.size: sizeof(cint).} = enum
    XFER_RESULT_SUCCESS, XFER_RESULT_FAILED, XFER_RESULT_STALLED



const
  DESC_OFFSET_LEN* = 0
  DESC_OFFSET_TYPE* = 1

const
  INTERFACE_INVALID_NUMBER* = 0xff

type
  MicrosoftOs20TypeT* {.size: sizeof(cint).} = enum
    MS_OS_20_SET_HEADER_DESCRIPTOR = 0x00,
    MS_OS_20_SUBSET_HEADER_CONFIGURATION = 0x01,
    MS_OS_20_SUBSET_HEADER_FUNCTION = 0x02, MS_OS_20_FEATURE_COMPATBLE_ID = 0x03,
    MS_OS_20_FEATURE_REG_PROPERTY = 0x04, MS_OS_20_FEATURE_MIN_RESUME_TIME = 0x05,
    MS_OS_20_FEATURE_MODEL_ID = 0x06, MS_OS_20_FEATURE_CCGP_DEVICE = 0x07,
    MS_OS_20_FEATURE_VENDOR_REVISION = 0x08


const
  CONTROL_STAGE_SETUP* = 0
  CONTROL_STAGE_DATA* = 1
  CONTROL_STAGE_ACK* = 2


type
  TusbDescDeviceT* {.importc: "tusb_desc_device_t", header: "tusb_types.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    bcdUSB* {.importc: "bcdUSB".}: uint16
    bDeviceClass* {.importc: "bDeviceClass".}: uint8
    bDeviceSubClass* {.importc: "bDeviceSubClass".}: uint8
    bDeviceProtocol* {.importc: "bDeviceProtocol".}: uint8
    bMaxPacketSize0* {.importc: "bMaxPacketSize0".}: uint8
    idVendor* {.importc: "idVendor".}: uint16
    idProduct* {.importc: "idProduct".}: uint16
    bcdDevice* {.importc: "bcdDevice".}: uint16
    iManufacturer* {.importc: "iManufacturer".}: uint8
    iProduct* {.importc: "iProduct".}: uint8
    iSerialNumber* {.importc: "iSerialNumber".}: uint8
    bNumConfigurations* {.importc: "bNumConfigurations".}: uint8


type
  TusbDescBosT* {.importc: "tusb_desc_bos_t", header: "tusb_types.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    wTotalLength* {.importc: "wTotalLength".}: uint16
    bNumDeviceCaps* {.importc: "bNumDeviceCaps".}: uint8


type
  TusbDescConfigurationT* {.importc: "tusb_desc_configuration_t",
                           header: "tusb_types.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    wTotalLength* {.importc: "wTotalLength".}: uint16
    bNumInterfaces* {.importc: "bNumInterfaces".}: uint8
    bConfigurationValue* {.importc: "bConfigurationValue".}: uint8
    iConfiguration* {.importc: "iConfiguration".}: uint8
    bmAttributes* {.importc: "bmAttributes".}: uint8
    bMaxPower* {.importc: "bMaxPower".}: uint8


type
  TusbDescInterfaceT* {.importc: "tusb_desc_interface_t", header: "tusb_types.h",
                       bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    bInterfaceNumber* {.importc: "bInterfaceNumber".}: uint8
    bAlternateSetting* {.importc: "bAlternateSetting".}: uint8
    bNumEndpoints* {.importc: "bNumEndpoints".}: uint8
    bInterfaceClass* {.importc: "bInterfaceClass".}: uint8
    bInterfaceSubClass* {.importc: "bInterfaceSubClass".}: uint8
    bInterfaceProtocol* {.importc: "bInterfaceProtocol".}: uint8
    iInterface* {.importc: "iInterface".}: uint8


type
  INNER_C_STRUCT_tusb_types_375* {.importc: "tusb_desc_endpoint_t::no_name",
                                  header: "tusb_types.h", bycopy.} = object
    xfer* {.bitsize: 2.}: uint8
    sync* {.bitsize: 2.}: uint8
    usage* {.bitsize: 2.}: uint8
    reserved* {.bitsize: 2.}: uint8

  TusbDescEndpointT* {.importc: "tusb_desc_endpoint_t", header: "tusb_types.h",
                      bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    bEndpointAddress* {.importc: "bEndpointAddress".}: uint8
    bmAttributes* {.importc: "bmAttributes".}: INNER_C_STRUCT_tusb_types_375
    wMaxPacketSize* {.importc: "wMaxPacketSize".}: uint16
    bInterval* {.importc: "bInterval".}: uint8


type
  TusbDescOtherSpeedT* {.importc: "tusb_desc_other_speed_t",
                        header: "tusb_types.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    wTotalLength* {.importc: "wTotalLength".}: uint16
    bNumInterfaces* {.importc: "bNumInterfaces".}: uint8
    bConfigurationValue* {.importc: "bConfigurationValue".}: uint8
    iConfiguration* {.importc: "iConfiguration".}: uint8
    bmAttributes* {.importc: "bmAttributes".}: uint8
    bMaxPower* {.importc: "bMaxPower".}: uint8



type
  TusbDescDeviceQualifierT* {.importc: "tusb_desc_device_qualifier_t",
                             header: "tusb_types.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    bcdUSB* {.importc: "bcdUSB".}: uint16
    bDeviceClass* {.importc: "bDeviceClass".}: uint8
    bDeviceSubClass* {.importc: "bDeviceSubClass".}: uint8
    bDeviceProtocol* {.importc: "bDeviceProtocol".}: uint8
    bMaxPacketSize0* {.importc: "bMaxPacketSize0".}: uint8
    bNumConfigurations* {.importc: "bNumConfigurations".}: uint8
    bReserved* {.importc: "bReserved".}: uint8


type
  TusbDescInterfaceAssocT* {.importc: "tusb_desc_interface_assoc_t",
                            header: "tusb_types.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    bFirstInterface* {.importc: "bFirstInterface".}: uint8
    bInterfaceCount* {.importc: "bInterfaceCount".}: uint8
    bFunctionClass* {.importc: "bFunctionClass".}: uint8
    bFunctionSubClass* {.importc: "bFunctionSubClass".}: uint8
    bFunctionProtocol* {.importc: "bFunctionProtocol".}: uint8
    iFunction* {.importc: "iFunction".}: uint8



type
  TusbDescStringT* {.importc: "tusb_desc_string_t", header: "tusb_types.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    unicodeString* {.importc: "unicode_string".}: UncheckedArray[uint16]



type
  TusbDescBosPlatformT* {.importc: "tusb_desc_bos_platform_t",
                         header: "tusb_types.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    bDevCapabilityType* {.importc: "bDevCapabilityType".}: uint8
    bReserved* {.importc: "bReserved".}: uint8
    platformCapabilityUUID* {.importc: "PlatformCapabilityUUID".}: array[16, uint8]
    capabilityData* {.importc: "CapabilityData".}: UncheckedArray[uint8]



type
  TusbDescWebusbUrlT* {.importc: "tusb_desc_webusb_url_t", header: "tusb_types.h",
                       bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    bScheme* {.importc: "bScheme".}: uint8
    url* {.importc: "url".}: UncheckedArray[char]



type
  INNER_C_STRUCT_tusb_types_476* {.importc: "tusb_desc_dfu_functional_t::no_name",
                                  header: "tusb_types.h", bycopy.} = object
    bitCanDnload* {.bitsize: 1.}: uint8
    bitCanUpload* {.bitsize: 1.}: uint8
    bitManifestationTolerant* {.bitsize: 1.}: uint8
    bitWillDetach*  {.bitsize: 1.}: uint8
    reserved* {.bitsize: 4.}: uint8

  INNER_C_UNION_tusb_types_476* {.importc: "tusb_desc_dfu_functional_t::no_name",
                                 header: "tusb_types.h", bycopy, union.} = object
    bmAttributes* {.importc: "bmAttributes".}: INNER_C_STRUCT_tusb_types_476
    bAttributes* {.importc: "bAttributes".}: uint8

  TusbDescDfuFunctionalT* {.importc: "tusb_desc_dfu_functional_t",
                           header: "tusb_types.h", bycopy.} = object
    bLength* {.importc: "bLength".}: uint8
    bDescriptorType* {.importc: "bDescriptorType".}: uint8
    anoTusbTypes476* {.importc: "ano_tusb_types_476".}: INNER_C_UNION_tusb_types_476
    wDetachTimeOut* {.importc: "wDetachTimeOut".}: uint16
    wTransferSize* {.importc: "wTransferSize".}: uint16
    bcdDFUVersion* {.importc: "bcdDFUVersion".}: uint16



type
  INNER_C_STRUCT_tusb_types_496* {.importc: "tusb_control_request_t::no_name",
                                  header: "tusb_types.h", bycopy.} = object
    recipient* {.bitsize: 5.}: uint8
    `type`* {.bitsize: 2.}: uint8
    direction* {.bitsize: 1.}: uint8

  INNER_C_UNION_tusb_types_496* {.importc: "tusb_control_request_t::no_name",
                                 header: "tusb_types.h", bycopy, union.} = object
    bmRequestTypeBit* {.importc: "bmRequestType_bit".}: INNER_C_STRUCT_tusb_types_496
    bmRequestType* {.importc: "bmRequestType".}: uint8

  TusbControlRequestT* {.importc: "tusb_control_request_t", header: "tusb_types.h",
                        bycopy.} = object
    anoTusbTypes496* {.importc: "ano_tusb_types_496".}: INNER_C_UNION_tusb_types_496
    bRequest* {.importc: "bRequest".}: uint8
    wValue* {.importc: "wValue".}: uint16
    wIndex* {.importc: "wIndex".}: uint16
    wLength* {.importc: "wLength".}: uint16
