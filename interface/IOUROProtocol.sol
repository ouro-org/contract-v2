// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IOUROProtocol {

    event CoreInitialized(address usdo, address star, address vipManager, address minterManager, address mintRouter, address tokenRegistry, address treasure);
    event EpochAdvanced(uint32 indexed newEpoch, uint256 timestamp, uint256 duration);
    // record user tax burned
    // user: user address
    // to: to address
    // taxAmount: tax amount
    // starAmount: star amount
    // epoch: epoch number
    event UserTaxBurned(address indexed user, address indexed to, uint256 taxAmount, uint256 starAmount, uint256 epoch);
    // record new appended star amount, including user and referrer rebate star amount
    // currentEpoch: current epoch number when STAR added
    // effectiveEpoch: effective epoch number when STAR take effect
    // epochUserTotalEnAmount: user's total star amount in the epoch, including pending epoch
    event StarAppended(address indexed user, uint256 indexed currentEpoch, uint256 indexed effectiveEpoch, uint256 starAmount, uint256 epochUserTotalStarAmount);
    event TokenDeposited(address indexed to, address indexed token, uint256 amount, uint256 usdoAmount, address referrer);
    event TokenRedeemed(address indexed user, address indexed token, uint256 amount, uint256 tokenAmount, uint256 redeemTax);
    event AirdropApplied(address indexed user, uint64 indexed epoch, uint64 indexed level, uint256 amount);
    event AirdropClaimed(address indexed user, uint256 indexed amount);
    event PendingRewardsBecameClaimable(address indexed user, uint32 indexed epoch, uint256 amount, uint32 currentEpoch);
    event TotalRewardsApplied(address indexed user, uint32 indexed applyEpoch, uint256 amount, uint32 currentEpoch);

    // referrer event
    event ReferrerSet(address indexed user, address indexed referrer);
    event ReferrerRebate(address indexed user, address indexed referrer, uint256 amount, uint256 epoch);
    event ReferrerQualificationSet(address indexed referrer);

    // withdraw event
    event RedeemTaxWithdrawal(address indexed user, address indexed token, uint256 amount);


    event MintByMinter(address indexed user, address indexed minter, uint256 usdoAmount, uint256 commissionAmount);
    event ExemptSenderAddressAdded(address indexed addr);
    event ExemptSenderAddressRemoved(address indexed addr);

    event CumulativeValuesSet(uint[] cumulativeValues);

    /** mint usdo from token, etc.
     * 
     * 
     * Requirements:
     * - amount: must be greater than 0
     * - referrer: must be valid address
     * - only new user can set referrer
     * - old user can't change referrer, and can only add referrer's referrer amount
     */
    function deposit(uint256 amount, address referrer, address token) external;

        /**
     * @dev Redeem token from USDO
     * @param amount The amount of token to redeem
     * @param token The token to redeem
     * 
     * Requirements:
     * - amount: must be greater than 0
     * - Insufficient balance: must have enough USDO balance
     * - will charge a tax for redeem
     * - only manager can call
     * - will burn the USDO
     */
    function redeem(uint256 amount, address token) external;

    /**
     * @dev Claim the airdrop
     *  user will receive USDO as airdrop
     * 
     * Requirements:
     * - totalClaimableAmount: must be greater than 0
     */
    function claimAirdrop() external;


    // internal
    /**
     * @dev Handles the tax calculation and collection for token transfers
     * @param from The address sending tokens
     * @param to The address receiving tokens
     * @param amount The original transfer amount
     * @return The amount after tax that should be transferred to the recipient
     */
    function handleConsumerTax(address from, address to, uint256 amount) external returns (uint256);

    /**
     * @dev Set the referrer for the user
     * @param referrer The address of the referrer
     */
    function setReferrerQualification(address referrer) external;

    // --- User View Functions ---
    /**
     * @dev Calculate the cumulative applyable rewards amount for the user
     * @return The cumulative applyable rewards amount for the user
     */
    function userCumulativeApplyableRewardsAmount() external view  returns (uint256);

    /**
     * @dev Get the user's valid star amount for a specific epoch
     * @param user The address of the user
     * @param epoch The epoch number
     * @return The user's valid star amount for the specified epoch
     */
    function getUserValidStar(address user, uint256 epoch) external view returns (uint256);

    /**
     * @dev get the epoch info  
     * @param epoch The epoch number
     * @return currentTime current time     
     * @return startTime current epoch start time
     * @return endTime current epoch end time
     * @return remainingTime current epoch remaining time
     * @return usdoVolume current epoch STAR volume
     * @return usdoBurned current epoch STAR burned
     */
    function getEpochInfo(uint256 epoch) external view returns (
        uint256 currentTime,
        uint256 startTime,
        uint256 endTime,
        uint256 remainingTime,
        uint256 usdoVolume,
        uint256 usdoBurned
    );

    // -- User write Functions ---
    /**
     * @dev Mint USDO by minter
     * @param minterAddress The address of the minter
     * @param starAmount The amount of Star to mint
     */
    function mintStarByMinter(address minterAddress, uint256 starAmount) external;


    // -- Admin Functions ---
    /**
     * @dev Set the cumulative values for the star rate
     * @param _values The cumulative values for the star rate
     */
    function setCumulativeValues(uint[] calldata _values) external;
}
