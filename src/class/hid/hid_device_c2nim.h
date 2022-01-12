#ifdef C2NIM
#  def int8_t int8
#  def uint8_t uint8
#  def int16_t int16
#  def uint16_t uint16
#  def int32_t int32
#  def uint32_t uint32
#  def TU_ATTR_PACKED
#  def TU_BIT(n)             ((unsigned int)1 << (n))
#  def TU_ATTR_ALWAYS_INLINE
#  def TU_ATTR_WEAK
#endif


/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2019 Ha Thach (tinyusb.org)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * This file is part of the TinyUSB stack.
 */

#ifndef _TUSB_HID_DEVICE_H_
#define _TUSB_HID_DEVICE_H_

#include "hid.h"

#ifdef __cplusplus
 extern "C" {
#endif

//--------------------------------------------------------------------+
// Class Driver Default Configure & Validation
//--------------------------------------------------------------------+

#if !defined(CFG_TUD_HID_EP_BUFSIZE) & defined(CFG_TUD_HID_BUFSIZE)
  // TODO warn user to use new name later on
  // #warning CFG_TUD_HID_BUFSIZE is renamed to CFG_TUD_HID_EP_BUFSIZE, please update to use the new name
  #define CFG_TUD_HID_EP_BUFSIZE  CFG_TUD_HID_BUFSIZE
#endif

#ifndef CFG_TUD_HID_EP_BUFSIZE
  #define CFG_TUD_HID_EP_BUFSIZE     64
#endif

//--------------------------------------------------------------------+
// Application API (Multiple Instances)
// CFG_TUD_HID > 1
//--------------------------------------------------------------------+

// Check if the interface is ready to use
bool tud_hid_n_ready(uint8_t instance);

// Get interface supported protocol (bInterfaceProtocol) check out hid_interface_protocol_enum_t for possible values
uint8_t tud_hid_n_interface_protocol(uint8_t instance);

// Get current active protocol: HID_PROTOCOL_BOOT (0) or HID_PROTOCOL_REPORT (1)
uint8_t tud_hid_n_get_protocol(uint8_t instance);

// Send report to host
bool tud_hid_n_report(uint8_t instance, uint8_t report_id, void const* report, uint8_t len);

// KEYBOARD: convenient helper to send keyboard report if application
// use template layout report as defined by hid_keyboard_report_t
bool tud_hid_n_keyboard_report(uint8_t instance, uint8_t report_id, uint8_t modifier, uint8_t keycode[6]);

// MOUSE: convenient helper to send mouse report if application
// use template layout report as defined by hid_mouse_report_t
bool tud_hid_n_mouse_report(uint8_t instance, uint8_t report_id, uint8_t buttons, int8_t x, int8_t y, int8_t vertical, int8_t horizontal);

// Gamepad: convenient helper to send gamepad report if application
// use template layout report TUD_HID_REPORT_DESC_GAMEPAD
bool tud_hid_n_gamepad_report(uint8_t instance, uint8_t report_id, int8_t x, int8_t y, int8_t z, int8_t rz, int8_t rx, int8_t ry, uint8_t hat, uint32_t buttons);

//--------------------------------------------------------------------+
// Application API (Single Port)
//--------------------------------------------------------------------+
static inline bool    tud_hid_ready(void);
static inline uint8_t tud_hid_interface_protocol(void);
static inline uint8_t tud_hid_get_protocol(void);
static inline bool    tud_hid_report(uint8_t report_id, void const* report, uint8_t len);
static inline bool    tud_hid_keyboard_report(uint8_t report_id, uint8_t modifier, uint8_t keycode[6]);
static inline bool    tud_hid_mouse_report(uint8_t report_id, uint8_t buttons, int8_t x, int8_t y, int8_t vertical, int8_t horizontal);
static inline bool    tud_hid_gamepad_report(uint8_t report_id, int8_t x, int8_t y, int8_t z, int8_t rz, int8_t rx, int8_t ry, uint8_t hat, uint32_t buttons);

//--------------------------------------------------------------------+
// Callbacks (Weak is optional)
//--------------------------------------------------------------------+

// Invoked when received GET HID REPORT DESCRIPTOR request
// Application return pointer to descriptor, whose contents must exist long enough for transfer to complete
uint8_t const * tud_hid_descriptor_report_cb(uint8_t instance);

// Invoked when received GET_REPORT control request
// Application must fill buffer report's content and return its length.
// Return zero will cause the stack to STALL request
uint16_t tud_hid_get_report_cb(uint8_t instance, uint8_t report_id, hid_report_type_t report_type, uint8_t* buffer, uint16_t reqlen);

// Invoked when received SET_REPORT control request or
// received data on OUT endpoint ( Report ID = 0, Type = 0 )
void tud_hid_set_report_cb(uint8_t instance, uint8_t report_id, hid_report_type_t report_type, uint8_t const* buffer, uint16_t bufsize);

// Invoked when received SET_PROTOCOL request
// protocol is either HID_PROTOCOL_BOOT (0) or HID_PROTOCOL_REPORT (1)
TU_ATTR_WEAK void tud_hid_set_protocol_cb(uint8_t instance, uint8_t protocol);

// Invoked when received SET_IDLE request. return false will stall the request
// - Idle Rate = 0 : only send report if there is changes, i.e skip duplication
// - Idle Rate > 0 : skip duplication, but send at least 1 report every idle rate (in unit of 4 ms).
TU_ATTR_WEAK bool tud_hid_set_idle_cb(uint8_t instance, uint8_t idle_rate);

// Invoked when sent REPORT successfully to host
// Application can use this to send the next report
// Note: For composite reports, report[0] is report ID
TU_ATTR_WEAK void tud_hid_report_complete_cb(uint8_t instance, uint8_t const* report, uint8_t len);


//--------------------------------------------------------------------+
// Inline Functions
//--------------------------------------------------------------------+
static inline bool tud_hid_ready(void)
{
  return tud_hid_n_ready(0);
}

static inline uint8_t tud_hid_interface_protocol(void)
{
  return tud_hid_n_interface_protocol(0);
}

static inline uint8_t tud_hid_get_protocol(void)
{
  return tud_hid_n_get_protocol(0);
}

static inline bool tud_hid_report(uint8_t report_id, void const* report, uint8_t len)
{
  return tud_hid_n_report(0, report_id, report, len);
}

static inline bool tud_hid_keyboard_report(uint8_t report_id, uint8_t modifier, uint8_t keycode[6])
{
  return tud_hid_n_keyboard_report(0, report_id, modifier, keycode);
}

static inline bool tud_hid_mouse_report(uint8_t report_id, uint8_t buttons, int8_t x, int8_t y, int8_t vertical, int8_t horizontal)
{
  return tud_hid_n_mouse_report(0, report_id, buttons, x, y, vertical, horizontal);
}

static inline bool  tud_hid_gamepad_report(uint8_t report_id, int8_t x, int8_t y, int8_t z, int8_t rz, int8_t rx, int8_t ry, uint8_t hat, uint32_t buttons)
{
  return tud_hid_n_gamepad_report(0, report_id, x, y, z, rz, rx, ry, hat, buttons);
}

//--------------------------------------------------------------------+
// Internal Class Driver API
//--------------------------------------------------------------------+
void     hidd_init            (void);
void     hidd_reset           (uint8_t rhport);
uint16_t hidd_open            (uint8_t rhport, tusb_desc_interface_t const * itf_desc, uint16_t max_len);
bool     hidd_control_xfer_cb (uint8_t rhport, uint8_t stage, tusb_control_request_t const * request);
bool     hidd_xfer_cb         (uint8_t rhport, uint8_t ep_addr, xfer_result_t event, uint32_t xferred_bytes);

#ifdef __cplusplus
 }
#endif

#endif /* _TUSB_HID_DEVICE_H_ */
