
#ifndef TERMO_H_
#define TERMO_H_

#include "hash.h"

struct {
	char op;
	//void *valor;
	//list parametros;
} typedef s_termo;

s_termo *allocateTermo();
void *executeTermo(s_termo *toExecute,list operands);
void setTermo(s_termo *t, char op);
void imprimeTermo(s_termo *toExecute,list operands);


#endif /* TERMO_H_ */
