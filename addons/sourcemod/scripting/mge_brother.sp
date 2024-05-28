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
	version = "1.0",
	url = "https://drako.dev"
};

public void OnMapStart()
{
	AddFileToDownloadsTable("materials/drako/mge_brother/engineer.vmt");
	AddFileToDownloadsTable("materials/drako/mge_brother/engineer.vtf");
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_mge_brother_engineer_on", Command_Engineer_On, "MGE Brother Engineer ON");
	RegConsoleCmd("sm_mge_brother_engineer_off", Command_Engineer_Off, "MGE Brother Engineer OFF");
}

public Action Command_Engineer_On(int client, int args)
{
	for (int i = 1; i <= MaxClients; i++)
    {
		ClientCommand(i, "r_screenoverlay drako/mge_brother/engineer.vtf");
		return Plugin_Handled;
    }
	return Plugin_Handled;
}

public Action Command_Engineer_Off(int client, int args)
{
	for (int i = 1; i <= MaxClients; i++)
    {
		ClientCommand(i, "r_screenoverlay \"\"");
		return Plugin_Handled;
    }
	return Plugin_Handled;
}