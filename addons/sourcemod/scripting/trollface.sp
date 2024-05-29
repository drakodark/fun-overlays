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
	name = "TrollFace Overlay",
	author = "Drako Dark",
	description = "Trollface Overlay para trolear a tus amigos",
	version = "1.1",
	url = "https://drako.dev"
};

public void OnMapStart()
{
	AddFileToDownloadsTable("materials/drako/trollface/trollface.vmt");
	AddFileToDownloadsTable("materials/drako/trollface/trollface.vtf");

	PrecacheDecal("materials/drako/trollface/trollface.vmt");
	PrecacheDecal("materials/drako/trollface/trollface.vtf");
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_trollface_on", Command_TrollFace_On, "Trollface ON");
	RegConsoleCmd("sm_trollface_off", Command_TrollFace_Off, "Trollface OFF");
}

public Action Command_TrollFace_On(int client, int args)
{
	for (int i = 1; i <= MaxClients; i++)
    {
		ClientCommand(i, "r_screenoverlay drako/trollface/trollface.vtf");
    }
	return Plugin_Handled;
}

public Action Command_TrollFace_Off(int client, int args)
{
	for (int i = 1; i <= MaxClients; i++)
    {
		ClientCommand(i, "r_screenoverlay \"\"");
    }
	return Plugin_Handled;
}