pragma solidity ^0.4.11;

contract ClubeDiaria{
    
    mapping (address => string) public nomes;
    mapping (address => uint256) public saldos;    

    string public nomeDoClube;    

    function Clube(string _nome){
        nomeDoClube = _nome;
    }

    function registrar(string _nome) payable {
        if (msg.value != 5 ether) revert();
        nomes[msg.sender] = _nome;
        saldos[msg.sender] = msg.value;
    }

    function diaria(address _para){
        //1 Verificar se pessoa tem saldo
        require(saldos[msg.sender] >= 1 ether);
        
        //2 Transferir para 'dono' da casa
        _para.transfer(1 ether);

        //3 Contabilizar novo saldo da pessoa no clube
        saldos[msg.sender] -= 1 ether;
    }

    function depositarSaldo() payable {
        saldos[msg.sender] += msg.value;
    }
}