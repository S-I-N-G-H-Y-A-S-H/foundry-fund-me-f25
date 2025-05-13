// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
//Fund
//Withdraw

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundFundMe(address mostRecentlyDeployedFundMeContract) public {
        FundMe(payable(mostRecentlyDeployedFundMeContract)).fund{
            value: SEND_VALUE
        }();

        console.log("Funded FundMe with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentlyDeployedFundMeContract = DevOpsTools
            .get_most_recent_deployment("FundMe", block.chainid);
        vm.startBroadcast();
        fundFundMe(mostRecentlyDeployedFundMeContract);
        vm.stopBroadcast();
    }
} //to run this use : forge script script/Interactions.s.sol:FundFundMe --rpc-url --private-keyy

contract WithdrawFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function withdrawFundMe(address mostRecentlyDeployedFundMeContract) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployedFundMeContract)).withdraw();
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentlyDeployedFundMeContract = DevOpsTools
            .get_most_recent_deployment("FundMe", block.chainid);
        withdrawFundMe(mostRecentlyDeployedFundMeContract);
    }
}
