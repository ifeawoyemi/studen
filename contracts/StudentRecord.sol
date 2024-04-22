// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract StudentRecordManagement {
    struct Student {
        uint id;
        string name;
        uint age;
    }

    mapping(uint => Student) public students;
    uint public totalStudents;

    event StudentAdded(uint indexed _id, string _name, uint indexed _age);
    event StudentNameUpdated(uint indexed _id, string _name);
    event StudentDeleted(uint indexed _id);

    constructor() {}

    function addStudent(uint _id, string memory _name, uint _age) public {
        require(_id != 0, "Invalid ID");
        require(bytes(_name).length > 0, "Name is required");
        assert(_age > 0 && _age <= 120);
        
        students[_id] = Student(_id, _name, _age);
        totalStudents++;

        emit StudentAdded(_id, _name, _age);
    }

    function updateStudentName(uint _id, string memory _name) public {
        require(_id != 0, "Invalid ID");

        if (bytes(_name).length > 0) {
            revert("Name is required");
        }

        assert(students[_id].id != 0);

        students[_id].name = _name;

        emit StudentNameUpdated(_id, _name);
    }

    function getStudentName(uint _id) public view returns (string memory) {
        assert(students[_id].id != 0);
        return students[_id].name;
    }

    function deleteStudent(uint _id) public {
        if (_id == 0) {
            revert("Invalid ID");
        }
        if (students[_id].id == 0) {
            revert("Student does not exist");
        }
        
        delete students[_id];
        totalStudents--;

        emit StudentDeleted(_id);
    }
}
