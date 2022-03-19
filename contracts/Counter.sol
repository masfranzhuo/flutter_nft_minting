// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Counter {
  int public counter;

  constructor() {
    counter = 0;
  }

  function incrementCounter() public returns(int) {
    return counter++;
  }
}