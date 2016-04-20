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
 * @version 1.0a
 * @logs Otimização | Realizada com sucesso | Script 10% concluido                    
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

/**
 * Definições do Sistema
 * @define MAX_MEMBROS_BOCA Máximo de membros na boca
 * @define MONEY_BOCA Dinheiro que inicia na Boca
 * @define RTD: criar automaticamente public's e forwards com RTD:FunctionName()
 * @define SCM Abreviação para SendClientMessage
 */
 
#define RTD:%0(%1) forward %0(%1); \ public %0(%1)
#define SCM SendClientMessage
#define MAX_MEMBROS_BOCA (30)
#define MONEY_BOCA (10000000)

public OnFilterScriptInit() {
	print("Sistema de Biqueira - Development @Hax0rlib");
}


/**
 * @array Cargos
 * Cargo definidos para membros da biqueira
 */

new Cargo [4] = 
[
	"Fogueteiro",
	"Campana",
	"Traficante",
	"Gerente",
	"Dono da Boca",
];

/**
 * Função que verifica organização do player
 * @function verificaOrg
 * @require O Player tem que ser do PCC ou C.V
 */
 
RTD:verificaOrg(); // Forward
RTD:verificaOrg() {

	if(pInfo[playerid][Logado] == 1) {
		if()


	}
}

RTD:loadIniMsg(); // Forward
RTD:loadIniMsg() {

	INI_Create("messages");

	if(fexists(#messages.ini)) {

		INI_Open("messages");
		INI_WriteString("messages", Cargo[0], "- Você agora é um Fogueteiro ! para saber mais sobre sua função digite /ajudaboca");
		INI_WriteString("messages", Cargo[1], "- Você agora é um Fogueteiro ! para saber mais sobre sua função digite /ajudaboca");
		INI_WriteString("messages", Cargo[2], "- Você agora é um Fogueteiro ! para saber mais sobre sua função digite /ajudaboca");

		return 1;
	}


}


public OnDialogResponse(playerid, dialogid, response, listintem, inputtext[]) {
	if(response) {
		switch(dialogid) {
		 case 1:
		 {
		 	SCM();
		 }
		}
	}
}

public OnCommandCalled(playerid, params[]){

	get_cmd_params(trafico) {

		ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Qual cargo quer assumir no tráfico?", "Fogueteiro ($1)\nCampana ($2)\nTraficante ($3)", "Confirmar", "Cancelar");
		return 1;
	}
}

