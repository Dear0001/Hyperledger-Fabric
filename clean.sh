#!/usr/bin/env bash

#if your using centos then enable below command
sudo setenforce 0

removeOrdererCA() {

  echo "Removing Orderer CA"
  docker-compose -f ./orderer/ca-orderer.yaml down -v

}
removeOrg1CA() {

  echo "Removing Org1 CA"
  docker-compose -f ./org1/ca-org1.yaml down -v

}
removeOrg2CA() {

  echo "Removing Org2 CA"
  docker-compose -f ./org2/ca-org2.yaml down -v

}
removeOrderers() {
  echo "Removing orderers "
  docker-compose -f ./orderer/docker-compose-orderer.yaml down -v
}
removeOrg1() {

  echo "Removing Org1 Peers"
  docker-compose -f ./org1/docker-compose-peer.yaml down -v
}
removeOrg2() {
  echo "Removing Org1 Peers"
  docker-compose -f ./org2/docker-compose-peer.yaml down -v
}
removeExplorer() {
  echo "Removing explorer"
  cd explorer
  docker-compose down -v
  cd ..
}
removeGrafanaPrometheus() {
  echo "Removing Grafana and Prometheus"
  cd monitoring
  docker-compose down -v
  cd ..
}
removeOrdererCA
removeOrg1CA
removeOrg2CA
removeOrderers
removeOrg1
removeOrg2
removeExplorer
removeGrafanaPrometheus
echo "Removing crypto CA material"
sudo rm -rf ./orderer/fabric-ca
sudo rm -rf ./org1/fabric-ca
sudo rm -rf ./org2/fabric-ca
sudo rm -rf ./orderer/crypto-config-ca
sudo rm -rf ./org1/crypto-config-ca
sudo rm -rf ./org2/crypto-config-ca
sudo rm -rf ./org1/Org1MSPanchors.tx
sudo rm -rf ./org2/Org2MSPanchors.tx
sudo rm -rf ./orderer/genesis.block
sudo rm -rf ./orderer/mychannel.tx
sudo rm -rf ./org1/mychannel.tx
sudo rm -rf ./org1/mychannel.block
sudo rm -rf ./org2/mychannel.tx
sudo rm -rf ./org2/mychannel.block
sudo rm -rf ./explorer/dockerConfig/crypto-config
sudo rm -rf ./deployChaincode/*.tar.gz
sudo rm -rf ./deployChaincode/node_modules
sudo rm -rf ./deployChaincode/log.txt
sudo rm -rf ./deployChaincode/npm-debug.log
sudo rm -rf ./revokeIdentity/config*  ./revokeIdentity/modi* ./revokeIdentity/base64Cert
