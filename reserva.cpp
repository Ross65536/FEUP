#include "reserva.h"

#include "cliente.h"

#include "utils.h"
#include <iostream>


Reserva::Reserva(Data inicio, Data final, float preco_por_noite) {
	this->inicio = inicio;
	this->final = final;
	limite50 = inicio - 15;
	limite100 = inicio - 30;
	preco = preco_por_noite * (final - inicio);
	id = random_string(16);

}


Reserva::Reserva(Data inicio, Data final, float preco_por_noite, std::string id) {
	this->inicio = inicio;
	this->final = final;
	limite50 = final - 15;
	limite100 = final - 30;
	preco = preco_por_noite * (final - inicio);
	this->id = id;
}





Data Reserva::getInicio() const {
	return inicio;
}

Data Reserva::getFinal() const {
	return final;
}

Data Reserva::getLimite100() const {
	return limite100;
}

Data Reserva::getLimite50() const {
	return limite50;
}

float Reserva::getPreco() const {
	return preco;
}

std::string Reserva::getID() const {
	return id;
}
