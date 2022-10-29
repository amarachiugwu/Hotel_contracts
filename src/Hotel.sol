// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import 'HotelToken.sol';

contract Hotel {
    struct Room {
        bool isBooked;
        uint price;
        uint roomNo;
    }

    uint public totalRooms = 50;

    // array of all room details
    Room [] public rooms;

    // array of available rooms
    Room [] public availableRooms;

    // array of booked rooms
    Room [] public bookedRooms;

    // history of bookings
    mapping (address => Room) bookings;

    error RoomIsBooked();
    error InsufficientFunds();

    constructor (uint _totalRooms){
        for (uint256 i = 0; i < _totalRooms;) {
            
            Room room = {
                isBooked : false;
                price : 50;
                roomNo : i+1;
            }

            rooms.push(room);

            i++;
        }

        availableRooms = rooms;

        bookedRooms = [];

    }
    

    function bookRoom(uint _roomNo) external {
        Room room = rooms[_roomNo - 1];
        if (room.isBooked == true) {
            revert RoomIsBooked();
        }

        uint htkBal = HotelToken.balanceOf(msg.sender);
        if(htkBal >=  room.price){
            revert InsufficientFunds();
        }
        HotelToken.approve()

    }
}