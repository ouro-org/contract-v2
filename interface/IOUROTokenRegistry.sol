// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IOUROTokenRegistry {

    // --- View Functions ---
    function isSupported(address token) external view returns (bool);
    function getRedeemFee(address token) external view returns (uint256);
    function getLastUpdated(address token) external view returns (uint256);
    function getBaseRedeemFeeRate() external pure returns (uint256);
    function getPendingFee(address token) external view returns (uint256);
    function getActivationTime(address token) external view returns (uint256);
    function getPendingTokenInfo(address token) external view returns (uint256 fee, uint256 activationTime);
    function getTokenPriceUsd(address token) external view returns (uint256 price, uint8 decimals);

    // --- Admin Functions ---
    function addToken(address token, uint256 fee) external;
    function removeToken(address token) external;
    function reactivateToken(address token) external;
    function updateRedeemFee(address token, uint256 newFee) external;
    function activatePendingFee(address token) external;
    function activatePendingToken(address token) external;
    function setPriceFeed(address token, address aggregator) external;

}
