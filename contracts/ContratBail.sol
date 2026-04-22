pragma solidity ^0.8.0;

contract ContratBail {
    // ---------- Part 1 ----------
    string public nomContrat = "Contrat de Bail avec Blockchain";

    // ---------- Part 2 : les acteurs ----------
    address public proprietaire;
    address public locataire;

    // ---------- Part 3 : le loyer ----------
    uint public loyer;

    // ---------- Constructor (Parts 2 & 3) ----------
    // Le proprietaire = celui qui deploie le contrat
    // Le loyer est defini au moment du deploiement
    constructor(uint _loyer) {
        proprietaire = msg.sender;
        loyer = _loyer;
    }

    function definirLocataire(address _locataire) public {
        require(msg.sender == proprietaire, "Seul le proprietaire peut definir le locataire");
        locataire = _locataire;
    }

    // ---------- Part 5 : le paiement du loyer ----------
    function payerLoyer() public payable {
        require(msg.sender == locataire, "Seul le locataire peut payer le loyer");
        require(msg.value == loyer, "Montant incorrect");
        loyerPaye = true;
    }
}