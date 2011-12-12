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
      self.script.append('ui_print("Checking state of RFS/EXT4...");')
      self.script.append(
            ('package_extract_file("updater.sh", "/tmp/updater.sh");\n'
             'set_perm(0, 0, 0777, "/tmp/updater.sh");'))
      self.script.append(
           ('package_extract_file("make_ext4fs", "/tmp/make_ext4fs");\n'
            'set_perm(0, 0, 0777, "/tmp/make_ext4fs");'))
      self.script.append(
            ('package_extract_file("busybox", "/tmp/busybox");\n'
             'set_perm(0, 0, 0777, "/tmp/busybox");'))
      self.script.append('assert(run_program("/tmp/updater.sh") == 0);')
      self.script.append('ui_print("Formatting of EXT4 complete...");')

    def RunBackup(self, command):
      edify_generator.EdifyGenerator.RunBackup(self, command)

    def BMLWriteRawImage(self, partition, image):
      """Write the given package file into the given partition."""

      args = {'partition': partition, 'image': image}

      self.script.append(
            ('assert(package_extract_file("%(image)s", "/tmp/%(image)s"),\n'
             '       write_raw_image("/tmp/%(image)s", "%(partition)s"),\n'
             '       delete("/tmp/%(image)s"));') % args)
