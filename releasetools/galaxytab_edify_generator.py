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
VENDOR_SAMSUNG_DIR = os.path.abspath(os.path.join(LOCAL_DIR, '../../../vendor/samsung'))

import edify_generator

class EdifyGenerator(edify_generator.EdifyGenerator):
    def AssertDevice(self, device):
      edify_generator.EdifyGenerator.AssertDevice(self, device)
      self.script.append('show_progress(0.15, 5);');
      self.script.append(
            ('package_extract_file("modem.bin", "/tmp/modem.bin");\n'
             'set_perm(0, 0, 0777, "/tmp/modem.bin");'))
      self.script.append(
            ('package_extract_file("updater.sh", "/tmp/updater.sh");\n'
             'set_perm(0, 0, 0777, "/tmp/updater.sh");'))
      self.script.append(
           ('package_extract_file("make_ext4fs", "/tmp/make_ext4fs");\n'
            'set_perm(0, 0, 0777, "/tmp/make_ext4fs");'))
      self.script.append(
            ('package_extract_file("busybox", "/tmp/busybox");\n'
             'set_perm(0, 0, 0777, "/tmp/busybox");'))
      self.script.append(
            ('package_extract_file("flash_image", "/tmp/flash_image");\n'
             'set_perm(0, 0, 0777, "/tmp/flash_image");'))
      self.script.append(
            ('package_extract_file("erase_image", "/tmp/erase_image");\n'
             'set_perm(0, 0, 0777, "/tmp/erase_image");'))
      self.script.append(
            ('package_extract_file("bml_over_mtd", "/tmp/bml_over_mtd");\n'
             'set_perm(0, 0, 0777, "/tmp/bml_over_mtd");'))
      self.script.append(
            ('package_extract_file("bml_over_mtd.sh", "/tmp/bml_over_mtd.sh");\n'
             'set_perm(0, 0, 0777, "/tmp/bml_over_mtd.sh");'))

      self.script.append('package_extract_file("boot.img", "/tmp/boot.img");')
      self.script.append('assert(run_program("/tmp/updater.sh") == 0);')

    def RunBackup(self, command):
      edify_generator.EdifyGenerator.RunBackup(self, command)

    def WriteBMLoverMTD(self, partition, partition_start_block, reservoirpartition, reservoir_start_block, image):
      """Write the given package file into the given partition."""

      args = {'partition': partition, 'partition_start_block': partition_start_block, 'reservoirpartition': reservoirpartition, 'reservoir_start_block': reservoir_start_block, 'image': image}

      self.script.append(
            ('assert(run_program("/tmp/erase_image", "%(partition)s"));') % args)

      self.script.append(
            ('assert(package_extract_file("%(image)s", "/tmp/%(partition)s.img"),\n'
             '       run_program("/tmp/bml_over_mtd.sh", "%(partition)s", "%(partition_start_block)s", "%(reservoirpartition)s", "%(reservoir_start_block)s", "/tmp/%(partition)s.img"),\n'
             '       delete("/tmp/%(partition)s.img"));') % args)

