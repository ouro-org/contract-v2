// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IOUROMintRouter {
    function sendCommissionToMinter(address to, uint256 amount) external;
}