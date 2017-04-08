/*
 * LoadingResources.cpp
 *
 *  Created on: Mar 30, 2017
 *      Author: afonso
 */

#include "LoadingResources.h"
#include <fstream>
#include <iostream>
#include "Place.h"
#include "Street.h"
#include "Graph.h"
#include "Clients.h"
#include "Supermarket.h"

using namespace std;


const string LoadingResources::GraphsInfo = "graphsInfo.txt";

LoadingResources::LoadingResources(SuperMarketChain* superMarketChain): superMarketChain(superMarketChain) {
	ifstream graphsInfo(GraphsInfo);

	if(!graphsInfo.is_open()){
		cerr << "Unable to open file " << GraphsInfo << endl;
		exit(1);
	}

	unsigned int nGraphs;
	string temp;

	graphsInfo >> nGraphs;

	for(unsigned int i = 0; i < nGraphs; i++){
		graphsInfo >> temp;
		graphsFiles.push_back(temp);
	}

	loadMap();

}


void LoadingResources::loadMap() {
	loadClients();
	loadSuperMarkets();
	loadNodes();
	loadRoads();
	loadGeom();
}

void LoadingResources::loadClients() {

	ifstream clientsInfo(graphsFiles[Files::ClientsFile]);

	if(!clientsInfo.is_open()){
			cerr << "Unable to open file " << GraphsInfo << endl;
			exit(1);
		}

	long long id;
	double latitude;
	double longitude;
	string name;
	string id_str;
	string lat_str;
	string long_str;

	/*
	 * Ignoring degrees Values
	 */

	while(getline(clientsInfo, id_str, ';'), getline(clientsInfo, lat_str, ';'), getline(clientsInfo, long_str, ';'),
			getline(clientsInfo, lat_str, ';'),  getline(clientsInfo, long_str, ';'), getline(clientsInfo, name, ';')){


		id = stoll(id_str);
		latitude = stod(lat_str);
		longitude = stod(long_str);

		Client* client= new Client(id, Coord(latitude, longitude), name);

		superMarketChain->getPlaces()->insert(make_pair(id,client));
		superMarketChain->getAllNodes()->insert(make_pair(id,client));
		superMarketChain->addClients(*client);
		superMarketChain->getGraph()->addVertex(*client);

		nclients++;
	}

	cout << "Read "<< nclients << " clients.\n";

}

void LoadingResources::loadSuperMarkets() {

	ifstream superMarketsInfo(graphsFiles[Files::SuperMarketsFile]);

	if(!superMarketsInfo.is_open()){
			cerr << "Unable to open file " << GraphsInfo << endl;
			exit(1);
		}

	long long id;
	double latitude;
	double longitude;
	string name;
	string id_str;
	string lat_str;
	string long_str;

	/*
	 * Ignoring degrees Values
	 */


	while(getline(superMarketsInfo, id_str, ';'), getline(superMarketsInfo, lat_str, ';'), getline(superMarketsInfo, long_str, ';'),
			getline(superMarketsInfo, lat_str, ';'),  getline(superMarketsInfo, long_str, ';'), getline(superMarketsInfo, name, ';')){


		id = stoll(id_str);
		latitude = stod(lat_str);
		longitude = stod(long_str);

		Supermarket* superMarket=new Supermarket(id, Coord(latitude, longitude), name);

		superMarketChain->getPlaces()->insert(make_pair(id,superMarket));
		superMarketChain->getAllNodes()->insert(make_pair(id,superMarket));
		superMarketChain->addSupermarkets(*superMarket);
		superMarketChain->getGraph()->addVertex(*superMarket);

		nsupers++;
	}

	cout << "Read "<< nsupers << " SuperMarkets.\n";

}


void LoadingResources::loadNodes() {

	ifstream nodesInfo(graphsFiles[Files::NodesFiles]);

	if(!nodesInfo.is_open()){
		cerr << "Unable to open file " << GraphsInfo << endl;
		exit(1);
	}

	long long id;
	double latitude;
	double longitude;
	char sep;
	int nodesIgnored = 0;

	/*
	 * Ignoring degrees Values
	 */

	while(nodesInfo >> id >> sep >>
			latitude >> sep >> longitude >> sep >>
			latitude >> sep >> longitude){


		if(superMarketChain->getPlaces()->find(id)==superMarketChain->getPlaces()->end()){

			Place* place= new Place(id, Coord(latitude, longitude));


			superMarketChain->getAllNodes()->insert(make_pair(id,place));
			superMarketChain->getGraph()->addVertex(*place);


			nAllNodes++;
		}
		else
			nodesIgnored++;
	}

	cout << "Read "<< nAllNodes << " nodes.\n";
	cout << "Ignored "<< nodesIgnored << "/" << nsupers + nclients << " nodes.\n";

}

void LoadingResources::loadRoads() {

	ifstream roadsInfo(graphsFiles[Files::StreetsFiles]);

	if(!roadsInfo.is_open()){
			cerr << "Unable to open file " << GraphsInfo << endl;
			exit(1);
		}

	long long id;
	string name;
	bool is2way;
	string id_;
	char sep;
	string line;
	string is2wayS;


	while(getline(roadsInfo, id_, ';'), getline(roadsInfo, name, ';'), getline(roadsInfo, is2wayS)){

		id=stoll(id_);
		is2way=string2bool(is2wayS);

		Street* street = new Street(id,name,is2way);

		superMarketChain->getRoads()->insert(make_pair(id, street));

		nroads++;
	}
	cout << "Read " << nroads << " roads.\n";
}

void LoadingResources::loadGeom() {

	ifstream geomInfo(graphsFiles[Files::GeomFile]);

	if(!geomInfo.is_open()){
			cerr << "Unable to open file " << GraphsInfo << endl;
			exit(1);
		}

	long long int road_id, node1_id, node2_id;
	char sep;
	double distance;

	while(geomInfo >> road_id >> sep >>
			node1_id >> sep >> node2_id >> sep){

		unordered_map<long long int, Place*>* temp = superMarketChain->getAllNodes();


		try {
			distance = temp->at(node1_id)->getDistance(temp->at(node2_id));
		} catch (...) {
			cerr << "File Information Corrupted " << GraphsInfo << endl;
			exit(1);
		}

		Transition* transition;

		if(superMarketChain->getRoads()->at(road_id)->is2Way()){
			transition = new Transition(road_id, node1_id, node2_id, distance, true);
			Transition* invTransition = new Transition(road_id, node2_id, node1_id, distance, true);
			superMarketChain->getGraph()->addEdge(invTransition);

		}
		else{
			transition = new Transition(road_id, node1_id, node2_id, distance, false);
		}

		superMarketChain->getGraph()->addEdge(transition);
		superMarketChain->getTransitions()->push_back(transition);


		ngeoms++;

		}

	cout << "Read " << ngeoms << " geoms.\n";
}


bool LoadingResources::string2bool(const std::string &v){
	if(!v.empty() && v == "True"){
		return true;
	}
	return false;
}

