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
 * inFile  = GstPreset.html
 * outPack = gstreamer
 * outFile = PresetIF
 * strct   = GstPreset
 * realStrct=
 * ctorStrct=
 * clss    = PresetT
 * interf  = PresetIF
 * class Code: No
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- gst_preset_
 * omit structs:
 * omit prefixes:
 * omit code:
 * omit signals:
 * imports:
 * 	- glib.Str
 * structWrap:
 * module aliases:
 * local aliases:
 * overrides:
 */

module gstreamer.PresetIF;

public  import gstreamerc.gstreamertypes;

private import gstreamerc.gstreamer;
private import glib.ConstructionException;
private import gobject.ObjectG;

private import glib.Str;



/**
 * This interface offers methods to query and manipulate parameter preset sets.
 * A preset is a bunch of property settings, together with meta data and a name.
 * The name of a preset serves as key for subsequent method calls to manipulate
 * single presets.
 * All instances of one type will share the list of presets. The list is created
 * on demand, if presets are not used, the list is not created.
 *
 * The interface comes with a default implementation that serves most plugins.
 * Wrapper plugins will override most methods to implement support for the
 * native preset format of those wrapped plugins.
 * One method that is useful to be overridden is gst_preset_get_property_names().
 * With that one can control which properties are saved and in which order.
 *
 * The default implementation supports presets located in a system directory,
 * application specific directory and in the users home directory. When getting
 * a list of presets individual presets are read and overlaid in 1) system,
 * 2) application and 3) user order. Whenever an earlier entry is newer, the
 * later entries will be updated.
 */
public interface PresetIF
{
	
	
	/** Get the main Gtk struct */
	public GstPreset* getPresetTStruct();
	
	/** the main Gtk struct as a void* */
	protected void* getStruct();
	
	
	/**
	 */
	
	/**
	 * Get a copy of preset names as a NULL terminated string array.
	 * Returns: list with names, ue g_strfreev() after usage. [transfer full][array zero-terminated=1][element-type gchar*]
	 */
	public string[] getPresetNames();
	
	/**
	 * Get a the names of the GObject properties that can be used for presets.
	 * Returns: an array of property names which should be freed with g_strfreev() after use. [transfer full][array zero-terminated=1][element-type gchar*]
	 */
	public string[] getPropertyNames();
	
	/**
	 * Load the given preset.
	 * Params:
	 * name = preset name to load
	 * Returns: TRUE for success, FALSE if e.g. there is no preset with that name
	 */
	public int loadPreset(string name);
	
	/**
	 * Save the current object settings as a preset under the given name. If there
	 * is already a preset by this name it will be overwritten.
	 * Params:
	 * name = preset name to save
	 * Returns: TRUE for success, FALSE
	 */
	public int savePreset(string name);
	
	/**
	 * Renames a preset. If there is already a preset by the new_name it will be
	 * overwritten.
	 * Params:
	 * oldName = current preset name
	 * newName = new preset name
	 * Returns: TRUE for success, FALSE if e.g. there is no preset with old_name
	 */
	public int renamePreset(string oldName, string newName);
	
	/**
	 * Delete the given preset.
	 * Params:
	 * name = preset name to remove
	 * Returns: TRUE for success, FALSE if e.g. there is no preset with that name
	 */
	public int deletePreset(string name);
	
	/**
	 * Sets a new value for an existing meta data item or adds a new item. Meta
	 * data tag names can be something like e.g. "comment". Supplying NULL for the
	 * value will unset an existing value.
	 * Params:
	 * name = preset name
	 * tag = meta data item name
	 * value = new value
	 * Returns: TRUE for success, FALSE if e.g. there is no preset with that name
	 */
	public int setMeta(string name, string tag, string value);
	
	/**
	 * Gets the value for an existing meta data tag. Meta data tag names can be
	 * something like e.g. "comment". Returned values need to be released when done.
	 * Params:
	 * name = preset name
	 * tag = meta data item name
	 * value = value. [out callee-allocates]
	 * Returns: TRUE for success, FALSE if e.g. there is no preset with that name or no value for the given tag
	 */
	public int getMeta(string name, string tag, out string value);
	
	/**
	 * Sets an extra directory as an absolute path that should be considered when
	 * looking for presets. Any presets in the application dir will shadow the
	 * system presets.
	 * Params:
	 * appDir = the application specific preset dir
	 * Returns: TRUE for success, FALSE if the dir already has been set
	 */
	public static int setAppDir(string appDir);
	
	/**
	 * Gets the directory for application specific presets if set by the
	 * application.
	 * Returns: the directory or NULL, don't free or modify the string
	 */
	public static string getAppDir();
}
