#
# Copyright (C) 2008 The Android Open Source Project
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

import os, sys

LOCAL_DIR = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
RELEASETOOLS_DIR = os.path.abspath(os.path.join(LOCAL_DIR, '../../../build/tools/releasetools'))

import edify_generator

class EdifyGenerator(edify_generator.EdifyGenerator):
    def AssertDevice(self, device):
      edify_generator.EdifyGenerator.AssertDevice(self, device)

      self.script.append('ui_print("Welcome to CyanogenMod 9 for Galaxy Tab");')
      self.script.append('ui_print("The TE4M");')

      self.script.append(
           ('package_extract_file("mke2fs", "/tmp/mke2fs");\n'
            'set_perm(0, 0, 0777, "/tmp/mke2fs");'))
      self.script.append(
            ('package_extract_file("busybox", "/tmp/busybox");\n'
             'set_perm(0, 0, 0777, "/tmp/busybox");'))
             
      self.script.append(
            ('package_extract_file("redbend_ua", "/tmp/redbend_ua");\n'
             'set_perm(0, 0, 0777, "/tmp/redbend_ua");'))

      self.script.append('package_extract_file("zImage", "/tmp/zImage");')

      self.script.append('package_extract_file("updater.sh", "/tmp/updater.sh");')

    def RunBackup(self, command):
      edify_generator.EdifyGenerator.RunBackup(self, command)

    def RedbendUA(self, image, device):
      self.script.append(
          ('run_program("/tmp/redbend_ua", "restore", "' + image + '", "' + device + '");'))
