// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

interface IUSDO {
    function mint(address to, uint256 amount) external;
    function burn(address from, uint256 amount) external;
    function update(address from, address to, uint256 value) external;
    function setConsumerTaxExemptReceiver(address receiver, bool isExempt) external;
    function setConsumerTaxExemptSender(address sender, bool isExempt) external;
}