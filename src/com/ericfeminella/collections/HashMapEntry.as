/*
 Copyright (c) 2006  Eric J. Feminella  <eric@ericfeminella.com>
 All rights reserved.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

 @internal
 */

package com.ericfeminella.collections
{
    /**
     *
     * <code>HashMapEntry</code> provides a strongly typed object with which
     * objects can reference a <code>key</code> and <code>value</code> property.
     *
     * @see com.ericfeminella.collections.IHashMapEntry
     * @see com.ericfeminella.collections.IMap#putEntry
     * @see com.ericfeminella.collections.IMap#getEntries
     *
     */
    public class HashMapEntry implements IHashMapEntry
    {
        /**
         *
         * Defines the reference to the <code>key</code> which is to
         * be used as the <code>key</code> in an <code>IMap</code>
         * implementation.
         *
         */
        protected var _key:* = undefined;

        /**
         *
         * Defines the reference to the <code>value</code> which is to
         * be used as the <code>value</code> in an <code>IMap</code>
         * implementation.
         *
         */
        protected var _value:* = undefined;

        /**
         *
         * The <code>HashMapEntry</code> constructor requires the <code>key</code>
         * and <code>value</code> which is assigned to the <code>key</code>. The
         * <code>key</code> and <code>value</code> equate to the <code>key</code>
         * and <code>value</code> of an <code>IMap</code> entry.
         *
         */
        public function HashMapEntry(key:* = undefined, value:* = undefined)
        {
            _key   = key;
            _value = value;
        }

        /**
         *
         * @inheritDoc
         *
         */
        public function get key() : *
        {
            return _key;
        }

        /**
         *
         * @inheritDoc
         *
         */
        public function set key(key:*) : void
        {
            _key = key;
        }

        /**
         *
         * @inheritDoc
         *
         */
        public function get value() : *
        {
            return _value;
        }

        /**
         *
         * @inheritDoc
         *
         */
        public function set value(value:*) : void
        {
            _value = value;
        }
    }
}