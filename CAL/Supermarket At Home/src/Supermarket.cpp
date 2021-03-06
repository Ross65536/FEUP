/*
 * Supermarket.cpp
 *
 *  Created on: Mar 30, 2017
 *      Author: afonso
 */

#include "Supermarket.h"

using namespace std;

Supermarket::Supermarket(long long int id, Coord coord, std::string name): Place(id, coord){
	this->name = name;
	setLabel("supermarket");
	calculateCapacity();
	trucks={};
}



const std::string Supermarket::getName() const{
	return name;
}


void Supermarket::addTrucks() {
	Truck* truck = new Truck();

	this->trucks.push_back(truck);
}

const int Supermarket::getCapacity() const {
	return capacity;
}

void Supermarket::calculateCapacity() {
	this->capacity = 0;
	for(unsigned int i = 0; i < trucks.size(); i++){
		this->capacity += trucks.at(i)->getCapacity();
	}
}

std::vector<Truck*>* Supermarket::getTrucks() {
	return &trucks;
}
