#ifndef FUNCTION_H_
#define FUNCTION_H_
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "list.h"

struct  {
  char nome[30];
  int aridade;
  int tipo_retorno;
  list parametros;
  list parNames;
  list cmdList;
} typedef s_funcao;


s_funcao* allocateFunction();
void setFunction(s_funcao *function,char *nome,int aridade,int tipo_retorno,list parametros,list cmdList);
void setFunctionParNames(s_funcao *function, list parNames);
void setFunctionCmdList(s_funcao *function,list cmdList);

#endif /* FUNCTION_H_ */
