// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;
// in this we are trying to make payment from one address to another

// importing an chainlink internface for latest data feeds
//import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  // getRoundData and latestRoundData should both raise "No data present"
  // if they do not have data to report, instead of returning unset values
  // which could be misinterpreted as actual reported values.
  function getRoundData(uint80 _roundId)
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
}


contract FundMe {

    mapping(address => uint256) public AddressToAmountFunded;

    function fund() public payable {
        AddressToAmountFunded[msg.sender] += msg.value; 
        // msg.value => amt to be tranferred
        // msg.sender => address of the account to be transferred (reciever)
    }

// In this function we are getting the version of the aggregator interface which is 3
// Interface works similar to struct 
// we will need to pass the address of the chain link data feed conversion we are using here eth-usd
    function getVersion() public view returns (uint256) {
        // idk there is a problem with the rinkeby test network but it worked with kovan
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        return priceFeed.version();
    }
// this function will tell the conversion of eth to usd it is in our answer
    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        // this is a tuple  
        (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        // casting the type of answer to uint256 
        return uint256(answer);
    }
}