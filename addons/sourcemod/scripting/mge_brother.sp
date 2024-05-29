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
	name = "MGE Brother Overlay",
	author = "Drako Dark",
	description = "MGE Brother",
	version = "1.2",
	url = "https://drako.dev"
};

public void OnMapStart()
{
	// Download Files Table
	AddFileToDownloadsTable("materials/drako/mge_brother/engineer.vmt");
	AddFileToDownloadsTable("materials/drako/mge_brother/engineer.vtf");
	AddFileToDownloadsTable("sound/drako/mge_brother/mge_brother.mp3");

	// Precache Files
	PrecacheDecal("materials/drako/mge_brother/engineer.vmt");
	PrecacheDecal("materials/drako/mge_brother/engineer.vtf");
	PrecacheSound("drako/mge_brother/mge_brother.mp3"); 
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_mge_on", Command_MGE_On, "MGE Brother Overlay ON");
	RegConsoleCmd("sm_mge_off", Command_MGE_Off, "MGE Brother Overlay OFF");
}

public Action Command_MGE_On(int client, int args)
{
	char Overlay_Name[32];
	GetCmdArg(1, Overlay_Name, sizeof(Overlay_Name));

	if(args < 1)
	{
		PrintToChat(client, "[SM] Use sm_mge_on <class-name> or <class-name>_music");
	}

	if(StrEqual(Overlay_Name, "engineer"))
	{
		for (int i = 1; i <= MaxClients; i++)
		{
			ClientCommand(i, "r_screenoverlay drako/mge_brother/engineer.vtf");
		}
	}
	else if (StrEqual(Overlay_Name, "engineer_music"))
	{
		for (int i = 1; i <= MaxClients; i++)
		{
			ClientCommand(i, "r_screenoverlay drako/mge_brother/engineer.vtf");
			EmitSoundToClient(i, "drako/mge_brother/mge_brother.mp3", _, _, _, _, 0.70);
		}
	}
	
	return Plugin_Handled;
}

public Action Command_MGE_Off(int client, int args)
{
	for (int i = 1; i <= MaxClients; i++)
    {
		ClientCommand(i, "r_screenoverlay \"\"");
		StopSound(i, SNDCHAN_AUTO, "drako/mge_brother/mge_brother.mp3");
    }
	return Plugin_Handled;
}