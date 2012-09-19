/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
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
 * inFile  = glib-Random-Numbers.html
 * outPack = glib
 * outFile = RandG
 * strct   = GRand
 * realStrct=
 * ctorStrct=
 * clss    = RandG
 * interf  = 
 * class Code: Yes
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- g_rand_
 * 	- g_
 * omit structs:
 * omit prefixes:
 * omit code:
 * omit signals:
 * imports:
 * 	- gtkc.Loader
 * 	- gtkc.paths
 * structWrap:
 * 	- GRand* -> RandG
 * module aliases:
 * local aliases:
 * 	- double -> randDouble
 * 	- doubleRange -> randDoubleRange
 * 	- int -> randInt
 * 	- intRange -> randIntRange
 * overrides:
 */

module glib.RandG;

public  import gtkc.glibtypes;

private import gtkc.glib;
private import glib.ConstructionException;


private import gtkc.Loader;
private import gtkc.paths;




/**
 * Description
 * The following functions allow you to use a portable, fast and good
 * pseudo-random number generator (PRNG). It uses the Mersenne Twister
 * PRNG, which was originally developed by Makoto Matsumoto and Takuji
 * Nishimura. Further information can be found at
 * http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html.
 * If you just need a random number, you simply call the
 * g_random_* functions, which will create a
 * globally used GRand and use the according
 * g_rand_* functions internally. Whenever you
 * need a stream of reproducible random numbers, you better create a
 * GRand yourself and use the g_rand_* functions
 * directly, which will also be slightly faster. Initializing a GRand
 * with a certain seed will produce exactly the same series of random
 * numbers on all platforms. This can thus be used as a seed for e.g.
 * games.
 * The g_rand*_range functions will return high
 * quality equally distributed random numbers, whereas for example the
 * (g_random_int()%max) approach often
 * doesn't yield equally distributed numbers.
 * GLib changed the seeding algorithm for the pseudo-random number
 * generator Mersenne Twister, as used by
 * GRand and GRandom.
 * This was necessary, because some seeds would yield very bad
 * pseudo-random streams. Also the pseudo-random integers generated by
 * g_rand*_int_range() will have a slightly better
 * equal distribution with the new version of GLib.
 * The original seeding and generation algorithms, as found in GLib
 * 2.0.x, can be used instead of the new ones by setting the
 * environment variable G_RANDOM_VERSION to the value of
 * '2.0'. Use the GLib-2.0 algorithms only if you have sequences of
 * numbers generated with Glib-2.0 that you need to reproduce exactly.
 */
public class RandG
{
	
	/** the main Gtk struct */
	protected GRand* gRand;
	
	
	public GRand* getRandGStruct()
	{
		return gRand;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gRand;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GRand* gRand)
	{
		if(gRand is null)
		{
			this = null;
			return;
		}
		this.gRand = gRand;
	}
	
	~this ()
	{
		if ( Linker.isLoaded(LIBRARY.GLIB) && gRand !is null )
		{
			g_rand_free(gRand);
		}
	}
	
	/**
	 */
	
	/**
	 * Creates a new random number generator initialized with seed.
	 * Params:
	 * seed = a value to initialize the random number generator.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (uint seed)
	{
		// GRand * g_rand_new_with_seed (guint32 seed);
		auto p = g_rand_new_with_seed(seed);
		if(p is null)
		{
			throw new ConstructionException("null returned by g_rand_new_with_seed(seed)");
		}
		this(cast(GRand*) p);
	}
	
	/**
	 * Creates a new random number generator initialized with seed.
	 * Since 2.4
	 * Params:
	 * seed = an array of seeds to initialize the random number generator.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (uint[] seed)
	{
		// GRand * g_rand_new_with_seed_array (const guint32 *seed,  guint seed_length);
		auto p = g_rand_new_with_seed_array(seed.ptr, cast(int) seed.length);
		if(p is null)
		{
			throw new ConstructionException("null returned by g_rand_new_with_seed_array(seed.ptr, cast(int) seed.length)");
		}
		this(cast(GRand*) p);
	}
	
	/**
	 * Creates a new random number generator initialized with a seed taken
	 * either from /dev/urandom (if existing) or from
	 * the current time (as a fallback).
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this ()
	{
		// GRand * g_rand_new (void);
		auto p = g_rand_new();
		if(p is null)
		{
			throw new ConstructionException("null returned by g_rand_new()");
		}
		this(cast(GRand*) p);
	}
	
	/**
	 * Copies a GRand into a new one with the same exact state as before.
	 * This way you can take a snapshot of the random number generator for
	 * replaying later.
	 * Since 2.4
	 * Returns: the new GRand.
	 */
	public RandG copy()
	{
		// GRand * g_rand_copy (GRand *rand_);
		auto p = g_rand_copy(gRand);
		if(p is null)
		{
			return null;
		}
		return new RandG(cast(GRand*) p);
	}
	
