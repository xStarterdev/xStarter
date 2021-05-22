// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


struct ILOProposal {
    address proposer;
    address admin;
    address fundingToken;
    string tokenName;
    string tokenSymbol;
    string infoURL;
    uint totalSupply;
    uint8 decimals; // set at 18
    uint8 percentOfTokensForILO; // (minimum 50%)
    uint blockNumber;
    uint timestamp;
    bool isApproved;
    bool isRegistered;
    bool isOpen;
    uint deployedBlockNumber;
    uint deployedTimestamp;
    bool isDeployed;
    address ILOAddress;
}
struct ILOAdditionalInfo {
    uint48 contribTimeLock;
    uint48 liqPairLockLen;
    uint48 startTime;
    uint48 endTime;
    uint minPerSwap;
    uint minPerAddr;
    uint maxPerAddr;
    uint softcap;
    uint hardcap;
    uint amountRaised;
    bool pairCreated;
    address liqPairAddr;
}

struct CompactInfo {
    ILOProposal info;
    ILOAdditionalInfo moreInfo;
}

// GOVERNANCE STRUCT

enum ProposalType{ ILO, GOV }
enum VoteChoice{ YES, NO }

struct Voter {
    uint balance; // token balance
    uint lockedBalance; // balance locked in
    ILOVoteInfo[] votes; // only allowed to have 3 active votes
    GOVVoteInfo[] gVotes;
    bool isVoter;
    // available balance is balance - lockedBalance
}

struct ILOVoteInfo {
    address proposalAddr_; // symbol of ILO proposal
    uint index; 
    uint amount;
    bool amtLocked; // if amount is part of locked balance, cleanVotes, should unlock any amount that current block > endBlock
    uint endBlock;
}

struct GOVVoteInfo {
    address proposalAddr_; // symbol of ILO proposal
    uint index; 
    uint amount;
    bool amtLocked; // if amount is part of locked balance, cleanVotes, should unlock any amount that current block > endBlock
    uint endBlock;
}
struct Vote {
    ProposalType proposalType;
    // string symbol;
    address proposalAddr;
    uint amount; // amount stake
    address voter;
    VoteChoice choice;
    
}

struct ILOPoll {
    uint yesCount;
    uint noCount;
    Vote[] votes;
    bool validated; // vote was individually validated onchain, this is not necessary, unless someone decides to validate, proposal votes 
    // bool isApproved;
    uint startBlock;
    uint endBlock;
    address validator; // who validated the ILO,
    bool approved;
    
}

struct GovPoll {
    uint yesCount;
    uint noCount;
    Vote[] votes;
    bool isValidated; // validating 
    bool isApproved;
    uint startBlock;
    uint endBlock;
    address validator; // who validated the ILO,
    
}