pragma solidity ^0.4.24;

import "../../ActivePeriod.sol";


contract ActivePeriodWrapper {
    using ActivePeriod for ActivePeriod.History;

    ActivePeriod.History activationHistory;

    function startNewPeriodFrom(uint256 _enabledFromTime) external {
        activationHistory.startNewPeriodFrom(_enabledFromTime);
    }

    function stopCurrentPeriodAt(uint256 _disabledOnTime) external {
        activationHistory.stopCurrentPeriodAt(_disabledOnTime);
    }

    function isEnabledAt(uint256 _time) external view returns (bool) {
        return activationHistory.isEnabledAt(_time);
    }

    function getPeriod(uint256 _index) external view returns (uint128 enabledFromTime,  uint128 disabledOnTime) {
        ActivePeriod.Period memory period = activationHistory.getPeriod(_index);
        return (period.enabledFromTime, period.disabledOnTime);
    }
}
