pragma solidity ^0.6.0;

import "./aavepod.sol";
import "./yieldpod.sol";

contract PodFactory is Ownable{
    address[] public podAddress;
    function createPod( 
        uint256 _lendingChoice,
        uint256 minimum, 
        uint256 numstakers, 
        uint256 timeStamp, 
        address tokenAddress, 
        address interestBearingToken, 
        string memory betName
        
    ) public onlyOwner {
        if(_lendingChoice == 1) {
            aavepod newAAVEPod = new aavepod(minimum, numstakers, timeStamp, tokenAddress, interestBearingToken, msg.sender, betName);
            podAddress.push(address(newAAVEPod));
        } else if(_lendingChoice == 1) {
            yieldpod newYieldPod = new yieldpod(minimum, numstakers, timeStamp, tokenAddress, interestBearingToken, msg.sender, betName);
            podAddress.push(address(newYieldPod));
        } 
    }
    
    function getPods() public view returns (address[] memory){
        return podAddress;
    }
}
