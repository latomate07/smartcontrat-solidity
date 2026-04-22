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
}