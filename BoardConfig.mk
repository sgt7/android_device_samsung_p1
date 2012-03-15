# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# Prebuilt Kernel
TARGET_PREBUILT_KERNEL := device/samsung/p1/kernel

# Releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/p1/releasetools/p1_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/samsung/p1/releasetools/p1_img_from_target_files

TARGET_OTA_ASSERT_DEVICE := galaxytab,GT-P1000,GT-P1000L,GT-P1000N

# Import the p1-common BoardConfigCommon.mk
include device/samsung/p1-common/BoardConfigCommon.mk
