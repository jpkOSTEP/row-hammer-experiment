/*
 * Originally part of DRAMMER (https://github.com/vusec/drammer)
 * Copyright 2016, Victor van der Veen
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Modifications by Jay Kania, 2025
 */

#ifndef __MASSAGE_H__
#define __MASSAGE_H__

void defrag(int alloc_timer);
int exhaust(std::vector<struct ion_data *> &chunks, int min_bytes, bool mmap = true);

#endif