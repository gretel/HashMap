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
     * <code>HashMap</code> provides a standardized API for working
     * with <code>key</code> / <code>value</code> pairs.
     *
     * @example The following example demonstrates a typical client
     * implementation of a <code>Hashmap</code> instance in which
     * <code>key</code> / <code>value</code> pairs are added and
     * retrieved.
     *
     * <listing version="3.0">
     *
     * import com.ericfeminella.collections.HashMap;
     * import com.ericfeminella.collections.IMap;
     *
     * private function init() : void
     * {
     *     var map:IMap = new HashMap();
     *     map.put("a", "value A");
     *     map.put("b", "value B");
     *     map.put("c", "value C");
     *     map.put("x", "value X");
     *     map.put("y", "value Y");
     *     map.put("z", "value Z");
     *
     *     trace( map.getKeys() ); // b,x,z,a,c,y
     *     trace( map.getValues() ); // value B,value X,value Z,value A,value C,value Y
     *     trace( map.size() ); // 6
     * }
     *
     * </listing>
     *
     * @see http://livedocs.adobe.com/flex/3/langref/flash/utils/Dictionary.html
     * @see com.ericfeminella.collections.IMap
     *
     */
    public class HashMap implements IMap
    {
        /**
         *
         * Defines the underlying <code>Dictionary</code> instance to
         * which each <code>key</code> / <code>value</code> pair is added.
         *
         * @see http://livedocs.adobe.com/flex/3/langref/flash/utils/Dictionary.html
         *
         */
        protected var map:Dictionary = null;

        /**
         *
         * <code>HashMap</code> constructor initializes a new instance
         * using <em>weak key</em> references by default in order to ensure
         * objects are eligible for Garbage Collection immediately after they
         * are no longer being referenced.
         *
         * @example
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap( false );
         *
         * </listing>
         *
         * @param Specifies if weak key references should be used.
         *
         */
        public function HashMap(useWeakReferences:Boolean = true)
        {
            map = new Dictionary( useWeakReferences );
        }

        /**
         *
         * Adds a <code>key</code> / <code>value</code> pair to the map.
         *
         * @example The following demonstrates adding a <code>key</code>
         * <code>value</code> pair to a map via <code>put();</code>.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * map.put( "password", null );
         *
         * </listing>
         *
         * @param The <code>key</code> to add to the map.
         * @param The <code>value</code> of the specified <code>key</code>.
         *
         */
        public function put(key:*, value:*) : void
        {
            map[key] = value;
        }

        /**
         *
         * Places all <code>key</code> / <code>value</code> pairs defined
         * within the <code>Dictionary</code> instance into the map.
         *
         * @example The following demonstrates adding <code>key</code>
         * <code>value</code> pairs from a <code>Dictionary</code>
         * instance to a <code>HashMap</code> instance.
         *
         * <listing version="3.0">
         *
         * var dict:Dictionary = new Dictionary();
         * dict.a = "foo";
         * dict.b = "bar";
         *
         * var map:IMap = new HashMap();
         * map.putAll( dict );
         *
         * trace( map.getKeys() ); // a, b
         * trace( map.getValues() ); // foo, bar
         *
         * </listing>
         *
         * @param <code>Dictionary</code> of name / value pairs.
         *
         */
        public function putAll(table:Dictionary) : void
        {
            for ( var prop:* in table )
            {
                put( prop, table[prop] );
            }
        }

        /**
         *
         * Allows for a strongly typed entry to be added to the map whereby
         * the <code>key</code> and <code>value</code> are typed properties
         * of an <code>IHashMapEntry</code> as oppossed to <code>untyped</code>
         * <code>key</code> / <code>value</code> pairs, such as is the case
         * with <code>IMap.put();</code>.
         *
         * <p>
         * <code>HashMap.putEntry();</code> essentially is intended to server
         * as a pseudo-overloaded implementation of <code>HashMap.put();</code>
         * </p>
         *
         * @example The following demonstrates adding a <code>key</code>
         * and <code>value</code> defined by a <code>IHashMapEntry</code>
         * instance to a <code>HashMap</code>.
         *
         * <listing version="3.0">
         *
         * var entry:IHashMapEntry = new HashMapEntry( "foo", "bar" );
         * map.put( entry );
         *
         * trace( map.getKey( "bar" ) ); // foo
         * trace( map.getValue( "foo" ) ); // bar
         *
         * </listing>
         *
         * @param <code>IHashMapEntry</code> instance which defines the
         *        <code>key</code> / <code>value</code> pair which is to
         *        be added to the map.
         * @see HashMap#put
         *
         */
        public function putEntry(entry:IHashMapEntry) : void
        {
            put( entry.key, entry.value );
        }

        /**
         *
         * Removes a <code>key</code> / <code>value</code> pair from the
         * map.
         *
         * @example
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * trace( map.getValue( "username" ) ); // efeminella
         *
         * map.remove( "username" );
         *
         * trace( map.getValue ); // undefined
         * trace( map.size ); // 0
         *
         * </listing>
         *
         * @param The <code>key</code> in which to remove from the map.
         * @return Removed <code>value</code>.
         *
         */
        public function remove(key:*) : *
        {
            var v:* = map[ key ];
            delete map[ key ];
            return v;
        }

        /**
         *
         * Determines if the specified <code>key</code> exists in the map.
         *
         * @example
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * trace( map.getValue( "username" ) ); // efeminella
         *
         * map.remove( "username" );
         *
         * trace( map.getValue ); // undefined
         * trace( map.size ); // 0
         *
         * </listing>
         *
         * @param  The <code>key</code> in which to determine existance
         *         in the map.
         * @return <code>true</code> if the <code>value</code> exists,
         *         otherwise <code>false</code>.
         *
         */
        public function containsKey(key:*) : Boolean
        {
            return map.hasOwnProperty( key );
        }

        /**
         *
         * Determines if the specified <code>value</code> exists in the
         * <code>IMap</code> instance.
         *
         * @example
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
         *
         * trace( map.containsValue( "efeminella" ) ); //true
         * trace( map.containsValue( "foo" ) ); //false
         *
         * </listing>
         *
         * @param  The <code>value</code> in which to determine existance
         *         in the <code>IMap</code> instance.
         * @return <code>true</code> if the <code>value</code> exists,
         *         otherwise <code>false</code>.
         *
         */
        public function containsValue(value:*) : Boolean
        {
            for ( var key:* in map )
            {
                if ( map[ key ] == value )
                {
                    return true;
                }
            }
            return false;
        }

        /**
         *
         * Returns the <code>value</code> assigned to the specified
         * <code>key</code> in the map.
         *
         * <p>
         * If multiple <code>keys</code> exists in the map with the same
         * <code>value</code>, the first key located will be returned.
         * </p>
         *
         * @example The following demonstrates calling <code>getKey()</code>
         * where the specified <code>value</code> has been assigned to only
         * one <code>key</code>. This is the typical scenario.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
         *
         * trace( map.getKey( "efeminella" ) ); //username
         *
         * </listing>
         *
         * @example The following demonstrates calling <code>getKey()</code>
         * where the specified <code>value</code> has been assigned to more
         * than one <code>key</code>.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "a", true );
         * map.put( "b", false );
         * map.put( "c", false );
         * map.put( "d", true );
         *
         * trace( map.getKey( false ) ); //b
         *
         * </listing>
         *
         * @param  The <code>key</code> to retrieve the <code>value</code> of.
         * @return The <code>value</code> of the specified <code>key</code>.
         *
         */
        public function getKey(value:*) : *
        {
            var identifier:* = undefined;

            for ( var key:* in map )
            {
                if ( map[ key ] == value )
                {
                    identifier = key;
                    break;
                }
            }
            return identifier;
        }

        /**
         *
         * Returns each <code>key</code> which has been defined in the map.
         *
         * @example The following demonstrates retrieving all <code>keys</code>
         * defined in the map.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "a", true );
         * map.put( "b", false );
         * map.put( "c", false );
         * map.put( "d", true );
         *
         * trace( map.getKeys() ); //a,b,c,d
         *
         * </listing>
         *
         * @return <code>Array</code> of <code>key</code> identifiers.
         *
         */
        public function getKeys() : Array
        {
            var keys:Array = [];

            for ( var key:* in map )
            {
                keys.push( key );
            }
            return keys;
        }

        /**
         *
         * Returns the <code>value</code> assigned to the specified <code>key</code>
         * in the map.
         *
         * @example The following demonstrates retrieving a <code>value</code>
         * assigned to the specified <code>key</code>.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
         *
         * trace( map.getValue( "username" ) ); //efeminella
         * trace( map.getValue( "password" ) ); //dda7806a4847ec61b5940c2623a5aabd
         *
         * </listing>
         *
         * @param  The <code>key</code> to retrieve the <code>value</code> of.
         * @return The <code>value</code> of the specified <code>key</code>.
         *
         */
        public function getValue(key:*) : *
        {
            return map[key];
        }

        /**
         *
         * Retrieves the <code>value</code> assigned to each <code>key</code>
         * in the map.
         *
         * @example The following demonstrates calling <code>getValues()</code>
         * in order to retrieve the <code>value</code> of each <code>key</code>
         * defined in the map.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
         *
         * trace( map.getValues() ); //efeminella, dda7806a4847ec61b5940c2623a5aabd
         *
         * </listing>
         *
         * @return <code>Array</code> containing the value of each <code>key</code>
         *         defined in the map.
         *
         */
        public function getValues() : Array
        {
            var values:Array = [];

            for (var key:* in map)
            {
                values.push( map[key] );
            }
            return values;
        }

        /**
         *
         * Retrieves the <code>size</code> of the map. The size is determined
         * based on the number of <code>keys</code> defined in the map.
         *
         * @example The following demonstrates calling <code>size();</code>
         * to determine the number of entries (<code>keys</code>) defined
         * in the map.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "a", true );
         * map.put( "b", false );
         * map.put( "c", false );
         * map.put( "d", true );
         *
         * trace( map.size() ); //4
         *
         * </listing>
         *
         * @return The number of <code>keys</code> defined in the map.
         *
         */
        public function size() : int
        {
            var length:int = 0;

            for ( var key:* in map )
            {
                length++;
            }
            return length;
        }

        /**
         *
         * Determines if the map is empty. This essentially equates to
         * evaluating if there are any <code>keys</code> defined in the
         * map.
         *
         * @example The following demonstrates calling <code>isEmpty</code>
         * to determine if there have been any <code>keys</code> previously
         * added to the map.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "a", 1 );
         * map.put( "b", 2 );
         *
         * trace( map.isEmpty() ); //false
         *
         * </listing>
         *
         * @return <code>true</code> if empty, otherwise <code>false</code>.
         *
         */
        public function isEmpty() : Boolean
        {
            return size() <= 0;
        }

        /**
         *
         * Assigns <code>undefined</code> as the <code>value</code> of each
         * <code>key</code> in the map.
         *
         * @example The following demonstrates resetting all <code>keys</code>
         * in a <code>HashMap</code> instance.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
         *
         * trace( map.getValues() ); //efeminella, dda7806a4847ec61b5940c2623a5aabd
         *
         * map.reset();
         *
         * trace( map.getValues() ); //undefined, undefined
         *
         * </listing>
         *
         */
        public function reset() : void
        {
            for ( var key:* in map )
            {
                map[ key ] = undefined;
            }
        }

        /**
         *
         * Assigns <code>undefined</code> as the <code>value</code> of each
         * <code>key</code> in the map, with the exception of the specified
         * <code>key</code>.
         *
         * @example The following demonstrates resetting all <code>keys</code>
         * in a <code>HashMap</code> instance.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
         *
         * trace( map.getValues() ); //efeminella, dda7806a4847ec61b5940c2623a5aabd
         *
         * map.resetAllExcept( "username" );
         * trace( map.getValues() ); //efeminella, undefined
         *
         * </listing>
         *
         * @param the key which is not to be cleared from the map
         *
         */
        public function resetAllExcept(keyId:*) : void
        {
            for ( var key:* in map )
            {
                if ( key != keyId )
                {
                    map[ key ] = undefined;
                }
            }
        }

        /**
         *
         * Clears all <code>key</code> / <code>value</code> pairs which have
         * been defined in the map. This operation effectively removes all
         * items from the map, and puts it back in its initialized state.
         *
         * @example The following demonstrates clearing all items from a map.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
         *
         * trace( map.size() ); //2
         *
         * map.clear();
         *
         * trace( map.size() ); //0
         *
         * </listing>
         *
         */
        public function clear() : void
        {
            for ( var key:* in map )
            {
                remove( key );
            }
        }

        /**
         *
         * Clears all <code>key</code> / <code>value</code> pairs which
         * have been defined in the map, with the exception of the specified
         * <code>key</code>.
         *
         * @example The following demonstrates clearing all items from a
         * map with the exception of the specified item.
         *
         * <listing version="3.0">
         *
         * var map:IMap = new HashMap();
         * map.put( "username", "efeminella" );
         * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
         *
         * trace( map.getValue( "username" ) ); //efeminella
         * trace( map.getValue( "password" ) ); //dda7806a4847ec61b5940c2623a5aabd
         * trace( map.size() ); //2
         *
         * map.clearAllExcept( "username" );
         *
         * trace( map.getValue( "username" ) ); //efeminella
         * trace( map.getValue( "password" ) ); //undefined
         * trace( map.size() ); //1
         *
         * </listing>
         *
         * @param The <code>key</code> which is not to be cleared from the map.
         *
         */
        public function clearAllExcept(keyId:*) : void
        {
            for ( var key:* in map )
            {
                if ( key != keyId )
                {
                    remove( key );
                }
            }
        }

        /**
         *
         * Returns an <code>Array</code> of <code>IHashMapEntry</code>
         * instances based on all <code>key</code> / <code>value</code>
         * pairs defined in the map.
         *
         * @param <code>Array</code> of <code>IHashMapEntry</code> instances.
         *
         */
        public function getEntries() : Array
        {
            var list:Array = new Array();

            for ( var key:* in map )
            {
                list.push( new HashMapEntry( key, map[key] ) );
            }
            return list;
        }
    }
}