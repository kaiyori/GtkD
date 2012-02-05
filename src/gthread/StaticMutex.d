/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * inFile  = 
 * outPack = gthread
 * outFile = StaticMutex
 * strct   = GStaticMutex
 * realStrct=
 * ctorStrct=
 * clss    = StaticMutex
 * interf  = 
 * class Code: Yes
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- g_static_mutex_
 * omit structs:
 * omit prefixes:
 * omit code:
 * omit signals:
 * imports:
 * 	- gthread.Mutex
 * structWrap:
 * 	- GMutex* -> Mutex
 * module aliases:
 * local aliases:
 * overrides:
 */

module gthread.StaticMutex;

public  import gtkc.gthreadtypes;

private import gtkc.gthread;
private import glib.ConstructionException;


private import gthread.Mutex;




/**
 * Description
 * Threads act almost like processes, but unlike processes all threads
 * of one process share the same memory. This is good, as it provides
 * easy communication between the involved threads via this shared
 * memory, and it is bad, because strange things (so called
 * "Heisenbugs") might happen if the program is not carefully designed.
 * In particular, due to the concurrent nature of threads, no
 * assumptions on the order of execution of code running in different
 * threads can be made, unless order is explicitly forced by the
 * programmer through synchronization primitives.
 * The aim of the thread related functions in GLib is to provide a
 * portable means for writing multi-threaded software. There are
 * primitives for mutexes to protect the access to portions of memory
 * (GMutex, GStaticMutex, G_LOCK_DEFINE, GStaticRecMutex and
 * GStaticRWLock). There are primitives for condition variables to
 * allow synchronization of threads (GCond). There are primitives for
 * thread-private data - data that every thread has a private instance
 * of (GPrivate, GStaticPrivate). Last but definitely not least there
 * are primitives to portably create and manage threads (GThread).
 * The threading system is initialized with g_thread_init(), which
 * takes an optional custom thread implementation or NULL for the
 * default implementation. If you want to call g_thread_init() with a
 * non-NULL argument this must be done before executing any other GLib
 * functions (except g_mem_set_vtable()). This is a requirement even if
 * no threads are in fact ever created by the process.
 * Calling g_thread_init() with a NULL argument is somewhat more
 * relaxed. You may call any other glib functions in the main thread
 * before g_thread_init() as long as g_thread_init() is not called from
 * a glib callback, or with any locks held. However, many libraries
 * above glib does not support late initialization of threads, so doing
 * this should be avoided if possible.
 * Please note that since version 2.24 the GObject initialization
 * function g_type_init() initializes threads (with a NULL argument),
 * so most applications, including those using Gtk+ will run with
 * threads enabled. If you want a special thread implementation, make
 * sure you call g_thread_init() before g_type_init() is called.
 * After calling g_thread_init(), GLib is completely thread safe (all
 * global data is automatically locked), but individual data structure
 * instances are not automatically locked for performance reasons. So,
 * for example you must coordinate accesses to the same GHashTable
 * from multiple threads. The two notable exceptions from this rule
 * are GMainLoop and GAsyncQueue, which are
 * threadsafe and need no further application-level locking to be
 * accessed from multiple threads.
 * To help debugging problems in multithreaded applications, GLib
 * supports error-checking mutexes that will give you helpful error
 * messages on common problems. To use error-checking mutexes, define
 * the symbol G_ERRORCHECK_MUTEXES when compiling the application.
 */
public class StaticMutex
{
	
	/** the main Gtk struct */
	protected GStaticMutex* gStaticMutex;
	
	
	public GStaticMutex* getStaticMutexStruct()
	{
		return gStaticMutex;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gStaticMutex;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GStaticMutex* gStaticMutex)
	{
		if(gStaticMutex is null)
		{
			this = null;
			return;
		}
		this.gStaticMutex = gStaticMutex;
	}
	
	/**
	 * Creates a new initialized StaticMutex.
	 */
	public this ()
	{
		this(new GStaticMutex);
		
		init();
	}
	
	/**
	 */
	
	/**
	 * Initializes mutex. Alternatively you can initialize it with
	 * G_STATIC_MUTEX_INIT.
	 */
	public void init()
	{
		// void g_static_mutex_init (GStaticMutex *mutex);
		g_static_mutex_init(gStaticMutex);
	}
	
	/**
	 * Works like g_mutex_lock(), but for a GStaticMutex.
	 */
	public void lock()
	{
		// void g_static_mutex_lock (GStaticMutex *mutex);
		g_static_mutex_lock(gStaticMutex);
	}
	
	/**
	 * Works like g_mutex_trylock(), but for a GStaticMutex.
	 * Returns: TRUE, if the GStaticMutex could be locked.
	 */
	public int trylock()
	{
		// gboolean g_static_mutex_trylock (GStaticMutex *mutex);
		return g_static_mutex_trylock(gStaticMutex);
	}
	
	/**
	 * Works like g_mutex_unlock(), but for a GStaticMutex.
	 */
	public void unlock()
	{
		// void g_static_mutex_unlock (GStaticMutex *mutex);
		g_static_mutex_unlock(gStaticMutex);
	}
	
	/**
	 * For some operations (like g_cond_wait()) you must have a GMutex
	 * instead of a GStaticMutex. This function will return the
	 * corresponding GMutex for mutex.
	 * Returns: the GMutex corresponding to mutex.
	 */
	public Mutex getMutex()
	{
		// GMutex * g_static_mutex_get_mutex (GStaticMutex *mutex);
		auto p = g_static_mutex_get_mutex(gStaticMutex);
		if(p is null)
		{
			return null;
		}
		return new Mutex(cast(GMutex*) p);
	}
	
	/**
	 * Releases all resources allocated to mutex.
	 * You don't have to call this functions for a GStaticMutex with an
	 * unbounded lifetime, i.e. objects declared 'static', but if you have
	 * a GStaticMutex as a member of a structure and the structure is
	 * freed, you should also free the GStaticMutex.
	 * Note
	 * Calling g_static_mutex_free() on a locked mutex may
	 * result in undefined behaviour.
	 */
	public void free()
	{
		// void g_static_mutex_free (GStaticMutex *mutex);
		g_static_mutex_free(gStaticMutex);
	}
}
