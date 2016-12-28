#include <iostream>
#include <fstream>
#include <string>


#include "broker.h"
#include "fatura.h"


using namespace std;


int main() {
	/*Cliente C("clie");
	Fornecedor F("forn", 123456789, "pass", "morada", {});
	Hotel I("imo",1,12,{});
	Data d1(27,10,2016);
	Data d2(29,10,2016);
	Reserva R(C,d1,d2,2);*/

	string nome;
	string filename;
	fstream f;

	cout << endl << endl <<  "Bem-Vindo" << endl << endl;

	cout << "Broker: ";
	getline(cin, nome);

	filename = nome + ".txt";

	f.open(filename);

	if(f.is_open()){
		string ficheiroClientes;
		string ficheiroFornecedores;
		string receita_str;

		getline(f, nome);
		getline(f, ficheiroClientes);
		getline(f, ficheiroFornecedores);
		getline(f, receita_str);

		f.close();

		Broker Existente(nome, ficheiroClientes, ficheiroFornecedores, stof(receita_str));

		if(Existente.opcoesIniciais())
					return 0;

	}
	else{
		Broker Novo(nome);

		if(Novo.opcoesIniciais())
			return 0;

	}

	return 1;

}
