// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IOUROTreasure {
    function withdraw(address token, address to, uint256 amount) external;
    function balanceOf(address token) external view returns (uint256);
}