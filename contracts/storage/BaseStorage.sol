pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/ownership/rbac/RBAC.sol";


contract BaseStorage is RBAC, Ownable {

    string public constant ROLE_SYSTEM = "system";

    /**
     * @dev Only allow sender with role system or CV owner
     * @param _addr Address of CV owner
     */
    modifier onlySystemOrCVOwner(address _addr) {
        if (hasRole(msg.sender, ROLE_SYSTEM) || msg.sender == _addr) {
            _;
        }
    }

    /**
     * @dev Only allow CV owner
     * @param _addr Address of CV owner
     */
    modifier onlyCVOwner(address _addr) {
        if (msg.sender == _addr) {
            _;
        }
    }
}