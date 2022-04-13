// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Stakeable {
    struct Stake {
        address user;
        uint256 amount;
        uint256 since;
        uint256 claimable;
    }

    struct Stakeholder {
        address user;
        Stake[] addressStakes;
    }

    struct StakingSummary {
        uint256 totalAmount;
        Stake[] stakes;
    }

    Stakeholder[] internal stakeholders;

    mapping(address => uint256) internal stakes;

    event Staked(
        address indexed user,
        uint256 amount,
        uint256 index,
        uint256 timestamp
    );

    uint256 internal rewardPerHour = 1000;

    constructor() {
        stakeholders.push();
    }

    function _addStakeholder(address staker) internal returns (uint256) {
        stakeholders.push();

        uint256 userIndex = stakeholders.length - 1;

        stakeholders[userIndex].user = staker;

        stakes[staker] = userIndex;
        return userIndex;
    }

    function _stake(uint256 _amount) internal {
        require(_amount > 0, "Cannot stake nothing");

        uint256 index = stakes[msg.sender];
        uint256 timestamp = block.timestamp;

        if (index == 0) {
            index = _addStakeholder(msg.sender);
        }

        stakeholders[index].addressStakes.push(
            Stake(msg.sender, _amount, timestamp, 0)
        );

        emit Staked(msg.sender, _amount, index, timestamp);
    }

    function calculateStakeReward(Stake memory _currentStake)
        internal
        view
        returns (uint256)
    {
        return
            (((block.timestamp - _currentStake.since) / 1 hours) *
                _currentStake.amount) / rewardPerHour;
    }

    function _withdrawStake(uint256 _amount, uint256 index)
        internal
        returns (uint256)
    {
        uint256 userIndex = stakes[msg.sender];
        Stake memory currentStake = stakeholders[userIndex].addressStakes[
            index
        ];
        require(
            currentStake.amount >= _amount,
            "Cannot withdraw more than you have staked"
        );

        uint256 reward = calculateStakeReward(currentStake);

        currentStake.amount -= _amount;
        if (currentStake.amount == 0) {
            delete stakeholders[userIndex].addressStakes[index];
        } else {
            stakeholders[userIndex].addressStakes[index].amount = currentStake
                .amount;
            stakeholders[userIndex].addressStakes[index].since = block
                .timestamp;
        }

        return _amount + reward;
    }

    function hasStake(address _staker)
        public
        view
        returns (StakingSummary memory)
    {
        uint256 totalStakeAmount;

        StakingSummary memory summary = StakingSummary(
            0,
            stakeholders[stakes[_staker]].addressStakes
        );

        for (uint256 i = 0; i < summary.stakes.length; i++) {
            uint256 availableReward = calculateStakeReward(summary.stakes[i]);
            summary.stakes[i].claimable = availableReward;
            totalStakeAmount += summary.stakes[i].amount;
        }

        summary.totalAmount = totalStakeAmount;
        return summary;
    }
}
