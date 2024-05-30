/*

	Copyright (C) 2024 drako.dev
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program. If not, see <https://www.gnu.org/licenses/>.

*/

#include <sdkhooks>
#include <sdktools>
#include <sourcemod>
#pragma newdecls required
#pragma semicolon 1


public Plugin myinfo =
{
	name = "Toasty Overlay",
	author = "Drako Dark",
	description = "MK Toasty",
	version = "1.0",
	url = "https://drako.dev"
};

public void OnMapStart()
{
	// Download Files Table
	AddFileToDownloadsTable("materials/drako/toasty.vmt");
	AddFileToDownloadsTable("materials/drako/toasty.vtf");
	AddFileToDownloadsTable("sound/drako/toasty.mp3");

	// Precache Files
	PrecacheDecal("materials/drako/toasty.vmt");
	PrecacheDecal("materials/drako/toasty.vtf");
	PrecacheSound("drako/toasty.mp3"); 
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_toasty", Command_TOASTY, "Toasty Overlay ON");
}

public Action Command_TOASTY(int client, int args)
{
	for (int i = 1; i <= MaxClients; i++)
	{
		ClientCommand(i, "r_screenoverlay drako/toasty.vtf");
		EmitSoundToClient(i, "drako/toasty.mp3", _, _, _, _, 0.70);
		CreateTimer(1.0, Command_TOASTY_stop, i);
	}
	
	return Plugin_Handled;
}

public Action Command_TOASTY_stop(Handle timer, int client){
    ClientCommand(client, "r_screenoverlay \"\"");
    StopSound(client, SNDCHAN_AUTO, "drako/toasty.mp3");

    return Plugin_Continue;
}