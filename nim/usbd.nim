import ./common


proc tudInit*(rhport: uint8): bool {.importc: "tud_init", header: "usbd.h".}

proc tudInited*(): bool {.importc: "tud_inited", header: "usbd.h".}

proc tudTask*() {.importc: "tud_task", header: "usbd.h".}

proc tudTaskEventReady*(): bool {.importc: "tud_task_event_ready",
                               header: "usbd.h".}

proc dcdIntHandler*(rhport: uint8) {.importc: "dcd_int_handler", header: "usbd.h".}
const
  tudIntHandler* = dcdIntHandler


proc tudSpeedGet*(): TusbSpeedT {.importc: "tud_speed_get", header: "usbd.h".}

proc tudConnected*(): bool {.importc: "tud_connected", header: "usbd.h".}

proc tudMounted*(): bool {.importc: "tud_mounted", header: "usbd.h".}

proc tudSuspended*(): bool {.importc: "tud_suspended", header: "usbd.h".}

proc tudReady*(): bool {.inline.} =
  return tudMounted() and not tudSuspended()


proc tudRemoteWakeup*(): bool {.importc: "tud_remote_wakeup", header: "usbd.h".}

proc tudDisconnect*(): bool {.importc: "tud_disconnect", header: "usbd.h".}

proc tudConnect*(): bool {.importc: "tud_connect", header: "usbd.h".}

proc tudControlXfer*(rhport: uint8; request: ptr TusbControlRequestT; buffer: pointer;
                    len: uint16): bool {.importc: "tud_control_xfer",
                                      header: "usbd.h".}

proc tudControlStatus*(rhport: uint8; request: ptr TusbControlRequestT): bool {.
    importc: "tud_control_status", header: "usbd.h".}

proc tudDescriptorDeviceCb*(): ptr uint8 {.importc: "tud_descriptor_device_cb",
                                       header: "usbd.h".}

proc tudDescriptorConfigurationCb*(index: uint8): ptr uint8 {.
    importc: "tud_descriptor_configuration_cb", header: "usbd.h".}

proc tudDescriptorStringCb*(index: uint8; langid: uint16): ptr uint16 {.
    importc: "tud_descriptor_string_cb", header: "usbd.h".}

proc tudDescriptorBosCb*(): ptr uint8 {.importc: "tud_descriptor_bos_cb",
                                    header: "usbd.h".}

proc tudDescriptorDeviceQualifierCb*(): ptr uint8 {.
    importc: "tud_descriptor_device_qualifier_cb", header: "usbd.h".}

proc tudDescriptorOtherSpeedConfigurationCb*(index: uint8): ptr uint8 {.
    importc: "tud_descriptor_other_speed_configuration_cb", header: "usbd.h".}

proc tudMountCb*() {.importc: "tud_mount_cb", header: "usbd.h".}

proc tudUmountCb*() {.importc: "tud_umount_cb", header: "usbd.h".}

proc tudSuspendCb*(remoteWakeupEn: bool) {.importc: "tud_suspend_cb",
                                        header: "usbd.h".}

proc tudResumeCb*() {.importc: "tud_resume_cb", header: "usbd.h".}

proc tudVendorControlXferCb*(rhport: uint8; stage: uint8;
                            request: ptr TusbControlRequestT): bool {.
    importc: "tud_vendor_control_xfer_cb", header: "usbd.h".}
