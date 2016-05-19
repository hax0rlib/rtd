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

#define RTD::%0(%1) forward %0(%1); \ public %0(%1)
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


stock verificaOrg() {

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


stock loadIniMsg() {

	INI_Create("messages");

	if(fexist(#messages.ini)) {

		INI_Open("messages.ini");
		INI_WriteString("messages", Cargo[0], "- Você agora é um Fogueteiro ! para saber mais sobre sua função digite /ajudaboca");
		INI_WriteString("messages", Cargo[1], "- Você agora é um Campana ! para saber mais sobre sua função digite /ajudaboca");
		INI_WriteString("messages", Cargo[2], "- Você agora é um Traficante ! para saber mais sobre sua função digite /ajudaboca");
		INI_WriteString("messages", Cargo[3], "- Você e o Gerente da boca notifique o Patrão de tudo oque acontece digite /ajudaboca");
		INI_Save();

		return 1;
	}
	return 1;

}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(response) {
		switch(dialogid) {
		 case 1:
		 {
		 	SCM(playerid, COLOR_GREEN, INI_ReadString("message.ini", Cargo[0]));
		 }
		 case 2:
		 {
		 	SCM(playerid, COLOR_GREEN, INI_ReadString("message.ini", Cargo[1]));
		 }
		 case 3:
		 {
		 	SCM(playerid, COLOR_GREEN, INI_ReadString("message.ini", Cargo[2]));
		 }
		}
	}
}

public OnCommandCalled(playerid, params[]){

	get_cmd_params(trafico) {

		ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Qual cargo quer assumir no tráfico?", "Fogueteiro ($1)\nCampana ($2)\nTraficante ($3)", "Confirmar", "Cancelar");
		return 1;
	}

	return 1;
}
