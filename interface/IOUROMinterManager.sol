// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IOUROMinterManager {

    struct MinterInfo {
        uint256 dailyAllowance;    // Daily minting limit
        string name;               // Minter name
        uint256 activeAt;          // Activation time
        uint256 totalMinted;       // Total minted amount
        uint256 lastMintDay;       // Last minting date
        uint256 lastMintAmount;    // Last minting amount
    }

    // -- Admin write Functions ---
    function addMinter(address minter, string memory name, uint256 dailyAllowance) external;
    function updateMinterName(address minter, string memory name) external;
    function removeMinter(address minter) external;

    // --- User write Functions ---
    /**
     * @dev Mint USDO by minter
     * @param minter The address of the minter
     * @param amount The amount of OURO to mint
     */
    function mintByMinter(address minter, uint256 amount) external;

    // --- User view Functions ---
    /**
     * @dev Get the minters info and today's remaining allowance for each minter
     * @param minterAddressList Array of minter addresses to query
     * @return mintersInfo Array of MinterInfo structs containing minter details
     * @return todayAllowance Array of remaining daily allowance for each minter
     * @notice Only returns data for whitelisted addresses, non-whitelisted addresses will be skipped
     */
    function getMintersInfoAndAllowance(address[] memory minterAddressList) external view returns (MinterInfo[] memory, uint256[] memory);
} 