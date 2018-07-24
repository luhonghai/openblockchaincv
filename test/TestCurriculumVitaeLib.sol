pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/data/CurriculumVitae.sol";


contract TestCurriculumVitaeLib {

    function testGenerateUniqueId() {
        // TODO not sure the right way to test it. Just to make sure the return value should not equal to zero
        uint256 id = CurriculumVitae.generateUniqueId(msg.sender);
        Assert.notEqual(id, 0, "Id should not equal to 0");
    }
}
