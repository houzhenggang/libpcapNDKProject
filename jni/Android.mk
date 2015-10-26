LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := pcaptest
LOCAL_SRC_FILES := pcaptest.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/libpcap1.7.4
LOCAL_STATIC_LIBRARIES := libpcap  

LOCAL_LDLIBS := -ldl -llog  

include $(BUILD_SHARED_LIBRARY)

include $(LOCAL_PATH)/libpcap1.7.4/Android.mk
