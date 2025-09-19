// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ayusutra {
    struct Prescription {
        string patientName;
        string treatment;
        uint256 timestamp;
    }

    Prescription[] public prescriptions;

    event PrescriptionAdded(string patientName, string treatment, uint256 timestamp);

    // Store a new prescription
    function addPrescription(string memory _patientName, string memory _treatment) public {
        prescriptions.push(Prescription(_patientName, _treatment, block.timestamp));
        emit PrescriptionAdded(_patientName, _treatment, block.timestamp);
    }

    // Retrieve prescription by index
    function getPrescription(uint256 index) public view returns (string memory, string memory, uint256) {
        require(index < prescriptions.length, "Invalid index");
        Prescription memory p = prescriptions[index];
        return (p.patientName, p.treatment, p.timestamp);
    }

    // Total prescriptions stored
    function getTotalPrescriptions() public view returns (uint256) {
        return prescriptions.length;
    }
}
