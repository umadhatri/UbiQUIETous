//SimpleContract
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EVault {
    address public owner; // The address that deployed the contract
    uint public totalDocuments; // Total number of documents stored

    mapping(address => bool) public lawyers; // Mapping to track authorized lawyers
    mapping(address => bool) public judges; // Mapping to track authorized judges
    mapping(address => uint) public clientDocumentCount; // Mapping to track the number of documents per client

    event DocumentUploaded(address indexed client, string documentHash);
    event PermissionGranted(address indexed client, address indexed lawyer);
    event PermissionRevoked(address indexed client, address indexed lawyer);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    modifier onlyLawyer() {
        require(lawyers[msg.sender], "Not an authorized lawyer");
        _;
    }

    modifier onlyJudge() {
        require(judges[msg.sender], "Not an authorized judge");
        _;
    }

    modifier onlyClient() {
        require(msg.sender != address(0) && !lawyers[msg.sender] && !judges[msg.sender], "Not a valid client");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    fawyerunction addLawyer(address _lawyer) external onlyOwner {
        lawyers[_l] = true;
    }

    function removeLawyer(address _lawyer) external onlyOwner {
        lawyers[_lawyer] = false;
    }

    function addJudge(address _judge) external onlyOwner {
        judges[_judge] = true;
    }

    function removeJudge(address _judge) external onlyOwner {
        judges[_judge] = false;
    }

    function uploadDocument(string memory _documentHash) external onlyClient {
        totalDocuments++;
        clientDocumentCount[msg.sender]++;
        emit DocumentUploaded(msg.sender, _documentHash);
    }

    function grantPermission(address _lawyer) external onlyClient {
        require(lawyers[_lawyer], "Not an authorized lawyer");
        emit PermissionGranted(msg.sender, _lawyer);
    }

    function revokePermission(address _lawyer) external onlyClient {
        require(lawyers[_lawyer], "Not an authorized lawyer");
        emit PermissionRevoked(msg.sender, _lawyer);
    }

    // Add additional functions as needed for document retrieval, access control, etc.
}
