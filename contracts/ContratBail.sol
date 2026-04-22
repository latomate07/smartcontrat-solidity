// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContratBail {
    // ---------- Part 1 ----------
    string public nomContrat = "Contrat de Bail avec Blockchain";

    // ---------- Part 2 : les acteurs ----------
    address public proprietaire;
    address public locataire;
    
    // ---------- Part 3 : le loyer ----------
    uint public loyer;
    bool public loyerPaye;

    // ---------- Part 6 : declaration de l'event ----------
    event LoyerPaye(address locataire, uint montant);

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

    // ---------- Part 5 & 6 : payer le loyer + emettre l'event ----------
    function payerLoyer() public payable {
        require(msg.sender == locataire, "Seul le locataire peut payer le loyer");
        require(msg.value == loyer, "Le montant envoye ne correspond pas au loyer");

        loyerPaye = true;
        emit LoyerPaye(msg.sender, msg.value);
    }

    // ---------- Part 7 : recuperer le loyer ----------
    function retirerLoyer() public {
        require(msg.sender == proprietaire, "Seul le proprietaire peut retirer le loyer");
        require(loyerPaye, "Le loyer n'a pas encore ete paye");
        uint montant = address(this).balance;
        loyerPaye = false;
        payable(proprietaire).transfer(montant);
    }
}