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
	version = "1.0",
	url = "https://drako.dev"
};

public void OnMapStart()
{
	AddFileToDownloadsTable("materials/drako/trollface/trollface.vmt");
	AddFileToDownloadsTable("materials/drako/trollface/trollface.vtf");
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
		return Plugin_Handled;
    }
	return Plugin_Handled;
}

public Action Command_TrollFace_Off(int client, int args)
{
	for (int i = 1; i <= MaxClients; i++)
    {
		ClientCommand(i, "r_screenoverlay \"\"");
		return Plugin_Handled;
    }
	return Plugin_Handled;
}