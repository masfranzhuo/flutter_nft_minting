const Counter = artifacts.require("Counter") ;
  
contract("Counter" , () => {
    it("should return counter value = 1" , async () => {
       const counter = await Counter.deployed();
       await counter.incrementCounter();
       const result = await counter.counter();
       assert(result == 1) ;
    });
});