// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.13;

contract SimpleStorage {
    // this will get initialized to 0
    uint256 favoriteNumber = 0;


    //struct making class like in c++

    struct People {

        uint256 favoriteNumber;
        string Name;
    }

    // People public Person1 = People({favoriteNumber: 234, Name: "Shivangi"});

    People[] public people;
    // mapping similar to hashmaps in cpp
    // defining key => value pair
    mapping(string => uint256) public findFavoriteNumberByName;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view,pure functions that do not change the statr of thr transactions
    // public variables are view too reperesented in blue

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // pure functions are for purely mathmetical operation
    function Domath(uint256 favoriteNumber) public pure returns(uint256){
        return favoriteNumber + 2;
    }
    
    // memory is used to store anything on runtime it will disappear after function returns
    // storage will keep its value even after it is executed

    function addPeople(string memory personName, uint256 rank) public{
       
        people.push(People({favoriteNumber: rank, Name: personName}));
        // this is same as in cpp we access value present at that key 
        // we are putting the value for that key 
        findFavoriteNumberByName[personName] = rank;
    }

    // bool favoriteBool = false;
    // string favoriteString = "String";
    // int favoriteInt = -5;
    // address favoriteAddress = 
}