// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";
import {VRFV2PlusClient} from "@chainlink/contracts/src/v0.8/vrf/dev/libraries/VRFV2PlusClient.sol";

contract VRFD20 is VRFConsumerBaseV2Plus {
    uint256 private constant RAND_NUM_GEN_IN_PROGRESS = 42;
    uint256 s_subscriptionId;
    address vrfCoordinator = 0x343300b5d84D444B2ADc9116FEF1bED02BE49Cf2;
    bytes32 s_keyHash =
        0x816bedba8a50b294e5cbd47842baf240c2385f2eaf719edbd4f250a137a8c899;
    uint32 callbackGasLimit = 80000;
    uint16 requestConfirmations = 3;
    uint32 numWords = 2;

    mapping(address => uint256[]) public addressToRandomNumber;
    mapping(uint256 => address) public requestIdToAddress;

    event DiceLanded(uint256 requestId, uint256 diceOne, uint256 diceTwo);
    event RandomNumberRequested(uint256 requestId);

    constructor(uint256 subscriptionId) VRFConsumerBaseV2Plus(vrfCoordinator) {
        s_subscriptionId = subscriptionId;
    }

    function requestRandomNumber()
        public
        onlyOwner
        returns (uint256 requestId)
    {
        requestId = s_vrfCoordinator.requestRandomWords(
            VRFV2PlusClient.RandomWordsRequest({
                keyHash: s_keyHash,
                subId: s_subscriptionId,
                requestConfirmations: requestConfirmations,
                callbackGasLimit: callbackGasLimit,
                numWords: numWords,
                extraArgs: VRFV2PlusClient._argsToBytes(
                    VRFV2PlusClient.ExtraArgsV1({nativePayment: false})
                )
            })
        );
        requestIdToAddress[requestId] = msg.sender;
        delete addressToRandomNumber[msg.sender];
        emit RandomNumberRequested(requestId);
    }

    function fulfillRandomWords(
        uint256 requestId,
        uint256[] calldata randomWords
    ) internal override {
        uint256 diceOne = (randomWords[0] % 6) + 1;
        uint256 diceTwo = (randomWords[1] % 6) + 1;

        addressToRandomNumber[requestIdToAddress[requestId]] = new uint256[](2);
        addressToRandomNumber[requestIdToAddress[requestId]][0] = diceOne;
        addressToRandomNumber[requestIdToAddress[requestId]][1] = diceTwo;

        emit DiceLanded(requestId, diceOne, diceTwo);
    }
}
