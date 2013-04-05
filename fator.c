#include "fator.h"
#include "hash.h"


s_fator* allocateFator() {
	s_fator *aux;
	aux = (s_fator*)malloc(sizeof(s_fator));
	aux->parametros = initList();
	if (aux) return aux;
	else return NULL;
}
s_fator *executaFator(s_fator* toExecute) {
	switch(toExecute->tipo) {
		case T_INT:
		case T_FLOAT:
			return toExecute;
			break;
        case T_VAR:
        {
            
            s_variavel* v = hashSearchVar(HashVar,(char*)toExecute->valor,"main");
            s_fator* fteste = allocateFator();
            printf("tipo = %d\n",v->tipo);

            setFator(fteste,v->tipo,v->valor,NULL);
            printf("retornando\n");
            return fteste;
            break; // LOL BREAK :)
        }
		default:
			return NULL;
			break;
	}
	return NULL;
}

void setFator(s_fator *f, int tipo,void *valor,list parList) {
	f->tipo = tipo;
	f->valor = valor;
	f->parametros = parList;
}
