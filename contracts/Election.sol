pragma solidity ^0.5.0;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Read/write candidates
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    constructor () public {
        // set default candidates
        addCandidate("Carrot");
        addCandidate("Potato");
    }

    function addCandidate (
        string memory _name
    ) private {
        candidatesCount++;
        candidates[candidatesCount] =
            Candidate(candidatesCount, _name, 0);
    }

    function vote (
        uint _candidateId
    ) public {
        // check that account hasn't voted before
        // and that candidate is valid
        require(
            !voters[msg.sender]);

        require(
            _candidateId > 0 &&
            _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;
        
        // update candidate vote Count
        candidates[_candidateId].voteCount++;

    }
}
