/**
 *Submitted for verification at Etherscan.io on 2020-08-23
*/

pragma solidity ^0.6.12;

// Unipool Contract Fork from Aragon
// https://etherscan.io/address/0xEA4D68CF86BcE59Bf2bFA039B97794ce2c43dEBC#code

/**
 * @dev Standard math utilities missing in the Solidity language.
 */
library Math {
    /**
     * @dev Returns the largest of two numbers.
     */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b != 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IMissionModule {
    function balanceOf(address owner) external view returns (uint);
    function deposit(uint) external;
    function withdraw(uint) external;    
}



/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following 
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Converts an `address` into `address payable`. Note that this is
     * simply a type cast: the actual underlying value is not changed.
     *
     * _Available since v2.4.0._
     */
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     *
     * _Available since v2.4.0._
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for ERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


contract StakingRewards {
    
    using SafeMath for uint256;
    using SafeERC20 for IERC20;    
    
    address constant public instrument = address(0xE09A504071C0c1483E86727fb95f550a0559d9D2); // staking token
    address constant public mineral = address(0xE09A504071C0c1483E86727fb95f550a0559d9D2); // reward token    
    IERC20  public rewardsToken2 = IERC20(0x68a0A1fEF18DfCC422Db8bE6F0F486dEa1999EDC); // reward token   

    address public feeTo;
    address public mission; // strategy token
    uint public _totalSupply;
    mapping(address => uint256) public _balances;
    uint public rewardPerTokenStored; // x 1e18, monotonically increasing.
    mapping(address => uint256) public userRewardPerTokenPaid; // x 1e18
    mapping(address => uint256) public rewards; // last paid _profitPerShare
    mapping(address=>bool) grayList;
    
    
    uint public duration = 1;
    uint public periodFinish;
    uint public rewardRate;
    uint public lastUpdateTime;
    uint public minAmount;
    uint256 public fee = 0;
    uint256 public rewardsDuration2 = 1;
    uint256 public periodFinish2 = 0;
    uint256 public rewardRate2 = 0;
    uint256 public lastUpdateTime2;
    uint256 public rewardPerTokenStored2;
    address public owner;
    uint public _pools;
    mapping(address => uint256) public userRewardPerTokenPaid2;
    mapping(address => uint256) public rewards2;

    
    event Staked(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event RewardPaid(address indexed user, uint256 reward);
    event RewardAdded(uint256 reward);
    constructor() public {
        owner = msg.sender;
    }
    
    function balance() public view returns (uint256) {
        return _pools;
    }
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    
    modifier onlyCommander() {
        require(msg.sender == owner, "only commander");
        _;
    }

    modifier updateReward(address account) {
        // Tells the contract that the buyer doesn't deserve dividends for the tokens before they owned them;
        // really i know you think you do but you don't
        // https://etherscan.io/address/0xb3775fb83f7d12a36e0475abdd1fca35c091efbe#code        
        rewardPerTokenStored = rewardPerToken();
        lastUpdateTime = lastTimeRewardApplicable();
        if (account != address(0)) {
            rewards[account] = earned(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }
    function lastTimeRewardApplicable() public view returns (uint256) {
        return Math.min(block.timestamp, periodFinish);
    }

    function rewardPerToken() public view returns (uint256) {
        if (_totalSupply == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.add(
                lastTimeRewardApplicable()
                    .sub(lastUpdateTime)
                    .mul(rewardRate)
                    .mul(1e18)
                    .div(totalSupply())
            );
    }
    function earned(address account) public view returns (uint256) {
        return
            balanceOf(account)
                .mul(rewardPerToken().sub(userRewardPerTokenPaid[account]))
                .div(1e18)
                .add(rewards[account])
            ;
    }

    function stake(uint _amount) public  updateReward2(msg.sender) {
        uint _pool = _pools;
        uint shares;
        IERC20 u = IERC20(instrument);
        u.safeTransferFrom(msg.sender, address(this), _amount);
        if (totalSupply() == 0) {
            shares = _amount;
        } else {
            shares = (_amount.mul(totalSupply())).div(_pool);
        }
        _totalSupply = _totalSupply.add(shares);
        _balances[msg.sender] = _balances[msg.sender].add(shares);
        _pools = _pools.add(_amount);
        if(address(0) != address(mission)){
            depositAll();
        }
    }
   function withdraw(uint _shares) public  updateReward2(msg.sender){
        uint amount = (balance().mul(_shares)).div(totalSupply());

        _balances[msg.sender] = _balances[msg.sender].sub(_shares);
        _totalSupply = _totalSupply.sub(_shares);
        _pools = _pools.sub(amount);
        IERC20 u = IERC20(instrument);        
        if (amount > u.balanceOf(address(this))) {
            IMissionModule y = IMissionModule(mission);
            y.withdraw(amount - u.balanceOf(address(this)));
        }
        u.safeTransfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }

    
    function getReward2() public updateReward2(msg.sender) {
        uint256 reward2 = earned2(msg.sender);
        if (reward2 != 0) {
            rewards2[msg.sender] = 0;
            if(!grayList[msg.sender]){
                rewardsToken2.safeTransfer(msg.sender, reward2);
            }
            emit RewardPaid(msg.sender, reward2);
        }
    }   
    function exit() external {
        withdraw(balanceOf(msg.sender));
        getReward2();
    }

    // exploration
    function depositAll() public{
        IERC20 u = IERC20(instrument);
        IMissionModule y = IMissionModule(mission);
        y.deposit(u.balanceOf(address(this)));
    }

    function depositSome(uint256 amount) public onlyCommander{
        IERC20 u = IERC20(instrument);
        IMissionModule y = IMissionModule(mission);
        y.deposit(amount);
    }
    
    function withdrawAll() public onlyCommander{
        IMissionModule y = IMissionModule(mission);
        y.withdraw(y.balanceOf(address(this)));
    }
    
    function unApprove(address deprecated_mission) external onlyCommander() {
        IERC20 u = IERC20(instrument);        
        u.safeApprove(deprecated_mission, 0);
    }
    
    function newMission(address _mission) external onlyCommander() {
        if(address(0) != address(mission)){
            IMissionModule y = IMissionModule(mission);
            if(y.balanceOf(address(this)) != 0){
                y.withdraw(y.balanceOf(address(this)));
            }
        }
        IERC20 u = IERC20(instrument);       
        u.safeApprove(_mission, 0); 
        u.safeApprove(_mission, uint(-1));
        mission = _mission;
    }

    function newMissionNotWithdraw(address _mission) external onlyCommander() {
        IERC20 u = IERC20(instrument);       
        u.safeApprove(_mission, 0); 
        u.safeApprove(_mission, uint(-1));
        mission = _mission;
    }


    function newDuration(uint _duration) external onlyCommander() {
        require(block.timestamp >= periodFinish, "period not finish");
        duration = _duration;
    }    

    /**
     * @dev This function must be triggered by the contribution token approve-and-call fallback.
     *      It will update reward rate and time.
     * @param _amount Amount of reward tokens added to the pool
     */
    function notifyAmount(uint256 _amount) external {
        IERC20 t = IERC20(mineral);
        t.safeTransferFrom(msg.sender, address(this), _amount);
        _pools = _pools.add(_amount);
    }


    function lastTimeRewardApplicable2() public view returns (uint256) {
        return Math.min(block.timestamp, periodFinish2);
    }
    function rewardPerToken2() public view returns (uint256) {
        if (_totalSupply == 0) {
            return rewardPerTokenStored2;
        }
        return
            rewardPerTokenStored2.add(
                lastTimeRewardApplicable2().sub(lastUpdateTime2).mul(rewardRate2).mul(1e18).div(_totalSupply)
            );
    }
    function earned2(address account) public view returns (uint256) {
        return _balances[account].mul(rewardPerToken2().sub(userRewardPerTokenPaid2[account])).div(1e18).add(rewards2[account]);
    }
    function getRewardForDuration2() external view returns (uint256) {
        return rewardRate2.mul(rewardsDuration2);
    }
    function newDuration2(uint _duration) external onlyCommander() {
        require(block.timestamp >= periodFinish2, "period not finish");
        rewardsDuration2 = _duration;
    }    
    function notifyRewardAmount2(uint256 reward) external onlyCommander updateReward2(address(0)) {
        if (block.timestamp >= periodFinish2) {
            rewardRate2 = reward.div(rewardsDuration2);
        } else {
            uint256 remaining = periodFinish2.sub(block.timestamp);
            uint256 leftover = remaining.mul(rewardRate2);
            rewardRate2 = reward.add(leftover).div(rewardsDuration2);
        }

        // Ensure the provided reward amount is not more than the balance in the contract.
        // This keeps the reward rate in the right range, preventing overflows due to
        // very high values of rewardRate in the earned and rewardsPerToken functions;
        // Reward + leftover must be less than 2^256 / 10^18 to avoid overflow.
        uint balance = rewardsToken2.balanceOf(address(this));
        require(rewardRate2 <= balance.div(rewardsDuration2), "Provided reward too high");
        
        lastUpdateTime2 = block.timestamp;
        periodFinish2 = block.timestamp.add(rewardsDuration2);
        emit RewardAdded(reward);
    }
    modifier updateReward2(address account) {
        rewardPerTokenStored2 = rewardPerToken2();
        lastUpdateTime2 = lastTimeRewardApplicable2();
        if (account != address(0)) {
            rewards2[account] = earned2(account);
            userRewardPerTokenPaid2[account] = rewardPerTokenStored2;
        }
        _;
    }
    function setMinAmount(uint _amount) public onlyCommander{
        minAmount = _amount;
    }

    function setFeeTo(address _feeTo) public onlyCommander{
        feeTo = _feeTo;
    }
    function setOwner(address _newOwner) public onlyCommander{
        owner = _newOwner;
    }

    function setGrayList(address _gray, bool _flg) public onlyCommander{
        grayList[_gray] = _flg;
    }
    function setWithDrawFee(uint _fee) public onlyCommander{
        require(_fee<100);
        fee = _fee;
    }
    function getPricePerFullShare() public view returns (uint256) {
        return _pools.mul(1e18).div(_totalSupply);
    }

    function getWantBalance(address _tmp) public view returns (uint256){
        return balanceOf(_tmp).mul(_pools).div(_totalSupply);
    }
}