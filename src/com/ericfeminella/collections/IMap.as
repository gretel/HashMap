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
    import flash.utils.Dictionary;

    /**
     *
     * Defines the contract for lightweight HashMap implementations
     * which are to expose an API into a managed collection of key /
     * value pairs.
     *
     */
    public interface IMap
    {
        /**
         *
         * Adds a <code>key</code> / <code>value</code> pair to the map.
         *
         * @param The <code>key</code> to add to the map.
         * @param The <code>value</code> of the specified <code>key</code>.
         *
         */
        function put(key:*, value:*) : void;

        /**
         *
         * Places all <code>key</code> / <code>value</code> pairs defined
         * within the <code>Dictionary</code> instance into the map.
         *
         * @param <code>Dictionary</code> of name / value pairs.
         *
         */
        function putAll(table:Dictionary) : void;

        /**
         *
         * <code>putEntry</code> is intended as a pseudo-overloaded
         * <code>put</code> implementation whereby clients may call
         * <code>putEntry</code> to pass an <code>IHashMapEntry</code>
         * implementation.
         *
         * <p>
         * An <code>IHashMapEntry</code> allows for a strongly typed
         * <code>IMap</code> entry whereby the <code>key</code> and
         * it's associated <code>value</code> are strongly typed
         * properties.
         * </p>
         *
         * @param <code>IHashMapEntry</code> implementation instance.
         *
         */
        function putEntry(entry:IHashMapEntry) : void;

        /**
         *
         * Removes a <code>key</code> / <code>value</code> pair from the
         * map.
         *
         * @param The <code>key</code> in which to remove from the map.
         * @return Removed <code>value</code>.
         *
         */
        function remove(key:*) : *;

        /**
         *
         * Determines if the specified <code>key</code> exists in the
         * <code>IMap</code> instance.
         *
         * @param  The <code>key</code> in which to determine existance
         *         in the <code>IMap</code> instance.
         * @return <code>true</code> if the <code>value</code> exists,
         *         otherwise <code>false</code>.
         *
         */
        function containsKey(key:*) : Boolean;

        /**
         *
         * Determines if the specified <code>value</code> exists in the
         * <code>IMap</code> instance.
         *
         * @param  The <code>value</code> in which to determine existance
         *         in the <code>IMap</code> instance.
         * @return <code>true</code> if the <code>value</code> exists,
         *         otherwise <code>false</code>.
         *
         */
        function containsValue(value:*) : Boolean;

        /**
         *
         * Returns the <code>value</code> of the specified <code>key</code>
         * within the <code>IMap</code> instance.
         *
         * @param  The <code>key</code> with which the associated <code>value</code>
         *         belongs.
         * @return The <code>value</code> of the specified <code>key</code>.
         *
         */
        function getKey(value:*) : *;

        /**
         *
         * Returns the <code>value</code> assigned to the specified <code>key</code>
         * in the map.
         *
         * @param  The <code>key</code> to retrieve the <code>value</code> of.
         * @return The <code>value</code> of the specified <code>key</code>.
         *
         */
        function getValue(key:*) : *;

        /**
         *
         * Returns each <code>key</code> defined within the map.
         *
         * @return <code>Array<code> of <code>key</code> identifiers.
         *
         */
        function getKeys() : Array;

        /**
         *
         * Returns the <code>value</code> assigned to each <code>key</code>
         * in the map.
         *
         * @return <code>Array</code> containing the value of each
         *         <code>key</code> defined in the map.
         *
         */
        function getValues() : Array;

        /**
         *
         * Retrieves the <code>size</code> of the map. The size is determined
         * based on the number of <code>keys</code> defined in the map.
         *
         * @return The number of <code>keys</code> defined in the map.
         *
         */
        function size() : int;

        /**
         *
         * Determines if the map is empty. This essentially equates to
         * evaluating if there are any <code>keys</code> defined in the
         * map.
         *
         * @return <code>true</code> if empty, otherwise <code>false</code>.
         *
         */
        function isEmpty() : Boolean;

        /**
         *
         * Assigns <code>undefined</code> as the <code>value</code> of each
         * <code>key</code> in the map.
         *
         */
        function reset() : void;

        /**
         *
         * Assigns <code>undefined</code> as the <code>value</code> of each
         * <code>key</code> in the map, with the exception of the specified
         * <code>key</code>.
         *
         */
        function resetAllExcept(key:*) : void;

        /**
         *
         * Clears all <code>key</code> / <code>value</code> pairs which have
         * been defined in the map. This operation effectively removes all
         * items from the map, and puts it back in its initialized state.
         *
         */
        function clear() : void;

        /**
         *
         * Clears all <code>key</code> / <code>value</code> pairs which
         * have been defined in the map, with the exception of the specified
         * <code>key</code>.
         *
         * @param The <code>key</code> which is not to be cleared from the map.
         *
         */
        function clearAllExcept(key:*) : void;

        /**
         *
         * Returns an <code>Array</code> of <code>IHashMapEntry</code>
         * instances based on all <code>key</code> / <code>value</code>
         * pairs defined in the map.
         *
         * @param <code>Array</code> of <code>IHashMapEntry</code> instances.
         *
         */
        function getEntries() : Array;
    }
}