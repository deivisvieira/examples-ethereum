pragma solidity ^0.4.11;

contract Irmaos{
    
    event Divisao(address _para, uint256 valor);
    
    function dividir(address p1, address p2) payable {
        uint256 valor = msg.value;
        uint256 valor1 = valor / 2;
        uint256 valor2 = valor - valor1;
        
        p1.transfer(valor1);
        Divisao(p1, valor1);
        
        p2.transfer(valor2);
        Divisao(p2, valor2);
    }
}