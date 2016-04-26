/**
 * ______  _____  _____ 
 * | ___ \|_   _||  __ \
 * | |_/ /  | |  | |  \/
 * |    /   | |  | | __ 
 * | |\ \   | |  | |_\ \
 * \_| \_|  \_/   \____/
 *
 * (Real Trafficking Drug)
 *
 * @developers Hax0rlib and Tigz
 * @since 18/04/2016
 * @version 1.2a
 * @logs Otimização | Realizada com sucesso | Script 20% concluido                    
 */

/**
 * Includes Necessárias
 * @include <a_samp> Include Native
 * @include <Bini.inc> Include Manage Files
 * @include <Colors.inc> Include Define Colors
 * @include <iCMD.inc> Include Processor of Commands
 */

#include <a_samp>
#include <Bini>
#include <Colors>
#include <iCMD>

#define FILTERSCRIPT
#if defined FILTERSCRIPT

public OnFilterScriptInit() {
	loadIniMsg();
	print("Sistema de Biqueira - Carregando 10% .");
	print("Sistema de Biqueira - Carregando 20% ..");
	print("Sistema de Biqueira - Carregando 30% ...");
	print("Sistema de Biqueira - Carregando 40% .");
	print("Sistema de Biqueira - Carregando 50% ..");
	print("Sistema de Biqueira - Carregando 60% ...");
	print("Sistema de Biqueira - Carregando 70% .");
	print("Sistema de Biqueira - Carregando 80% ..");
	print("Sistema de Biqueira - Carregando 90% ...");
	print("Sistema de Biqueira - Carregando 100% .");
	print("Sistema de Biqueira - Development @Hax0rlib & @Tigz");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else
#endif

/**
 * Definições do Sistema
 * @define MAX_MEMBROS_BOCA Máximo de membros na boca
 * @define MONEY_BOCA Dinheiro que inicia na Boca
 * @define RTD: criar automaticamente public's e forwards com RTD:FunctionName()
 * @define SCM Abreviação para SendClientMessage
 */
 
#define RTD:%0(%1) forward %0(%1); \ public %0(%1);
#define SCM SendClientMessage
#define MAX_MEMBROS_BOCA (30)
#define MONEY_BOCA (10000000)

/**
 * @array Cargos
 * Cargo definidos para membros da biqueira
 */

new Cargo [5][] = 
{
	{"Fogueteiro"},
	{"Campana"},
	{"Traficante"},
	{"Gerente"},
	{"Dono da Boca"}
};

/**
 * Função que verifica organização do player
 * @function verificaOrg
 * @require O Player tem que ser do PCC ou C.V
 */
 
RTD:verificaOrg(); // Forward
RTD:verificaOrg() {

	if(gPlayerLogged[i] == 1) {
		if(orgid == 21 || orgid == 23) {
			
			SCM(playerid, COLOR_GREEN, "ORG Aprovada - Carregando ...");
			return 1;
		} else {
		
			SCM(playerid, COLOR_RED, "Você, não é do P.C.C ou C.V");
			return 0;
		}
		
	} else {
	
		SCM(playerid, COLOR_RED, "Você não está logado.");	
	}
}

RTD:loadIniMsg(); // Forward
RTD:loadIniMsg() {

	INI_Create("messages");

	if(fexists(#messages.ini)) {

		INI_Open("messages.ini");
		INI_WriteString("messages", Cargo[0], "- Você agora é um Fogueteiro ! para saber mais sobre sua função digite /ajudaboca");
		INI_WriteString("messages", Cargo[1], "- Você agora é um Campana ! para saber mais sobre sua função digite /ajudaboca");
		INI_WriteString("messages", Cargo[2], "- Você agora é um Traficante ! para saber mais sobre sua função digite /ajudaboca");
		INI_WriteString("messages", Cargo[3], "- Você e o Gerente da boca notifique o Patrão de tudo oque acontece digite /ajudaboca");
		INI_Save();

		return 1;
	}


}

public OnDialogResponse(playerid, dialogid, response, listintem, inputtext[]) {
	if(response) {
		switch(dialogid) {
		 case 1:
		 {
		 	SCM(playerid, COLOR_GREEN, INI_Open("message.ini", INI_ReadString("message.ini", Cargo[0])));
		 }
		 case 2:
		 {
		 	SCM(playerid, COLOR_GREEN, INI_Open("message.ini", INI_ReadString("message.ini", Cargo[1])));
		 }
		 case 3:
		 {
		 	SCM(playerid, COLOR_GREEN, INI_Open("message.ini", INI_ReadString("message.ini", Cargo[2])));
		 }
		}
	}
}

public OnCommandCalled(playerid, params[]){

	get_cmd_params(trafico) {

		ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Qual cargo quer assumir no tráfico?", "Fogueteiro ($1)\nCampana ($2)\nTraficante ($3)", "Confirmar", "Cancelar");
		return 1;
	}

	get_cmd_params(radim) {

		if(IsPlayerConnected(playerid)) {

        	GetPlayerName(playerid, sendername, sizeof(sendername));
		    if(PlayerInfo[playerid][pCalado] == 1)
			{
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Você não pode falar, pois foi calado");
				return 1;
			}

			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}

			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}

			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USE: (/r)adio [radio chat]");
				return 1;
			}

			if(Cargo[5][] == 3 || Cargo[5][] == 4)
			{
				if(Cargo[5][] == 4) { format(string, sizeof(string), "** Patrão %s: %s, Na Escuta. **", sendername, result); }
				else if(Cargo[5][] == 3) { format(string, sizeof(string), "** Gerente %s: %s, Na Escuta. **", sendername, result); }
				else if(Cargo[5][] == 2) { format(string, sizeof(string), "** Traficante %s: %s, Na Escuta. **", sendername, result); }
				else if(Cargo[5][] == 1) { format(string, sizeof(string), "** Campana %s: %s, Na Escuta. **", sendername, result); }
				else if(Cargo[5][] == 0) { format(string, sizeof(string), "** Fogueteiro %s: %s, Na Escuta. **", sendername, result); }
				SendRadioMessage(1,COP_COLOR,string);
				format(string, sizeof(string), "[Rádio] %s: %s.", sendername, result);
				ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
				printf("%s", string);
				return 1;
			}
	}
	return 1;
}