	/**
	 * Frees the memory allocated for the GRand.
	 */
	public void free()
	{
		// void g_rand_free (GRand *rand_);
		g_rand_free(gRand);
	}
	
	/**
	 * Sets the seed for the random number generator GRand to seed.
	 * Params:
	 * seed = a value to reinitialize the random number generator.
	 */
	public void setSeed(uint seed)
	{
		// void g_rand_set_seed (GRand *rand_,  guint32 seed);
		g_rand_set_seed(gRand, seed);
	}
	
	/**
	 * Initializes the random number generator by an array of
	 * longs. Array can be of arbitrary size, though only the
	 * first 624 values are taken. This function is useful
	 * if you have many low entropy seeds, or if you require more then
	 * 32bits of actual entropy for your application.
	 * Since 2.4
	 * Params:
	 * seed = array to initialize with
	 */
	public void setSeedArray(uint[] seed)
	{
		// void g_rand_set_seed_array (GRand *rand_,  const guint32 *seed,  guint seed_length);
		g_rand_set_seed_array(gRand, seed.ptr, cast(int) seed.length);
	}
	
	/**
	 * Returns the next random guint32 from rand_ equally distributed over
	 * the range [0..2^32-1].
	 * Params:
	 * rand = a GRand.
	 * Returns: A random number.
	 */
	public uint randInt()
	{
		// guint32 g_rand_int (GRand *rand_);
		return g_rand_int(gRand);
	}
	
	/**
	 * Returns the next random gint32 from rand_ equally distributed over
	 * the range [begin..end-1].
	 * Params:
	 * rand = a GRand.
	 * begin = lower closed bound of the interval.
	 * end = upper open bound of the interval.
	 * Returns: A random number.
	 */
	public int randIntRange(int begin, int end)
	{
		// gint32 g_rand_int_range (GRand *rand_,  gint32 begin,  gint32 end);
		return g_rand_int_range(gRand, begin, end);
	}
	
	/**
	 * Returns the next random gdouble from rand_ equally distributed over
	 * the range [0..1).
	 * Params:
	 * rand = a GRand.
	 * Returns: A random number.
	 */
	public double randDouble()
	{
		// gdouble g_rand_double (GRand *rand_);
		return g_rand_double(gRand);
	}
	
	/**
	 * Returns the next random gdouble from rand_ equally distributed over
	 * the range [begin..end).
	 * Params:
	 * rand = a GRand.
	 * begin = lower closed bound of the interval.
	 * end = upper open bound of the interval.
	 * Returns: A random number.
	 */
	public double randDoubleRange(double begin, double end)
	{
		// gdouble g_rand_double_range (GRand *rand_,  gdouble begin,  gdouble end);
		return g_rand_double_range(gRand, begin, end);
	}
	
	/**
	 * Sets the seed for the global random number generator, which is used
	 * by the g_random_* functions, to seed.
	 * Params:
	 * seed = a value to reinitialize the global random number generator.
	 */
	public static void randomSetSeed(uint seed)
	{
		// void g_random_set_seed (guint32 seed);
		g_random_set_seed(seed);
	}
	
	/**
	 * Return a random guint32 equally distributed over the range
	 * [0..2^32-1].
	 * Returns: A random number.
	 */
	public static uint randomInt()
	{
		// guint32 g_random_int (void);
		return g_random_int();
	}
	
	/**
	 * Returns a random gint32 equally distributed over the range
	 * [begin..end-1].
	 * Params:
	 * begin = lower closed bound of the interval.
	 * end = upper open bound of the interval.
	 * Returns: A random number.
	 */
	public static int randomIntRange(int begin, int end)
	{
		// gint32 g_random_int_range (gint32 begin,  gint32 end);
		return g_random_int_range(begin, end);
	}
	
	/**
	 * Returns a random gdouble equally distributed over the range [0..1).
	 * Returns: A random number.
	 */
	public static double randomDouble()
	{
		// gdouble g_random_double (void);
		return g_random_double();
	}
	
	/**
	 * Returns a random gdouble equally distributed over the range [begin..end).
	 * Params:
	 * begin = lower closed bound of the interval.
	 * end = upper open bound of the interval.
	 * Returns: A random number.
	 */
	public static double randomDoubleRange(double begin, double end)
	{
		// gdouble g_random_double_range (gdouble begin,  gdouble end);
		return g_random_double_range(begin, end);
	}
}
