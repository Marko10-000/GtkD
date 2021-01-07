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


module gdk.Event;

private import gdk.Device;
private import gdk.DeviceTool;
private import gdk.Display;
private import gdk.Seat;
private import gdk.Surface;
private import gdk.c.functions;
public  import gdk.c.types;
private import gobject.ObjectG;
private import gtkd.Loader;


/**
 * The GdkEvent struct contains only private fields and
 * should not be accessed directly.
 */
public class Event
{
	/** the main Gtk struct */
	protected GdkEvent* gdkEvent;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GdkEvent* getEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkEvent;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gdkEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkEvent* gdkEvent, bool ownedRef = false)
	{
		this.gdkEvent = gdkEvent;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GDK) && ownedRef )
			gdk_event_unref(gdkEvent);
	}


	/** */
	public static GType getType()
	{
		return gdk_event_get_type();
	}

	/**
	 * If both events contain X/Y information, this function will return %TRUE
	 * and return in @angle the relative angle from @event1 to @event2. The rotation
	 * direction for positive angles is from the positive X axis towards the positive
	 * Y axis.
	 *
	 * Params:
	 *     event2 = second #GdkEvent
	 *     angle = return location for the relative angle between both events
	 *
	 * Returns: %TRUE if the angle could be calculated.
	 */
	public bool GetAngle(Event event2, out double angle)
	{
		return gdk_events_get_angle(gdkEvent, (event2 is null) ? null : event2.getEventStruct(), &angle) != 0;
	}

	/**
	 * If both events contain X/Y information, the center of both coordinates
	 * will be returned in @x and @y.
	 *
	 * Params:
	 *     event2 = second #GdkEvent
	 *     x = return location for the X coordinate of the center
	 *     y = return location for the Y coordinate of the center
	 *
	 * Returns: %TRUE if the center could be calculated.
	 */
	public bool GetCenter(Event event2, out double x, out double y)
	{
		return gdk_events_get_center(gdkEvent, (event2 is null) ? null : event2.getEventStruct(), &x, &y) != 0;
	}

	/**
	 * If both events have X/Y information, the distance between both coordinates
	 * (as in a straight line going from @event1 to @event2) will be returned.
	 *
	 * Params:
	 *     event2 = second #GdkEvent
	 *     distance = return location for the distance
	 *
	 * Returns: %TRUE if the distance could be calculated.
	 */
	public bool GetDistance(Event event2, out double distance)
	{
		return gdk_events_get_distance(gdkEvent, (event2 is null) ? null : event2.getEventStruct(), &distance) != 0;
	}

	/**
	 * Extracts all axis values from an event.
	 *
	 * Params:
	 *     axes = the array of values for all axes
	 *
	 * Returns: %TRUE on success, otherwise %FALSE
	 */
	public bool getAxes(out double[] axes)
	{
		double* outaxes;
		uint nAxes;

		auto __p = gdk_event_get_axes(gdkEvent, &outaxes, &nAxes) != 0;

		axes = outaxes[0 .. nAxes];

		return __p;
	}

	/**
	 * Extract the axis value for a particular axis use from
	 * an event structure.
	 *
	 * Params:
	 *     axisUse = the axis use to look for
	 *     value = location to store the value found
	 *
	 * Returns: %TRUE if the specified axis was found, otherwise %FALSE
	 */
	public bool getAxis(GdkAxisUse axisUse, out double value)
	{
		return gdk_event_get_axis(gdkEvent, axisUse, &value) != 0;
	}

	/**
	 * Returns the device of an event.
	 *
	 * Returns: a #GdkDevice.
	 */
	public Device getDevice()
	{
		auto __p = gdk_event_get_device(gdkEvent);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Device)(cast(GdkDevice*) __p);
	}

	/**
	 * If the event was generated by a device that supports
	 * different tools (eg. a tablet), this function will
	 * return a #GdkDeviceTool representing the tool that
	 * caused the event. Otherwise, %NULL will be returned.
	 *
	 * Note: the #GdkDeviceTools will be constant during
	 * the application lifetime, if settings must be stored
	 * persistently across runs, see gdk_device_tool_get_serial()
	 *
	 * Returns: The current device tool, or %NULL
	 */
	public DeviceTool getDeviceTool()
	{
		auto __p = gdk_event_get_device_tool(gdkEvent);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DeviceTool)(cast(GdkDeviceTool*) __p);
	}

	/**
	 * Retrieves the #GdkDisplay associated to the @event.
	 *
	 * Returns: a #GdkDisplay
	 */
	public Display getDisplay()
	{
		auto __p = gdk_event_get_display(gdkEvent);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Display)(cast(GdkDisplay*) __p);
	}

	/**
	 * If @event is a touch event, returns the #GdkEventSequence
	 * to which the event belongs. Otherwise, return %NULL.
	 *
	 * Returns: the event sequence that the event belongs to
	 */
	public GdkEventSequence* getEventSequence()
	{
		return gdk_event_get_event_sequence(gdkEvent);
	}

	/**
	 * Retrieves the type of the event.
	 *
	 * Returns: a #GdkEventType
	 */
	public GdkEventType getEventType()
	{
		return gdk_event_get_event_type(gdkEvent);
	}

	/**
	 * Retrieves the history of the @event, as a list of time and coordinates.
	 *
	 * The history includes events that are not delivered to the application
	 * because they occurred in the same frame as @event.
	 *
	 * Note that only motion and scroll events record history, and motion
	 * events only if one of the mouse buttons is down.
	 *
	 * Returns: an
	 *     array of time and coordinates
	 */
	public GdkTimeCoord[] getHistory()
	{
		uint outNCoords;

		auto __p = gdk_event_get_history(gdkEvent, &outNCoords);

		return __p[0 .. outNCoords];
	}

	/**
	 * Returns the modifier state field of an event.
	 *
	 * Returns: the modifier state of @event
	 */
	public GdkModifierType getModifierState()
	{
		return gdk_event_get_modifier_state(gdkEvent);
	}

	/**
	 * Returns whether this event is an 'emulated' pointer event (typically
	 * from a touch event), as opposed to a real one.
	 *
	 * Returns: %TRUE if this event is emulated
	 */
	public bool getPointerEmulated()
	{
		return gdk_event_get_pointer_emulated(gdkEvent) != 0;
	}

	/**
	 * Extract the event surface relative x/y coordinates from an event.
	 *
	 * Params:
	 *     x = location to put event surface x coordinate
	 *     y = location to put event surface y coordinate
	 */
	public bool getPosition(out double x, out double y)
	{
		return gdk_event_get_position(gdkEvent, &x, &y) != 0;
	}

	/**
	 * Returns the seat that originated the event.
	 *
	 * Returns: a #GdkSeat.
	 */
	public Seat getSeat()
	{
		auto __p = gdk_event_get_seat(gdkEvent);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Seat)(cast(GdkSeat*) __p);
	}

	/**
	 * Extracts the #GdkSurface associated with an event.
	 *
	 * Returns: The #GdkSurface associated with the event
	 */
	public Surface getSurface()
	{
		auto __p = gdk_event_get_surface(gdkEvent);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Surface)(cast(GdkSurface*) __p);
	}

	/**
	 * Returns the time stamp from @event, if there is one; otherwise
	 * returns #GDK_CURRENT_TIME.
	 *
	 * Returns: time stamp field from @event
	 */
	public uint getTime()
	{
		return gdk_event_get_time(gdkEvent);
	}

	alias doref = ref_;
	/**
	 * Increase the ref count of @event.
	 *
	 * Returns: @event
	 */
	public Event ref_()
	{
		auto __p = gdk_event_ref(gdkEvent);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Event)(cast(GdkEvent*) __p, true);
	}

	/**
	 * This function returns whether a #GdkEvent should trigger a
	 * context menu, according to platform conventions. The right
	 * mouse button always triggers context menus.
	 *
	 * This function should always be used instead of simply checking for
	 * event->button == %GDK_BUTTON_SECONDARY.
	 *
	 * Returns: %TRUE if the event should trigger a context menu.
	 */
	public bool triggersContextMenu()
	{
		return gdk_event_triggers_context_menu(gdkEvent) != 0;
	}

	/**
	 * Decrease the ref count of @event, and free it
	 * if the last reference is dropped.
	 */
	public void unref()
	{
		gdk_event_unref(gdkEvent);
	}
}
