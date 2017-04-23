pragma solidity ^0.4.0;

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
	string lenderCoords; /* Physical coords where bottle will be transferred to courier */
	string borrowerCoords; /* Physical coords where bottle will be delivered */
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
        status = "borrowing";
        return (new TransportContract).value(transportFee) (lenderCoords, borrowerCoords, this.address);
    }	

	function transportDone() {
			if (status == "borrowing")
				lenderWalletAddress.send(bonkaPrice);
				status = "returning";
			if (status == "returning")
				borrowerWalletAddress.send(bonkaPrice);
				status = "borrowing";
	}
    
    
    
    function commitToReturn(string lenderCoords, uint transportFee)
    public
    payable
    returns (address)
    {
        if (msg.value < bonkaPrice+transportFee) throw;
        lenderWalletAddress = msg.sender;
        status = "returning";
        return (new TransportContract).value(transportFee) (borrowerCoords, lenderCoords, this.address);
    }
	
	
	function failedToReturn(uint start) {
		if (now >= start + 1 days) {
			bonkaContract.kill.sendTransaction()
		}
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
    
    function commitToTransport(string lenderCoords, string borrowerCoords, this.address) 
    public
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

