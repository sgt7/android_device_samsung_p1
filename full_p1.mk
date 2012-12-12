# Copyright (C) 2009 The Android Open Source Project
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

# --------------------------------------------------------------------------------
# This file is the build configuration for a full Android build.
# --------------------------------------------------------------------------------

# Inherit device configuration.
$(call inherit-product, device/samsung/p1/p1.mk)

# --------------------------------------------------------------------------------
# Discard inherited values and use our own instead.
# --------------------------------------------------------------------------------

PRODUCT_NAME := full_p1
PRODUCT_DEVICE := p1
PRODUCT_MODEL := GT-P1000
