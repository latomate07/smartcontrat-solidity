pragma solidity ^0.8.0;
contract ContratBail {
    string public nomContrat = "Contrat de Bail avec Blockchain";
    address public proprietaire;
    address public locataire;
    uint public loyer;

    constructor (address _locataire) {
        proprietaire = msg.sender;
        locataire = _locataire;
    }


}