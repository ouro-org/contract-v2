// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;


interface IOUROVipManager  {

    function joinNormalMemberShip() external;

    function joinGenesisMemberShip() external;

    function isNormalVip(address user) external view returns (bool);
    function isGenesisVip(address user) external view returns (bool);
    function isVip(address user) external view returns (bool);

}