pragma solidity ^0.4.0

contract mortal {
	address owner;
	
	function mortal() { 
		owner = msg.sender(); 
	}
	
	function kill() {
		if (msg.sender == owner) suicide(owner);
	}
}

contract bonkaContract is mortal {
	string bonkaName; /* Bottle brand */
	uint public bonkaPrice; 
	string lenderCoords;
	string borrowerCoords;
	address lenderWalletAddress;
	address courierWalletAddress;
	address borrowerWalletAddress;
	string status;
	
	
	
    function commitToBorrow(string borrowerCoords, uint transportFee)
    public
    payable
    returns (address)
    {
        if (msg.value < bonkaPrice+transportFee) throw;
        borrowerWalletAddress = msg.sender;
        start = block.timestamp;
        return (new TransportContract).value(transportFee) (lenderCoords, borrowerCoords, this.address);
    }	
    

	function transportDone() {
			
	}

	function expire(uint start, uint daysAfter) {
		if (now >= start + 1 days) { ... }
	}	

}
   
    
    

contract TransportContract {
    
    function TransportContract(lenderCoords, borrowerCoords, creatorAddress)
    public
    payable {
        lenderCoords = lenderCoords;
        borrowerCoords = borrowerCoords;
        creatorAddress = creatorAddress;
    }
    
    
    
    //creator
    
    function commitToTransport(string lenderCoords, string borrowerCoords, this.address) 
    public
    payable
    {
        /* commit fee must be at least equal to the bottle price*/
	if (msg.value < bonkaPrice+transportFee) throw;
    courierWalletAddress = msg.sender;
    }


	function transportDone(courierWalletAddress, lenderWalletAddress)
	payable
	returns (bool)
	{
		courierWalletAddress = msg.sender;
		payCourier(courierWalletAddress);
		courierWalletAddress.send(amount);
		creatorAddress.transportDone()
    }
}	

