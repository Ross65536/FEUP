/*
 * Clients.h
 *
 *  Created on: Mar 29, 2017
 *      Author: root
 */

#ifndef CLIENTS_H_
#define CLIENTS_H_


#include "Purchase.h"
#include <vector>
#include <string>
#include "Place.h"

class Client: public Place {
private:
	std::vector<Purchase> shopping;
	std::string name;
public:
	Client(long long int id, Coord coord, std::string name);
	virtual const std::vector<Purchase>& getGroceries() const;
	const std::string getName() const;
	void addGroceries(Purchase& purchase);


	//bool operator == (const Client & rhs);

};


#endif /* CLIENTS_H_ */
